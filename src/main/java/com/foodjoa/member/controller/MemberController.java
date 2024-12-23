package com.foodjoa.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.foodjoa.mealkit.vo.MealkitCartVO;
import com.foodjoa.mealkit.vo.MealkitOrderVO;
import com.foodjoa.mealkit.vo.MealkitVO;
import com.foodjoa.member.dao.MemberDAO;
import com.foodjoa.member.service.MemberService;
import com.foodjoa.member.vo.CalendarVO;
import com.foodjoa.member.vo.MemberVO;
import com.foodjoa.member.vo.RecentViewVO;

import Common.SNSLoginAPI;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("Member")
public class MemberController {
    
    @Autowired
    private MemberService memberService;
    
    @Autowired
    private MemberVO memberVO;
    
    @Autowired
    private ServletContext servletContext;
 
    //---------------------------------------
    
    // SNS 회원가입 페이지로 이동
    @RequestMapping("snsjoin")
    public String snsjoin() {
        return "/members/snsjoin";  // Tiles에 맞게 경로 반환
    }
    
    @RequestMapping("naverjoin")
    public void naverjoin(HttpServletRequest request, HttpServletResponse response) throws Exception {
     
       String userId = SNSLoginAPI.handleNaverLogin(
             request.getParameter("code"),
             request.getParameter("state"));
       
       handleJoin(request, response, userId);
    }
    
    @RequestMapping("kakaojoin")
    public void kakaojoin(HttpServletRequest request, HttpServletResponse response) throws Exception {

       String userId = SNSLoginAPI.handleKakaoJoin(request.getParameter("code"));
       handleJoin(request, response, userId);
    }
    
    private void handleJoin(HttpServletRequest request, HttpServletResponse response, String userId) throws Exception {

       response.setContentType("text/html; charset=utf-8");
      PrintWriter out = response.getWriter();
      
       if (userId == null || userId.length() <= 0 || userId.trim().isEmpty()) {
          
          out.print("<script>");
          out.print("alert('아이디 정보를 받아오는데 실패했습니다.');");
          out.print("history.go(-1);");
          out.print("</script>");
          
          out.close();
          
          return;
       }

       request.getSession().setAttribute("joinId", userId);
       
       out.println("<script>");
      out.println("location.href='" + request.getContextPath() + "/Member/join';");
      out.println("</script>");
      out.close();
    }

    // 추가 정보 입력 페이지로 리다이렉트할 때 처리하는 메소드
    @RequestMapping("join")
    public String join() {       
       return "/members/join";
   }

	// 추가정보입력 후 회원 가입 처리
    @RequestMapping("joinPro")
    public String joinPro(MemberVO memberVO, HttpSession session, HttpServletRequest request, MultipartHttpServletRequest mRequest) throws Exception {
        // 1. 회원가입 처리
        int result = memberService.insertMember(memberVO, mRequest, session);

        // 2. 회원가입이 성공했다면
        if (result > 0) {
            session.setAttribute("userId", session.getAttribute("joinId"));
            session.removeAttribute("joinId");

            // 3. 추천인 아이디 처리
            String userId = request.getParameter("recommender"); // HttpServletRequest로 추천인 아이디 받기
             
            if (userId != null && !userId.isEmpty()) {
                // 4. 추천인 아이디가 존재하는지 확인
                boolean recommenderExists = memberService.isUserExists(userId); // 추천인 아이디로 회원 찾기
                
                if (recommenderExists) {
                    // 5. 추천인에게 포인트 500 지급
                    memberService.addPointsToRecommender(userId, 500); // 추천인에게 포인트 지급
                }
            }
        }

        return "redirect:/Main/home";
    }
    
    //--------------------------여기까지 회원가입 처리
    
    //----------이제 로그인 차례
    
    @RequestMapping("login")
   private String login() {
      return "/members/login";  // 리다이렉트할 경로
   }

    // 네이버 로그인 처리 메소드
    @RequestMapping("naverlogin")
    private void naverlogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
       
       response.setContentType("text/html; charset=utf-8");
       
       String userId = SNSLoginAPI.handleNaverLogin(
             request.getParameter("code"),
             request.getParameter("state"));
       
       handleLogin(request, response, userId);
    }

    // 카카오 로그인 처리 메소드
    @RequestMapping("kakaologin")
    private void kakaologin(HttpServletRequest request, HttpServletResponse response) throws Exception {
       
       response.setContentType("text/html; charset=utf-8");
       
       String userId = SNSLoginAPI.handleKakaoLogin(request.getParameter("code"));

       handleLogin(request, response, userId);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response, String userId)
          throws Exception {
       
       PrintWriter out = response.getWriter();
       
       if (userId == null || userId.length() <= 0 || userId.trim().isEmpty()) {
          
          out.print("<script>");
          out.print("alert('아이디 정보를 받아오는데 실패했습니다.');");
          out.print("history.go(-1);");
          out.print("</script>");
          
          out.close();
          
          return;
       }
       
       boolean isUserExists = memberService.isUserExists(userId);
       
       // SNS 로그인 성공 및 회원정보 있을 때
       if (isUserExists) {
          request.getSession().setAttribute("userId", userId);
          response.sendRedirect(request.getContextPath() + "/Main/home");
          
         return;
      }
       
       request.getSession().setAttribute("joinId", userId);
       
      out.println("<script>");
      out.println("alert('회원가입이 필요합니다. 회원가입 페이지로 이동합니다.');");
      out.println("location.href='" + request.getContextPath() + "/Member/join';");
      out.println("</script>");
      out.close();
    }
 
    //----------------------------------로그인 끝
    
    //---------------------로그아웃
    
    // 로그아웃 처리
    @RequestMapping("logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        // 세션 무효화
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }

        // 리다이렉트: 로그아웃 후 메인 페이지로 이동
        return "redirect:/Main/home"; // Spring에서는 "redirect:"를 사용하여 리다이렉트
    }
    
    //-----탈퇴
    
    @RequestMapping("deleteMember")
    public String deleteMember(){
       return "/members/deleteMember";
   }
    
    @RequestMapping("deleteMemberPro")
    private String deleteMemberPro(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 세션에서 로그인된 사용자 아이디를 가져옵니다.
        HttpSession session = request.getSession();
        String readonlyId = (String) session.getAttribute("userId");

        // 사용자가 입력한 아이디를 가져옵니다.
        String inputId = request.getParameter("inputId");

        // 아이디가 일치하지 않을 경우
        if (readonlyId == null || !readonlyId.equals(inputId)) {
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('아이디가 일치하지 않습니다.');");
            out.print("history.go(-1);");
            out.print("</script>");
            out.close();
            return null; // 여기서 리턴하지 않고 바로 끝내고 페이지 이동
        }

        // 서비스 레이어를 호출하여 탈퇴 처리
        boolean isDeleted = memberService.deleteMember(readonlyId);

        // 탈퇴 성공 시 세션 무효화 및 메인 페이지로 이동
        if (isDeleted) {
            session.invalidate(); // 세션 무효화

            // 리다이렉트 전에 알림 창을 띄운 후, 메인 페이지로 이동
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('탈퇴 되셨습니다.');");
            out.print("window.location.href='/FoodJoa/Main/home';"); // 리다이렉트 전에 알림창 띄우고 이동
            out.print("</script>");
            out.close();
            return null;
        } else {
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();
            out.print("<script>");
            out.print("alert('탈퇴 처리 중 오류가 발생하였습니다. 다시 시도 해주세요.');");
            out.print("history.go(-1);");
            out.print("</script>");
            out.close();
            return null; // 다시 페이지로 돌아가도록 처리
        }
    }

    //-------------------------탈퇴처리 완료
    
    @RequestMapping("wishlist")
    public String wishlist(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");

        // 위시리스트 정보 가져오기
        HashMap<String, Object> wishListInfos = memberService.getWishListInfos(userId);
        
        // 분리하여 전달
        model.addAttribute("wishListInfos", wishListInfos);

        // 메인 페이지로 포워딩
        return "/members/wishlist";
    }
    
    @ResponseBody
    @RequestMapping(value = "deleteWishlist", method = { RequestMethod.GET, RequestMethod.POST })
    public String deleteWishlist(@RequestParam int wishType, @RequestParam int no) {
       
       return String.valueOf(memberService.deleteWishlist(wishType, no));
    }
    
    @RequestMapping("recentlist")
    public String recentlist(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");

        // 서비스에서 데이터를 가져오기
        Map<String, List<RecentViewVO>> recentViewInfos = memberService.getRecentViews(userId);

        // JSP에 전달 (서비스의 Map 키와 일치해야 함)
        model.addAttribute("recipes", recentViewInfos.get("recentRecipes")); // recentRecipes로 수정
        model.addAttribute("mealKits", recentViewInfos.get("recentMealkits")); // recentMealkits로 수정
        
        return "/members/recent";
    }



         
    @RequestMapping("cartlist")
    public String cartlist(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");

        // 서비스에서 카트 리스트 정보 가져오기
        List<MealkitCartVO> cartListInfos = memberService.getCartListInfos(userId);

        // 모델에 데이터 추가
        model.addAttribute("cartListInfos", cartListInfos);

        // 뷰 이름 반환
        return "/members/cartlist";
    }
    
    // 장바구니 삭제
    @RequestMapping("deleteCartList")
    public String deleteCartList(@RequestParam("userId") String userId, 
                                 @RequestParam("mealkitNo") String mealkitNo,
                                 RedirectAttributes redirectAttributes) {
        int result = memberService.deleteCartList(userId, mealkitNo);

        if (result == 1) {
            // 삭제 성공
            redirectAttributes.addFlashAttribute("message", "삭제 성공!");
            return "redirect:/Member/cartlist"; // 리다이렉트
        } else if (result == 0) {
            // 삭제 실패: 해당 레시피는 장바구니에 없음
            redirectAttributes.addFlashAttribute("message", "삭제 실패: 해당 레시피는 장바구니에 없습니다.");
            return "redirect:/Member/cartlist";
        } else {
            // DB 통신 오류
            redirectAttributes.addFlashAttribute("message", "DB 통신 오류가 발생했습니다.");
            return "redirect:/Member/cartlist";
        }
    }

    // 장바구니 수량 업데이트
    @RequestMapping("updateCartList")
    public String updateCartList(@RequestParam("userId") String userId,
                                 @RequestParam("mealkitNo") String mealkitNo,
                                 @RequestParam("quantity") String quantityStr,
                                 RedirectAttributes redirectAttributes) {
        // 수량 값 유효성 검사
        int quantity = 0;
        try {
            quantity = Integer.parseInt(quantityStr);
            if (quantity <= 0) {
                redirectAttributes.addFlashAttribute("message", "수량 값이 0 이하입니다. 유효한 수량을 입력하세요.");
                return "redirect:/Member/cartlist";
            }
        } catch (NumberFormatException e) {
            redirectAttributes.addFlashAttribute("message", "수량 값이 잘못되었습니다: " + quantityStr);
            return "redirect:/Member/cartlist";
        }

        // 서비스 계층을 통해 수량 업데이트
        int result = memberService.updateCartList(userId, mealkitNo, quantity);

        if (result == 1) {
            // 업데이트 성공
            redirectAttributes.addFlashAttribute("message", "수량 업데이트 성공!");
        } else if (result == 0) {
            // 업데이트 실패: 해당 항목이 없음
            redirectAttributes.addFlashAttribute("message", "수량 업데이트 실패: 해당 항목이 장바구니에 없습니다.");
        } else {
            // DB 통신 오류
            redirectAttributes.addFlashAttribute("message", "DB 통신 오류가 발생했습니다.");
        }

        return "redirect:/Member/cartlist";
    }
    
    @RequestMapping("payment")
    public String payment(Model model, @RequestParam(required = false) String isCart, HttpServletRequest request) {
        
        // 주문 정보와 회원 정보를 가져옴
        List<HashMap<String, Object>> orders = memberService.getPurchaseMealkits(request);
        MemberVO myInfo = memberService.getMember(request); 
        
        // Model에 데이터 추가
        model.addAttribute("orders", orders);
        model.addAttribute("myInfo", myInfo);
        model.addAttribute("isCart", isCart); 
    
        // View 이름 반환
        return "/members/payment"; 
    }

    @ResponseBody
    @RequestMapping(value = "insertMyOrder", method = { RequestMethod.GET, RequestMethod.POST })
    public String insertMyOrder(HttpServletRequest request, @RequestParam(value = "usedPoints", defaultValue = "0") int usedPoints) {
        // 포인트를 사용했는지와 사용한 포인트를 서비스로 넘기기
        int result = memberService.insertMyOrder(request, usedPoints);
        
        return String.valueOf(result); 
    }


    @RequestMapping("mypagemain")
    public String mypagemain(Model model, HttpSession session,
            @ModelAttribute CalendarVO calendar,
            @RequestParam(value = "userId", required = false) String userIdParam) {
    	
        String sessionUserId = (String) session.getAttribute("userId");
        String userId = (userIdParam != null && !userIdParam.trim().isEmpty()) ? userIdParam : sessionUserId;

        if (userId == null || userId.trim().isEmpty()) {
            return "redirect:/Member/login";
        }

        MemberVO member = memberService.getMemberById(userId);
        ArrayList<Integer> deliveredCounts = memberService.getCountOrderDelivered(userId);
        ArrayList<Integer> sendedCounts = memberService.getCountOrderSended(userId);

        model.addAttribute("member", member);
        model.addAttribute("deliveredCounts", deliveredCounts);
        model.addAttribute("sendedCounts", sendedCounts);
        
        List<CalendarVO> calendarList = memberService.getUserCalendars(userId);

        model.addAttribute("calendarList", calendarList);
   
        return "/members/mypagemain";
    }


    @RequestMapping("profileupdate")
    public String profileupdate(Model model, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        
        MemberVO vo = memberService.getMemberById(userId); 
        
        model.addAttribute("vo", vo);

        return "/members/profileupdate";
    }
    
    @ResponseBody
    @RequestMapping(value = "updatePro", method = { RequestMethod.GET, RequestMethod.POST })
    public String updatePro(MemberVO memberVO, MultipartHttpServletRequest multipartRequest,
          @RequestParam String originProfile) throws Exception {
        
       int result = memberService.updateProfile(memberVO, multipartRequest, originProfile);
       
       return String.valueOf(result);
    }

    
    @RequestMapping("impormation")
    private String impormation() {
      return "/members/impormation";
   }
    
   @RequestMapping(value = "myreviews", method = { RequestMethod.GET, RequestMethod.POST })
    public String myreviews(Model model, HttpSession session) {
       
      HashMap<String, Object> reviews = memberService.getReviews((String) session.getAttribute("userId"));
      
      model.addAttribute("reviews", reviews);
      
      return "/members/myreview";
    }

    @RequestMapping("mydelivery")
    public String mydelivery(Model model, HttpSession session) {
        // 세션에서 사용자 ID 가져오기
        String id = (String) session.getAttribute("userId");

        // 서비스 호출
        List<MealkitOrderVO> deliveredMealkitList = memberService.getDeliveredMealkit(id);
        
        // 모델에 데이터 추가
        model.addAttribute("deliveredMealkitList", deliveredMealkitList);

        return "/members/mydelivery";
    }

    @RequestMapping("sendmealkit")
    public String sendmealkit(Model model, HttpSession session) {
        // 세션에서 사용자 ID 가져오기
        String id = (String) session.getAttribute("userId");

        // 서비스 호출
        List<MealkitOrderVO> orderedMealkitList = memberService.getSendedMealkit(id);

        // 모델에 데이터 추가
        model.addAttribute("orderedMealkitList", orderedMealkitList);

        return "/members/sendmealkit";
    }
    
    @RequestMapping("orderupdate")
    public void updateOrder(
        @RequestParam("orderNo") int orderNo,
        @RequestParam("deliveredStatus") int deliveredStatus,
        @RequestParam("refundStatus") int refundStatus,
        HttpServletResponse response) throws IOException {

        // 주문 정보 업데이트
        int result = memberService.updateOrder(orderNo, deliveredStatus, refundStatus);

        // 응답 설정
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        // 응답 메시지 전송
        if (result > 0) {
            out.print("저장되었습니다.");  // 성공 메시지
        } else {
            out.print("저장에 실패했습니다.");  // 실패 메시지
        }
        out.close();  // 응답 스트림 닫기
    }

    @RequestMapping("addCalendar")
    public String addCalendar(CalendarVO calendar, HttpSession session) {
        String userId = (String) session.getAttribute("userId");

        calendar.setId(userId);

        memberService.addCalendar(calendar);

        return "redirect:/Member/mypagemain";
    }

    @RequestMapping("deleteCalendar")
    public String deleteCalendar(@RequestParam String Id, @RequestParam int no, HttpSession session) {
        String userId = (String) session.getAttribute("userId");         
  
        memberService.deleteCalendarByUserId(userId, no);

        return "redirect:/Member/mypagemain";
    }
    }