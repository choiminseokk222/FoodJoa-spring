package com.foodjoa.member.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.foodjoa.mealkit.dao.MealkitDAO;
import com.foodjoa.mealkit.vo.MealkitOrderVO;
import com.foodjoa.mealkit.vo.MealkitReviewVO;
import com.foodjoa.mealkit.vo.MealkitVO;
import com.foodjoa.member.dao.MemberDAO;
import com.foodjoa.member.vo.CalendarVO;
import com.foodjoa.member.vo.MemberVO;
import com.foodjoa.member.vo.RecentViewVO;
import com.foodjoa.recipe.dao.RecipeDAO;
import com.foodjoa.recipe.vo.RecipeReviewVO;
import com.foodjoa.recipe.vo.RecipeWishListVO;
import com.foodjoa.mealkit.vo.MealkitCartVO;
import com.foodjoa.mealkit.vo.MealkitWishListVO;


import Common.FileIOController;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberService {
    
    @Autowired
    private MemberDAO memberDAO;
    
    @Autowired
    private RecipeDAO recipeDAO;
    
    @Autowired
    private MealkitDAO mealkitDAO;

    public int insertMember(MemberVO memberVO, MultipartHttpServletRequest multipartRequest, HttpSession session) throws Exception {
        
        String userId = (String) session.getAttribute("joinId");
        
        Iterator<String> fileNames = multipartRequest.getFileNames();
        
        String imagesPath = new ClassPathResource("").getFile().getParentFile().getParent()
                + File.separator + "src" + File.separator + "main" + File.separator + "webapp" 
                + File.separator + "resources" + File.separator + "images" + File.separator;
        
        String tempPath = imagesPath + "temp" + File.separator;

        File tempDir = new File(tempPath);
        
        if (!tempDir.exists()) {
            tempDir.mkdirs();
        }
        
        String originalFileName = "";
        if (fileNames.hasNext()) {
            String fileName = fileNames.next();
            MultipartFile mFile = multipartRequest.getFile(fileName);
            originalFileName = mFile.getOriginalFilename();
            
            if (mFile.getSize() != 0) {
                File file = new File(tempPath + originalFileName);
                mFile.transferTo(file);  // 첫 번째 파일만 저장
                
                int result = memberDAO.insertMember(memberVO);

                if (result <= 0) {
                    return result;  // 성공하지 못한 경우 result 반환
                }
                
                String destinationPath = imagesPath + "member" + File.separator + "userProfiles" 
                        + File.separator + userId;
                
                FileIOController.moveFile(tempPath, destinationPath, originalFileName);
                
                return result;  // 성공한 경우 result 반환
            }
        }
       
        return 0;
    }

	public boolean isUserExists(String userId) {
		return memberDAO.isUserExists(userId);
	}
	
	public boolean deleteMember(String readonlyId) {
	    try {
	        // 1. DB에서 회원의 프로필 파일명 가져오기
	        String profileFileName = memberDAO.getProfileFileName(readonlyId);

	        // 2. 프로필 사진이 존재하면 파일 시스템에서 삭제
	        if (profileFileName != null && !profileFileName.isEmpty()) {
	            String uploadDir = "C:\\workspace_FoodJoa\\FoodJoa\\src\\main\\webapp\\resources\\images\\member\\userProfiles\\";
	            File profileFile = new File(uploadDir + readonlyId + File.separator + profileFileName);

	            if (profileFile.exists()) {
	                boolean fileDeleted = profileFile.delete();
	                if (!fileDeleted) {
	                    // 파일 삭제 실패 시 로깅하거나 예외 처리
	                    System.out.println("파일 삭제 실패: " + profileFile.getAbsolutePath());
	                }
	            }
	        }

	        // 3. 회원의 프로필 폴더도 삭제
	        String userFolderPath = "C:\\workspace_FoodJoa\\FoodJoa\\src\\main\\webapp\\resources\\images\\member\\userProfiles\\" + readonlyId;
	        File userFolder = new File(userFolderPath);
	        if (userFolder.exists() && userFolder.isDirectory()) {
	            File[] files = userFolder.listFiles();
	            if (files != null && files.length == 0) {
	                // 폴더 안에 파일이 없으면 폴더 삭제
	                boolean folderDeleted = userFolder.delete();
	                if (!folderDeleted) {
	                    // 폴더 삭제 실패 시 로깅하거나 예외 처리
	                    System.out.println("폴더 삭제 실패: " + userFolder.getAbsolutePath());
	                }
	            }
	        }

	        // 4. DB에서 회원 삭제
	        int result = memberDAO.deleteMemberById(readonlyId);

	        // 5. 삭제 성공 여부 반환
	        return result == 1;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return false; // 예외 발생 시 false 반환
	    }
	}

	public HashMap<String, Object> getWishListInfos(String userId) {
	   
	    HashMap<String, Object> wishListInfos = new HashMap<>();
	    
	    List<RecipeWishListVO> recipeWishlists = recipeDAO.selectWishListById(userId);
	    List<MealkitWishListVO> mealkitWishlists = mealkitDAO.selectWishListById(userId);
	    
	    wishListInfos.put("recipeWishlists", recipeWishlists);
	    wishListInfos.put("mealkitWishlists", mealkitWishlists);

	    return wishListInfos;
	}
	
	public int deleteWishlist(int wishType, int no) {
		return (wishType == 0) ? 
				recipeDAO.deleteWishlist(no) : mealkitDAO.deleteWishlist(no);
	}
	
	public Map<String, List<RecentViewVO>> getRecentViews(String userId) {
	    // 최근 본 레시피와 밀키트 목록 조회
	    List<RecentViewVO> recentRecipeViews = memberDAO.recentRecipeListById(userId);
	    List<RecentViewVO> recentMealkitViews = memberDAO.recentMealkitListById(userId);
	    
	    // 결과를 담을 Map 생성
	    Map<String, List<RecentViewVO>> result = new HashMap<>();
	    
	    // Map에 데이터 삽입
	    result.put("recentRecipes", recentRecipeViews); // 레시피 목록 저장
	    result.put("recentMealkits", recentMealkitViews); // 밀키트 목록 저장
	    
	    return result; // 최종 결과 반환
	}

	
	public List<MealkitCartVO> getCartListInfos(String userId) {
	    // 장바구니 정보 가져오기
	    return memberDAO.selectCartListById(userId);
	}
	
	   // 장바구니 삭제
    public int deleteCartList(String userId, String mealkitNo) {
        return memberDAO.deleteCartList(userId, mealkitNo);
    }
    
    public int updateCartList(String userId, String mealkitNo, int quantity) {
        // 수량이 유효하면 바로 DB에 업데이트 처리
        if (quantity <= 0) {
            return -1;  // 유효하지 않은 수량
        }
        return memberDAO.updateCartList(userId, mealkitNo, quantity);
    }

    
    //결제 페이지에 정보 넘겨주장
    public List<HashMap<String, Object>> getPurchaseMealkits(HttpServletRequest request) {
        // 파라미터에서 밀키트 번호와 수량을 가져오기
        String combinedNo = request.getParameter("combinedNo");
        String combinedQuantity = request.getParameter("CombinedQuantity");
        
        // 밀키트 번호와 수량을 각각 배열로 분리
        String[] mealkitNos = combinedNo.split(",");
        String[] quantities = combinedQuantity.split(",");
        
        // DAO 메서드를 호출하여 밀키트 정보와 수량을 받아옴
        List<HashMap<String, Object>> mealkits = memberDAO.selectPurchaseMealkits(mealkitNos, quantities);
        
        // 밀키트와 수량을 매칭시켜서 반환
        for (int i = 0; i < mealkits.size(); i++) {
            HashMap<String, Object> mealkit = mealkits.get(i);
            mealkit.put("quantity", quantities[i]);  // 수량을 HashMap에 추가
        }
        
        return mealkits;  // 반환
    }
	
    //이건 구매자 정보
	public MemberVO getMember(HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		return memberDAO.selectMember(id);
	}
	
	@Transactional
	public int insertMyOrder(HttpServletRequest request, int usedPoints) {
	    String userId = (String) request.getSession().getAttribute("userId");

	    String[] mealkitNos = request.getParameterValues("mealkitNos[]");
	    String[] quantities = request.getParameterValues("quantities[]");
	    String address = request.getParameter("address");
	    String isCart = request.getParameter("isCart");

	    Integer[] mealkitNosInt = new Integer[mealkitNos.length];
	    for (int i = 0; i < mealkitNos.length; i++) {
	        try {
	            mealkitNosInt[i] = Integer.parseInt(mealkitNos[i]);
	        } catch (NumberFormatException e) {
	            System.out.println("Invalid mealkitNo: " + mealkitNos[i]);
	            return -1;
	        }
	    }

	    Integer[] quantitiesInt = new Integer[quantities.length];
	    for (int i = 0; i < quantities.length; i++) {
	        try {
	            quantitiesInt[i] = Integer.parseInt(quantities[i]);
	        } catch (NumberFormatException e) {
	            System.out.println("Invalid quantity: " + quantities[i]);
	            return -1;
	        }
	    }
	    int result = memberDAO.insertMyOrder(userId, mealkitNosInt, quantitiesInt, address, isCart);
	    // 총 결제 금액 계산
	    int totalPrice = 0;
	    for (int i = 0; i < mealkitNosInt.length; i++) {
	        int price = memberDAO.getMealkitPrice(mealkitNosInt[i]); // 상품 가격 조회
	        totalPrice += price * quantitiesInt[i];
	    }

	    // 사용한 포인트 차감
	    int finalAmount = totalPrice - usedPoints;
	    if (finalAmount < 0) {
	        finalAmount = 0; // 포인트가 결제 금액을 초과하지 않도록 보정
	    }
	    
	    int pointsToAdd = (int) (finalAmount * 0.05);
	    
	    memberDAO.updateMemberPoint(userId, usedPoints, pointsToAdd);

	    // 장바구니에서 항목 삭제
	    result = 1;
	    if (isCart.equals("1")) {
	        return memberDAO.deleteCartList(userId, mealkitNosInt);
	    }

	    return result;
	}



	public MemberVO getMemberById(String id) {
	    return memberDAO.selectMember(id); 
	}

	public ArrayList<Integer> getCountOrderDelivered(String userId) {
		return memberDAO.selectCountOrderDelivered(userId);
	}

	public ArrayList<Integer> getCountOrderSended(String userId) {
		return memberDAO.selectCountOrderSended(userId);
	}

	public List<MealkitOrderVO> getDeliveredMealkit(String id) {
		return mealkitDAO.selectDeliveredMealkits(id);
	}
		
	public List<MealkitOrderVO> getSendedMealkit(String id) {
		return mealkitDAO.selectSendedMealkits(id);
	}

	public int updateProfile(MemberVO memberVO, MultipartHttpServletRequest multipartRequest, String originProfile) 
			throws Exception {
		
		String imagesPath = new ClassPathResource("").getFile().getParentFile().getParent()
				+ File.separator + "src" + File.separator + "main" + File.separator + "webapp" 
				+ File.separator + "resources" + File.separator + "images" + File.separator;
		
		String tempPath = imagesPath + "temp" + File.separator;

		File tempDir = new File(tempPath);
		
		if (!tempDir.exists()) {
			tempDir.mkdirs();
        }

		Iterator<String> fileNames = multipartRequest.getFileNames();
		String originalFileName = "";
		
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			originalFileName = mFile.getOriginalFilename();
			
			if (mFile.getSize() != 0) {
				mFile.transferTo(new File(tempPath + originalFileName));
			}			
		}
		
		boolean flag = false;
		if (originalFileName == null || originalFileName.length() <= 0 || originalFileName.equals("")) {
			flag = true;
			originalFileName = originProfile;
		}
		
		memberVO.setProfile(originalFileName);
		
		int result = memberDAO.updateMember(memberVO);	
		
		if (result <= 0) {			
			FileIOController.deleteFile(tempPath, originalFileName);			
			return result;
		}
		
		if (!flag) {
			String destinationPath = imagesPath + "member" + File.separator + "userProfiles" 
					+ File.separator + memberVO.getId() + File.separator;

			FileIOController.deleteFile(destinationPath, originProfile);
			FileIOController.moveFile(tempPath, destinationPath, originalFileName);
		}
		
		return result;
	}
	
	public int updateOrder(int orderNo, int deliveredStatus, int refundStatus) {
	    return memberDAO.updateOrderStatus(orderNo, deliveredStatus, refundStatus);
	}
	
	public HashMap<String, Object> getReviews(String userId) {
		
		HashMap<String, Object> reviews = new HashMap<String, Object>();
		
		List<RecipeReviewVO> recipeReviews = recipeDAO.selectReviewsById(userId);
		List<MealkitReviewVO> mealkitReviews = mealkitDAO.selectReviewsById(userId);
		
		reviews.put("recipeReviews", recipeReviews);
		reviews.put("mealkitReviews", mealkitReviews);
		
		return reviews;
	}

	public void addCalendar(CalendarVO calendar) {
	   
	    memberDAO.insertCalendar(calendar);
	}

	public List<CalendarVO> getUserCalendars(String userId) {
	    return memberDAO.selectCalendars(userId);
	}

    public void deleteCalendarByUserId(String userId, int no) {
        memberDAO.deleteCalendarByUserId(userId, no); 
    }

	public void addPointsToRecommender(String recommenderId, int point) {

        MemberVO recommender = memberDAO.findById(recommenderId); // DAO에서 추천인 조회

        if (recommender != null) {
            // 2. 추천인에게 포인트 추가
            int currentPoints = recommender.getPoint();  // 현재 포인트
            recommender.setPoint(currentPoints + point);  // 포인트 추가
            
            System.out.println("추천인 -----------------------------------" + recommender);
            System.out.println("현재포인트 -----------------------------------" + currentPoints);
            System.out.println("추가할 포인트 -----------------------------------" + point);

            // 3. DB에 포인트 변경 사항 저장
            memberDAO.updatePoints(recommender);  // 포인트 업데이트
        }
	}
}

