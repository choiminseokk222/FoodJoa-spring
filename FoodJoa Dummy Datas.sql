
-- member 
insert into member
values('admin', '관리자', '고나리자', '01012345678', 'foodjoa@test.com','47296', '부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
	('review1', '김리뷰', '리뷰어1', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review2', '이리뷰', '리뷰어2', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review3', '박리뷰', '리뷰어3', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review4', '최리뷰', '리뷰어4', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    
    ('geonyongId', '이건용', '은익', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('hanaId', '이하나', '나리', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('aronId', '서아론', '아론', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('hyewonId', '이혜원', '혜원', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('minseokId', '최민석', '민석', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    
	('tQi32Qj0iONPLRZ16-5sX4-Gq_p8Jg_T33r-HdtLEFE', '네이버테스트', '네이버테스트', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('3837872024', '카카오테스트', '카카오테스트', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('E5WfZ9Dw6uy3PzDsAkaKOEdHtykh5sgibCaIt7BqYqM', '고나리자', '공지고나리자', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('nokzVx9aXFXFaCu-4sOTujR0FkNtw-zrSsY1kwwgNdM', '아론', '아론', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('oTcuaqH712AhGERfeDDh7sKhFyWoPrKcNhIujhF73vk', '혜원', '혜원', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('WR1ZpRIM2ktSXjEzf0nI5NMU9JU_ASY6UXjh6ROLA4o', '민석', '민석', '01012345678', 'foodjoa@test.com','47296', ' 부산 부산진구 신천대로50번길 79', ' 5층, 6층(부전동)', 'profile.png', 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY);
    
    

-- recipe
insert into recipe(id, title, thumbnail, description, contents, category, views,
ingredient, ingredient_amount, orders, post_date) 
values('hanaId', '비빔밥', 'korean1.png', '한국을 대표하는 음식 중 하나', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 1, FLOOR(RAND() * 50),
	'0008비빔밥 재료 10008비빔밥 재료 2','0009비빔밥 재료량 10009비빔밥 재료량 1', '0011비빔밥 조리 순서 10011비빔밥 조리 순서 20011비빔밥 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('aronId', '떡국', 'korean2.jpg', '한국 설날의 음식', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 1, FLOOR(RAND() * 50),
	'0007떡국 재료 10007떡국 재료 2','0008떡국 재료량 10008떡국 재료량 1', '0010떡국 조리 순서 10010떡국 조리 순서 20010떡국 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('hyewonId', '산적', 'korean3.jpg', '명절 차례상엔 이게 필수', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 1, FLOOR(RAND() * 50),
	'0007산적 재료 10007산적 재료 2','0008산적 재료량 10008산적 재료량 1', '0010산적 조리 순서 10010산적 조리 순서 20010산적 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    
    ('aronId', '스키야키', 'japanese1.png', '뜨끈한 국물이 일품인 냄비요리', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 2, FLOOR(RAND() * 50),
	'0009스키야키 재료 10009스키야키 재료 2','0010스키야키 재료량 10010스키야키 재료량 1', '0012스키야키 조리 순서 10012스키야키 조리 순서 20012스키야키 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('geonyongId', '회덮밥', 'japanese2.png', '일본을 대표하는 스시를 얹은 덮밥', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 2, FLOOR(RAND() * 50),
	'0008회덮밥 재료 10008회덮밥 재료 2','0009회덮밥 재료량 10009회덮밥 재료량 1', '0011회덮밥 조리 순서 10011회덮밥 조리 순서 20011회덮밥 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('minseokId', '오코노미야키', 'japanese3.png', '일본 철판요리의 최강자', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 2, FLOOR(RAND() * 50),
	'0011오코노미야키 재료 10011오코노미야키 재료 2','0012오코노미야키 재료량 10012오코노미야키 재료량 1', '0014오코노미야키 조리 순서 10014오코노미야키 조리 순서 20014오코노미야키 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    
    ('aronId', '탕수육', 'chinese1.png', '중국 튀김요리 중 단연 대표주자', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 3, FLOOR(RAND() * 50),
	'0008탕수육 재료 10008탕수육 재료 2','0009탕수육 재료량 10009탕수육 재료량 1', '0011탕수육 조리 순서 10011탕수육 조리 순서 20011탕수육 조리 순서 3', now()),
    ('admin', '해물짬뽕', 'chinese2.png', '해산물이 잔뜩 들어간 얼큰하고 시원한 면요리', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 3, FLOOR(RAND() * 50),
	'0009해물짬뽕 재료 10009해물짬뽕 재료 2','0010해물짬뽕 재료량 10010해물짬뽕 재료량 1', '0012해물짬뽕 조리 순서 10012해물짬뽕 조리 순서 20012해물짬뽕 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('hyewonId', '자장면', 'chinese3.png', '어린시절 추억이 젖어있는 바로 그 요리', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 3, FLOOR(RAND() * 50),
	'0008자장면 재료 10008자장면 재료 2','0009자장면 재료량 10009자장면 재료량 1', '0011자장면 조리 순서 10011자장면 조리 순서 20011자장면 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    
    ('hanaId', '안심 스테이크', 'western1.jpg', '부드러운 식감에 환상적인 맛', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 4, FLOOR(RAND() * 50),
	'0012안심 스테이크 재료 10012안심 스테이크 재료 2','0013안심 스테이크 재료량 10013안심 스테이크 재료량 1', '0015안심 스테이크 조리 순서 10015안심 스테이크 조리 순서 20015안심 스테이크 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('hyewonId', '해물 파스타', 'western2.jpg', '쫄깃한 식감이 살아있는 파스타', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 4, FLOOR(RAND() * 50),
	'0011해물 파스타 재료 10011해물 파스타 재료 2','0012해물 파스타 재료량 10012해물 파스타 재료량 1', '0014해물 파스타 조리 순서 10014해물 파스타 조리 순서 20014해물 파스타 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('minseokId', '바베큐 폭립', 'western3.jpg', '바베큐 파티 요리의 황태자', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 4, FLOOR(RAND() * 50),
	'0011바베큐 폭립 재료 10011바베큐 폭립 재료 2','0012바베큐 폭립 재료량 10012바베큐 폭립 재료량 1', '0014바베큐 폭립 조리 순서 10014바베큐 폭립 조리 순서 20014바베큐 폭립 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    
    ('geonyongId', '간장 계란밥', 'self1.jpg', '자취 요리의 근본, 가끔씩 생각나는 그 맛', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 5, FLOOR(RAND() * 50),
	'0011간장 계란밥 재료 10011간장 계란밥 재료 2','0012간장 계란밥 재료량 10012간장 계란밥 재료량 1', '0014간장 계란밥 조리 순서 10014간장 계란밥 조리 순서 20014간장 계란밥 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('minseokId', '김치 볶음밥', 'self2.jpg', '쫄깃한 식감이 살아있는 파스타', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 5, FLOOR(RAND() * 50),
	'0011김치 볶음밥 재료 10011김치 볶음밥 재료 2','0012김치 볶음밥 재료량 10012김치 볶음밥 재료량 1', '0014김치 볶음밥 조리 순서 10014김치 볶음밥 조리 순서 20014김치 볶음밥 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('hanaId', '스팸 덮밥', 'self3.jpg', '가끔씩 부리는 사치', 'eJyzKbB73Nr4uLX9cWsfiNGyBcRu2WmjX2AHAOteD+U=', 5, FLOOR(RAND() * 50),
	'0010스팸 덮밥 재료 10010스팸 덮밥 재료 2','0011스팸 덮밥 재료량 10011스팸 덮밥 재료량 1', '0013스팸 덮밥 조리 순서 10013스팸 덮밥 조리 순서 20013스팸 덮밥 조리 순서 3', NOW() - INTERVAL FLOOR(RAND() * 60) DAY);
	
insert into recipe_review(id, recipe_no, pictures, contents, rating, post_date)
values('review1', '1', '0018test_thumbnail.png', '리뷰 내용', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review2', '1', '0018test_thumbnail.png', '리뷰 내용', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review3', '1', '0018test_thumbnail.png', '리뷰 내용', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review1', '2', '0018test_thumbnail.png', '리뷰 내용', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review2', '2', '0018test_thumbnail.png', '리뷰 내용', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review1', '3', '0018test_thumbnail.png', '리뷰 내용', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review2', '3', '0018test_thumbnail.png', '리뷰 내용', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review3', '3', '0018test_thumbnail.png', '리뷰 내용', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
    ('review4', '3', '0018test_thumbnail.png', '리뷰 내용', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY);
    
insert into recipe_wishlist(id, recipe_no, choice_date) 
values('admin', 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('admin', 2, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('admin', 3, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('admin', 4, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('admin', 5, NOW() - INTERVAL FLOOR(RAND() * 60) DAY);



-- mealkit
INSERT INTO mealkit (id, title, contents, category, price, stock, pictures, orders, origin, views, soldout, post_date) VALUES
('geonyongId', '소곱창전골', '신선한 재료로 만든 곱창전골 키트입니다.', 1, '14500', 30, '0012gopchang.jpg', '0008곱창전골 순서10008곱창전골 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hanaId', '베지가든 불고기 볶음밥', '맛있는 불고기를 집에서 쉽게 만들 수 있는 키트입니다.', 1, '17500', 15, '0012ddockbul.jpg', '0011뚝배기 불고기 순서10011뚝배기 불고기 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('minseokId', '사천마라탕', '다양한 재료로 만든 마라탕 키트입니다.', 3, '13000', 20, '0012maratang.jpg', '0007마라탕 순서10007마라탕 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('aronId', '팔도짜장면', '짜장면을 집에서 즐길 수 있는 키트입니다.', 3, '12000', 40, '0011jajang.jpeg', '0007짜장면 순서10007짜장면 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hyewonId', '미니오꼬노미야끼', '오꼬노미야끼를 쉽게 만들 수 있는 키트입니다.', 2, '16000', 15, '0015okonomiyaki.jpg', '0010오꼬노미야끼 순서10010오꼬노미야끼 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('geonyongId', '스지전골', '신선한 재료로 만든 스지나베 키트입니다.', 2, '14500', 30, '0012sujinabe.png', '0008스지나베 순서10008스지나베 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hanaId', '스테이크모둠', '맛있는 스테이크를 집에서 쉽게 만들 수 있는 키트입니다.', 4, '17500', 15, '0009steak.jpg', '0008스테이크 순서10008스테이크 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('minseokId', '투움바 파스타', '가게같은 맛이 나는 투움바파스타 키트입니다.', 4, '13000', 20, '0018toowoombapasta.jpg', '0011투움바 파스타 순서10011투움바 파스타 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('aronId', '맛있는집밥김치찌개', '매콤한 김치찌개를 집에서 즐길 수 있는 키트입니다.', 1, '12000', 20, '0016kimchijjigae.jpg', '0008김치찌개 순서10008김치찌개 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hyewonId', '매콤밀푀유나베', '다양한 재로로 만든 밀푀유나베를 쉽게 만들 수 있는 키트입니다.', 2, '16000', 20, '0021millefeuillenabe.jpeg', '0009밀푀유나베 순서10009밀푀유나베 순서2', '한국', 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY);

INSERT INTO mealkit_order (id, mealkit_no, address, quantity, delivered, refund, post_date) VALUES
('review1', 1, '서울시 강남구 123-45', 20, 0, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review2', 2, '부산시 해운대구 67-89', 10, 1, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review3', 3, '대구시 중구 11-22', 15, 0, 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review4', 4, '인천시 남동구 33-44', 5, 2, 0, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review1', 5, '광주시 북구 55-66', 12, 0, 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY);

INSERT INTO mealkit_review (id, mealkit_no, pictures, contents, rating, post_date) VALUES
('review1', 1, '0018test_thumbnail.png', '정말 맛있어요! 재구매 의사 100%', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review2', 1, '0018test_thumbnail.png', '좋은 재료로 만들어져서 만족합니다.', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review3', 2, '0018test_thumbnail.png', '보통이에요. 기대보다 덜 맛있었어요.', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review4', 2, '0018test_thumbnail.png', '양이 적은 것 같지만 맛은 좋았어요.', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review1', 3, '0018test_thumbnail.png', '가족 모두가 좋아했어요!', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review2', 4, '0018test_thumbnail.png', '재료가 신선하지 않았어요.', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review3', 4, '0018test_thumbnail.png', '가격 대비 괜찮은 편입니다.', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review4', 5, '0018test_thumbnail.png', '정말 훌륭한 맛! 추천합니다.', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review1', 5, '0018test_thumbnail.png', '다음에도 또 구매할게요.', FLOOR(RAND() * 5) + 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY);

INSERT INTO mealkit_wishlist (id, mealkit_no, choice_date) VALUES
('review1', 1, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review2', 2, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review3', 3, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review4', 4, NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review1', 5, NOW() - INTERVAL FLOOR(RAND() * 60) DAY);

-- community
insert into community(id, title, contents, views, post_date)
values
('geonyongId', '감을 하루에 1개만 먹으라니"…감 섭취 시 주의사항은?', '감은 아삭한 단감, 부드러운 홍시, 쫄깃한 곶감까지 취향에 따라 골라 먹는 재미가 있어 많은 사람들의 입맛을 사로잡는다. 비타민과 식이섬유가 풍부해 영양 면에서도 뛰어난 감은 숙취 해소, 뇌졸중 예방, 설사 완화 등 건강에 도움을 주는 자연식품으로 잘 알려져 있다. 하지만 체질이나 건강 상태에 따라 섭취에 주의가 필요하다.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review1', '캔 쉽게 따는 법 공유하는 자유게시판 게시글입니다', '아무리 힘을 세게 줘도 캔 뚜껑이 도저히 열리지 않을 때 너무 답답하시죠? 네 저도 답답해요 숟가락 하나만 있으면 안전하고 간편하게 캔 뚜껑을 딸 수 있어요.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('aronId', '낙지 공동 구매해서 먹어보았는데요 시식 후기 작성글입니다', '우리집은 보통매운맛도 조금 맵싹해서 양배추 같이 볶아 먹고 있어요. 쭈꾸미 먹어보고 맛있어서 낙지도 시켜봤는데, 쭈꾸미가 더 오동통한 것 같아요! 350g짜리는 여러 반찬 중 하나로 내어 먹기 좋고, 500g짜리는 특별히 더 반찬 꺼내지 않아도 둘이 밥 다 먹을 정도예요.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hanaId', '요즘 김치 담글 줄 아는 사람도 있나요', '30대 요알못(요리를 알지 못하는) 주부 사이에선 이런 말이 심심찮게 나올 정도로 김치 만드는 법을 모르는 사람이 많다. 김장을 담가 주던 부모 세대 역시 김장을 포기하는 경우가 많다. 직접 담근 김치만큼 믿고 먹을 만한 게 없는데 겨울 가족 식탁에 올릴 김치를 어디서 구해야 할까. 이 같은 고민을 하는 요즘 도시 주부들이 선택하는 선택지가 바로 김장 체험이다.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('minseokId', '겨울 별미 과메기·보양식 복어 12월 이달의 수산물로 선정', '과메기, 심혈관계 질환 예방 좋은 음식…칼슘 함량 높아 영양식으로도 적합 복어, 감칠맛 뛰어난 고급 식재… 맹독 함유, 반드시 전문 자격 조리사가 요리해야 합니다', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('geonyongId', '감을 하루에 1개만 먹으라니"…감 섭취 시 주의사항은?', '감은 아삭한 단감, 부드러운 홍시, 쫄깃한 곶감까지 취향에 따라 골라 먹는 재미가 있어 많은 사람들의 입맛을 사로잡는다. 비타민과 식이섬유가 풍부해 영양 면에서도 뛰어난 감은 숙취 해소, 뇌졸중 예방, 설사 완화 등 건강에 도움을 주는 자연식품으로 잘 알려져 있다. 하지만 체질이나 건강 상태에 따라 섭취에 주의가 필요하다.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review1', '캔 쉽게 따는 법 공유하는 자유게시판 게시글입니다', '아무리 힘을 세게 줘도 캔 뚜껑이 도저히 열리지 않을 때 너무 답답하시죠? 네 저도 답답해요 숟가락 하나만 있으면 안전하고 간편하게 캔 뚜껑을 딸 수 있어요.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('aronId', '낙지 공동 구매해서 먹어보았는데요 시식 후기 작성글입니다', '우리집은 보통매운맛도 조금 맵싹해서 양배추 같이 볶아 먹고 있어요. 쭈꾸미 먹어보고 맛있어서 낙지도 시켜봤는데, 쭈꾸미가 더 오동통한 것 같아요! 350g짜리는 여러 반찬 중 하나로 내어 먹기 좋고, 500g짜리는 특별히 더 반찬 꺼내지 않아도 둘이 밥 다 먹을 정도예요.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hanaId', '요즘 김치 담글 줄 아는 사람도 있나요', '30대 요알못(요리를 알지 못하는) 주부 사이에선 이런 말이 심심찮게 나올 정도로 김치 만드는 법을 모르는 사람이 많다. 김장을 담가 주던 부모 세대 역시 김장을 포기하는 경우가 많다. 직접 담근 김치만큼 믿고 먹을 만한 게 없는데 겨울 가족 식탁에 올릴 김치를 어디서 구해야 할까. 이 같은 고민을 하는 요즘 도시 주부들이 선택하는 선택지가 바로 김장 체험이다.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review2', '겨울 별미 과메기·보양식 복어 12월 이달의 수산물로 선정', '과메기, 심혈관계 질환 예방 좋은 음식…칼슘 함량 높아 영양식으로도 적합 복어, 감칠맛 뛰어난 고급 식재… 맹독 함유, 반드시 전문 자격 조리사가 요리해야 합니다', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('geonyongId', '감을 하루에 1개만 먹으라니"…감 섭취 시 주의사항은?', '감은 아삭한 단감, 부드러운 홍시, 쫄깃한 곶감까지 취향에 따라 골라 먹는 재미가 있어 많은 사람들의 입맛을 사로잡는다. 비타민과 식이섬유가 풍부해 영양 면에서도 뛰어난 감은 숙취 해소, 뇌졸중 예방, 설사 완화 등 건강에 도움을 주는 자연식품으로 잘 알려져 있다. 하지만 체질이나 건강 상태에 따라 섭취에 주의가 필요하다.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review1', '캔 쉽게 따는 법 공유하는 자유게시판 게시글입니다', '아무리 힘을 세게 줘도 캔 뚜껑이 도저히 열리지 않을 때 너무 답답하시죠? 네 저도 답답해요 숟가락 하나만 있으면 안전하고 간편하게 캔 뚜껑을 딸 수 있어요.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('aronId', '낙지 공동 구매해서 먹어보았는데요 시식 후기 작성글입니다', '우리집은 보통매운맛도 조금 맵싹해서 양배추 같이 볶아 먹고 있어요. 쭈꾸미 먹어보고 맛있어서 낙지도 시켜봤는데, 쭈꾸미가 더 오동통한 것 같아요! 350g짜리는 여러 반찬 중 하나로 내어 먹기 좋고, 500g짜리는 특별히 더 반찬 꺼내지 않아도 둘이 밥 다 먹을 정도예요.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('admin', '요즘 김치 담글 줄 아는 사람도 있나요', '30대 요알못(요리를 알지 못하는) 주부 사이에선 이런 말이 심심찮게 나올 정도로 김치 만드는 법을 모르는 사람이 많다. 김장을 담가 주던 부모 세대 역시 김장을 포기하는 경우가 많다. 직접 담근 김치만큼 믿고 먹을 만한 게 없는데 겨울 가족 식탁에 올릴 김치를 어디서 구해야 할까. 이 같은 고민을 하는 요즘 도시 주부들이 선택하는 선택지가 바로 김장 체험이다.', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hyewonId', '겨울 별미 과메기·보양식 복어 12월 이달의 수산물로 선정', '과메기, 심혈관계 질환 예방 좋은 음식…칼슘 함량 높아 영양식으로도 적합 복어, 감칠맛 뛰어난 고급 식재… 맹독 함유, 반드시 전문 자격 조리사가 요리해야 합니다', FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY);


insert into share(id, thumbnail, title, contents, lat, lng, views, post_date)
values('geonyongId','test_thumbnail.png', '반찬, 국 등 품앗이 하실분', '직접 식재료를 골라 만드는데. 식재료는 대량으로 해야 싸고, 맛있게 만들려면 이재료 저재료 들어가서 한솥이 되고 소분해서 냉동해도 감당이 안되네요. 나눔 좌표는 아래에 찍어둘게요!', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review1','test_thumbnail.png', '직접 만든빵 가져가실 분~', '학생들이 연습용으로 만든 빵이 너무 많이 남아서 좀 나눠드리려구요 나눔 희망하시는 분 여기 위치로 오시면 됩니다', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hanaId','test_thumbnail.png', '알타리김치가 집에 너무 많아서 한 통만 나눠드릴게요', '시어머니가 김치를 많이 보내주셨는데 집에서 밥을 잘 해먹지 않고 냉장고 자리도 많이 차지해 나눔하려구요 위치는 여기입니다',37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('admin','test_thumbnail.png', '12월 2일 고나리자가 주최하는 밥 번개', '오후 8시쯤 다같이 삼겹살 먹어요! 만나는 장소는 지도로 찍어둘게요', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review3','test_thumbnail.png', '푸드조아 와인 제 41회차 정기 모임', '01.18 목요일 오후 9시 서면 삼정타워 뒤 푸드조아 건물입니ㅏ. 회비 7,000원입니다', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('geonyongId','test_thumbnail.png', '반찬, 국 등 품앗이 하실분', '직접 식재료를 골라 만드는데. 식재료는 대량으로 해야 싸고, 맛있게 만들려면 이재료 저재료 들어가서 한솥이 되고 소분해서 냉동해도 감당이 안되네요. 나눔 좌표는 아래에 찍어둘게요!', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('admin','test_thumbnail.png', '직접 만든빵 가져가실 분~', '학생들이 연습용으로 만든 빵이 너무 많이 남아서 좀 나눠드리려구요 나눔 희망하시는 분 여기 위치로 오시면 됩니다', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hanaId','test_thumbnail.png', '알타리김치가 집에 너무 많아서 한 통만 나눠드릴게요', '시어머니가 김치를 많이 보내주셨는데 집에서 밥을 잘 해먹지 않고 냉장고 자리도 많이 차지해 나눔하려구요 위치는 여기입니다',37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('admin','test_thumbnail.png', '12월 2일 고나리자가 주최하는 밥 번개', '오후 8시쯤 다같이 삼겹살 먹어요! 만나는 장소는 지도로 찍어둘게요', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review3','test_thumbnail.png', '푸드조아 와인 제 41회차 정기 모임', '01.18 목요일 오후 9시 서면 삼정타워 뒤 푸드조아 건물입니ㅏ. 회비 7,000원입니다', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('geonyongId','test_thumbnail.png', '반찬, 국 등 품앗이 하실분', '직접 식재료를 골라 만드는데. 식재료는 대량으로 해야 싸고, 맛있게 만들려면 이재료 저재료 들어가서 한솥이 되고 소분해서 냉동해도 감당이 안되네요. 나눔 좌표는 아래에 찍어둘게요!', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('aronId','test_thumbnail.png', '직접 만든빵 가져가실 분~', '학생들이 연습용으로 만든 빵이 너무 많이 남아서 좀 나눠드리려구요 나눔 희망하시는 분 여기 위치로 오시면 됩니다', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('hanaId','test_thumbnail.png', '알타리김치가 집에 너무 많아서 한 통만 나눠드릴게요', '시어머니가 김치를 많이 보내주셨는데 집에서 밥을 잘 해먹지 않고 냉장고 자리도 많이 차지해 나눔하려구요 위치는 여기입니다',37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('admin','test_thumbnail.png', '12월 2일 고나리자가 주최하는 밥 번개', '오후 8시쯤 다같이 삼겹살 먹어요! 만나는 장소는 지도로 찍어둘게요', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
('review3','test_thumbnail.png', '푸드조아 와인 제 41회차 정기 모임', '01.18 목요일 오후 9시 서면 삼정타워 뒤 푸드조아 건물입니ㅏ. 회비 7,000원입니다', 37.3595704, 127.105399, FLOOR(RAND() * 50), NOW() - INTERVAL FLOOR(RAND() * 60) DAY);

insert into notice(title, contents, post_date)
values("푸드조아 프로젝트 시작합니다!", "푸드조아 프로젝트 시작합니다!", DATE_SUB(NOW(), INTERVAL 6 MONTH)),
	("푸드조아 홈페이지가 개설되었습니다! ", "푸드조아 홈페이지가 개설되었습니다!", DATE_SUB(NOW(), INTERVAL 5 MONTH)),
	("내가 직접 개발한 레시피를 사람들과 공유해봐요!", "내가 직접 개발한 레시피를 사람들과 공유해봐요!", DATE_SUB(NOW(), INTERVAL 4 MONTH)),
	("나만의 요리를 다른사람에게 판매해보세요!", "나만의 요리를 다른사람에게 판매해보세요!", DATE_SUB(NOW(), INTERVAL 3 MONTH)),
	("사람들과 자유롭게 대화 해보세요!", "사람들과 자유롭게 대화 해보세요!", DATE_SUB(NOW(), INTERVAL 2 MONTH)),
	("음식을 공유하거나, 맛집을 서로 공유해봐요!", "음식을 공유하거나, 맛집을 서로 공유해봐요!", DATE_SUB(NOW(), INTERVAL 1 MONTH)),
	("FoodJoa에서 여러분을 기다립니다.", "FoodJoa에서 여러분을 기다립니다.", NOW());
    
INSERT INTO together(id, title, contents, pictures, lat, lng, join_date, place, people, finished, post_date)
VALUES("hyewonId", "제1회 푸드조아 와인 모임", "모임 게시판 내용1", "00051.png00052.png00053.png", 37.3595704, 127.105399, "2024-12-31 14:00:00", "푸드조아 건물", 20, 1, "2024-11-01 13:00:00"),
("geonyongId", "마카롱 만들기 원데이 클래스", "모임 게시판 내용2", "00054.png00055.png00056.png", 37.3595704, 127.105399, "2025-01-04 14:00:00", "푸드조아 건물", 14, 0, "2024-12-01 13:00:00"),
("hanaId", "크리스마스 솔로 모임", "모임 게시판 내용3", "00057.png00058.png00059.png", 37.3595704, 127.105399, "2024-12-25 14:00:00", "푸드조아 건물", 20, 1, "2024-12-11 13:00:00");

INSERT INTO together_reply(id, together_no, contents, post_date)
VALUES("geonyongId", 1, "참석합니다.", FROM_UNIXTIME(UNIX_TIMESTAMP('2024-11-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-31 14:00:00') - UNIX_TIMESTAMP('2024-11-01 13:00:00'))))),
("hanaId", 1, "참석합니다.", FROM_UNIXTIME(UNIX_TIMESTAMP('2024-11-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-31 14:00:00') - UNIX_TIMESTAMP('2024-11-01 13:00:00'))))),
("admin", 1, "참석합니다.", FROM_UNIXTIME(UNIX_TIMESTAMP('2024-11-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-31 14:00:00') - UNIX_TIMESTAMP('2024-11-01 13:00:00'))))),

("review1", 2, "참석합니다.", FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2025-01-04 14:00:00') - UNIX_TIMESTAMP('2024-12-01 13:00:00'))))),
("aronId", 2, "참석합니다.", FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2025-01-04 14:00:00') - UNIX_TIMESTAMP('2024-12-01 13:00:00'))))),
("minseokId", 2, "참석합니다.", FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2025-01-04 14:00:00') - UNIX_TIMESTAMP('2024-12-01 13:00:00'))))),
("review2", 2, "참석합니다.", FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2025-01-04 14:00:00') - UNIX_TIMESTAMP('2024-12-01 13:00:00'))))),

("hyewonId", 3, "참석합니다.", FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-11 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-25 14:00:00') - UNIX_TIMESTAMP('2024-12-11 13:00:00'))))),
("review3", 3, "참석합니다.", FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-11 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-25 14:00:00') - UNIX_TIMESTAMP('2024-12-11 13:00:00')))));

INSERT INTO together_join(id, together_no, post_date)
VALUES("geonyongId", 1, FROM_UNIXTIME(UNIX_TIMESTAMP('2024-11-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-31 14:00:00') - UNIX_TIMESTAMP('2024-11-01 13:00:00'))))),
("hanaId", 1, FROM_UNIXTIME(UNIX_TIMESTAMP('2024-11-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-31 14:00:00') - UNIX_TIMESTAMP('2024-11-01 13:00:00'))))),
("admin", 1, FROM_UNIXTIME(UNIX_TIMESTAMP('2024-11-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-31 14:00:00') - UNIX_TIMESTAMP('2024-11-01 13:00:00'))))),

("review1", 2, FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2025-01-04 14:00:00') - UNIX_TIMESTAMP('2024-12-01 13:00:00'))))),
("aronId", 2, FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2025-01-04 14:00:00') - UNIX_TIMESTAMP('2024-12-01 13:00:00'))))),
("minseokId", 2, FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2025-01-04 14:00:00') - UNIX_TIMESTAMP('2024-12-01 13:00:00'))))),
("review2", 2, FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-01 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2025-01-04 14:00:00') - UNIX_TIMESTAMP('2024-12-01 13:00:00'))))),

("hyewonId", 3, FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-11 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-25 14:00:00') - UNIX_TIMESTAMP('2024-12-11 13:00:00'))))),
("review3", 3, FROM_UNIXTIME(UNIX_TIMESTAMP('2024-12-11 13:00:00') + FLOOR(RAND() * (UNIX_TIMESTAMP('2024-12-25 14:00:00') - UNIX_TIMESTAMP('2024-12-11 13:00:00')))));

commit;