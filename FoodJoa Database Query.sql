DROP DATABASE IF EXISTS foodjoa;
CREATE DATABASE foodjoa;

USE foodjoa;

DROP TABLE IF EXISTS member;
CREATE TABLE member(
    id 			varchar(50) primary key not null,
    name 		varchar(20) not null,
    nickname 	varchar(10) not null,
    phone 		varchar(15) not null,
    email		varchar(50) not null,
    zipcode 	varchar(50) not null,
    address1 	varchar(50) not null,
    address2 	varchar(50) not null,
    profile 	varchar(50) not null,
    point		int not null,
    join_date 	timestamp not null
);




DROP TABLE IF EXISTS recipe;
CREATE TABLE recipe(
	no 					int primary key auto_increment,
    id 					varchar(50) not null,
    title 				varchar(50) not null,
    thumbnail 			varchar(50) not null,
    description			varchar(100) not null,
    contents 			longtext not null,
    category 			tinyint not null,
    views 				int not null,
    ingredient 			varchar(255) not null,
    ingredient_amount 	varchar(255) not null,
    orders 				varchar(255) not null,
    post_date			timestamp not null,
    
    FOREIGN KEY (id) REFERENCES member(id) ON DELETE CASCADE
);

drop table if exists recipe_review;
create table recipe_review(
	no 				int primary key auto_increment,
    id 				varchar(50) not null,
    recipe_no 		int not null,
    pictures 		text not null,
    contents 		text not null,
    rating 			int not null,
    post_date		timestamp,
    
    FOREIGN KEY (id) REFERENCES member(id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_no) REFERENCES recipe(no) ON DELETE CASCADE
);

drop table if exists recipe_wishlist;
create table recipe_wishlist(
	no 				int primary key auto_increment,
    id 				varchar(50) not null,
    recipe_no 		int not null, 
    choice_date		timestamp not null DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id) REFERENCES member(id) ON DELETE CASCADE,
    FOREIGN KEY (recipe_no) REFERENCES recipe(no) ON DELETE CASCADE
);




DROP TABLE IF EXISTS mealkit;
CREATE TABLE mealkit(
    no            int primary key auto_increment,
	id            varchar(50) not null,
	title         varchar(50) not null,
	contents      text not null,
	category      tinyint not null,
	price         varchar(10) not null,
    stock		  int not null,
	pictures      text not null,
	orders        varchar(255) not null,
	origin        varchar(255) not null,
	views         int not null,
	soldout       tinyint not null,
	post_date     timestamp not null,

    foreign key (id) references member(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS mealkit_order;
CREATE TABLE mealkit_order(
	no			int primary key auto_increment,
    id			varchar(50) not null,
    mealkit_no	int not null,
    address		varchar(50) not null,
    quantity	int not null,
    delivered	tinyint not null,
    refund		tinyint not null,
    post_date	timestamp not null,
    
    foreign key (id) references member(id) ON DELETE CASCADE,
    foreign key (mealkit_no) references mealkit(no) ON DELETE CASCADE
);

DROP TABLE IF EXISTS mealkit_review;
CREATE TABLE mealkit_review(
	no			int primary key auto_increment,
    id			varchar(50) not null,
    mealkit_no	int not null,
    pictures	text not null,
    contents	text not null,
    rating		int not null,
    post_date	timestamp not null,
    
    foreign key (id) references member(id) ON DELETE CASCADE,
    foreign key (mealkit_no) references mealkit(no) ON DELETE CASCADE
);

DROP TABLE IF EXISTS mealkit_wishlist;
CREATE TABLE mealkit_wishlist(
	no			int primary key auto_increment,
    id			varchar(50) not null,
    mealkit_no	int not null,
	choice_date	timestamp not null DEFAULT CURRENT_TIMESTAMP,
    
    foreign key (id) references member(id) ON DELETE CASCADE,
    foreign key (mealkit_no) references mealkit(no) ON DELETE CASCADE
);



DROP TABLE IF EXISTS mealkit_cart;
CREATE TABLE mealkit_cart(
	no			int primary key auto_increment,
    id			varchar(50) not null,
    mealkit_no	int not null,
    quantity    int not null,
	choice_date	timestamp not null DEFAULT CURRENT_TIMESTAMP,
    
    foreign key (id) references member(id) ON DELETE CASCADE,
    foreign key (mealkit_no) references mealkit(no) ON DELETE CASCADE
);





DROP TABLE IF EXISTS community;
create table community(
	no 			int primary key auto_increment,
    id 			varchar(50) not null, 
	title 		varchar(50) not null,
    contents	text not null,
    views		int not null,
    post_date	timestamp not null,
    
    foreign key(id) references member(id) ON DELETE CASCADE
);

drop table IF EXISTS community_share;
drop table IF EXISTS share;
create table share(
	no 				int primary key auto_increment,
    id 				varchar(50) not null,
    thumbnail 		varchar(255) not null,
    title 			varchar(50) not null,
    contents 		longtext not null,
    lat 			double not null,
    lng 			double not null,
    views 			int not null,
	post_date 		timestamp not null,

	FOREIGN KEY (id) REFERENCES member(id) ON DELETE CASCADE
);



DROP TABLE IF EXISTS recent_view;
create table recent_view(
	no			int primary key auto_increment,
    id			varchar(50) not null,
    item_no     int not null, 
    type		tinyint not null,
    view_date   TIMESTAMP not null,

    foreign key(id) references member(id) ON DELETE CASCADE
);



DROP TABLE IF EXISTS notice;
CREATE TABLE notice(
	no 			int primary key auto_increment,
    title 		varchar(50) not null,
    contents 	text not null,
    views 		int not null default 0,
    post_date 	timestamp not null default current_timestamp
);



DROP TABLE IF EXISTS together;
CREATE TABLE together(
	no 				int primary key auto_increment,
    id 				varchar(50) not null,
    title 			varchar(50) not null,
    contents 		longtext not null,
    pictures 		longtext not null,
    lat 			double not null,
    lng 			double not null,
    join_date 		timestamp not null,
    place 			varchar(255) not null,
	people 			int not null,
    finished 		tinyint not null default 0,
    views 			int not null default 0,
    post_date 		timestamp not null default current_timestamp,
    
    foreign key(id) references member(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS together_reply;
CREATE TABLE together_reply(
	no 				int primary key auto_increment,
    id 				varchar(50) not null,
    together_no 	int not null,
    contents 		longtext not null,
    post_date 		timestamp not null default current_timestamp,
    
    foreign key(together_no) references together(no) ON DELETE CASCADE,
    foreign key(id) references member(id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS together_join;
CREATE TABLE together_join(
	no 				int primary key auto_increment,
    id 				varchar(50) not null,
    together_no 	int not null,
    post_date 		timestamp not null default current_timestamp,
    
    foreign key(together_no) references together(no) ON DELETE CASCADE,
    foreign key(id) references member(id) ON DELETE CASCADE
);

CREATE TABLE calendar (
    no INT AUTO_INCREMENT PRIMARY KEY, -- 고유번호
    id VARCHAR(50) NOT NULL,           -- 사용자 ID
    summary VARCHAR(255) NOT NULL,     -- 제목
    description TEXT NOT NULL,         -- 설명
    location VARCHAR(255),             -- 장소
    start_time DATETIME NOT NULL,      -- 시작 시간
    end_time DATETIME NOT NULL,         -- 종료 시간
    
    foreign key(id) references member(id) ON DELETE CASCADE
);

COMMIT;