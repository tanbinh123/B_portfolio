--DB설계
-- 관리자 아이디 인덱스, 아이디, 비밀번호
drop table shopping_admin;
create table shopping_admin(
    admin_idx number(4) primary key,
    admin_id    varchar2(20),
    admin_pw    varchar2(20)
);

drop sequence shopping_admin_seq;
create sequence shopping_admin_seq;


-- 회원가입
​-- 인덱스, 아이디, 비밀번호, 이름, 이메일
drop table shopping_member;
create table shopping_member(
    member_idx       number(4) primary key,
    member_id      varchar2(20),
    member_pw     varchar2(20),
    member_name   varchar2(20),
    member_email   varchar2(100)
);
​--회원가입 시퀀스
drop sequence shopping_member_seq;
create sequence shopping_member_seq;
​

-- DB 삽입 문구 예시
insert into shopping_member(member_idx, member_id, member_pw, member_name, member_email) 
values (shopping_member_seq.nextval, 'hong', '1234', '홍길동', 'test@gmail.com');

   
--공지사항
--인덱스, 제목, 내용, 올린날짜
drop table shopping_notice;
create table shopping_notice(
    notice_idx      number(4) primary key,
    notice_title    varchar2(100),
    notice_content  varchar2(2000),
    notice_date     date default sysdate
);
​--공지사항 시퀀스
drop sequence shopping_notice_seq;
create sequence shopping_notice_seq;   
   
--주문내역
-- 인덱스, 상품 이미지, 상품명, 상품가격, 상품 갯수, 상품배송상태,회원이름,회원 이메일 (이름, 이메일 두가지는 관리자 화면에서 사용), 회원인덱스 연동
-- items_status 배송완료 시 상품평 작성 가능 연동
-- 1 = 배송준비 2 = 배송중 3 = 배송완료
drop table shopping_items;
 CREATE TABLE "EZEN"."SHOPPING_ITEMS" 
   (	"ITEMS_IDX" NUMBER(4,0), 
	"ITEMS_TITLE" VARCHAR2(100 BYTE), 
	"ITEMS_PRICE" NUMBER(38,0), 
	"ITEMS_STATUS" NUMBER(4,0), 
	"ITEMS_STATUS2" VARCHAR2(100 BYTE), 
	"ITEMS_MEMBER_IDX" NUMBER(4,0), 
	"ITEMS_ORDER_IDX" NUMBER(4,0)
   )
--주문내역 시퀀스
drop sequence shopping_items_seq;
create sequence shopping_items_seq;

--장바구니
-- 인덱스, 상품이미지, 상품명, 상품가격, 회원인덱스 연동
drop table shopping_cartItems;
CREATE TABLE "EZEN"."SHOPPING_CARTITEMS" 
   (	"CART_IDX" NUMBER(4,0), 
	"CART_IMG" VARCHAR2(255 BYTE), 
	"CART_ITEM_IDX" NUMBER(4,0), 
	"CART_TITLE" VARCHAR2(100 BYTE), 
	"CART_PRICE" NUMBER(38,0), 
	"CART_NUMB" NUMBER(4,0), 
	"CART_MEMBER_IDX" NUMBER(4,0), 
	"CART_TOTALPRICE" NUMBER(38,0), 
	"CART_MEMBER_ID" VARCHAR2(100 BYTE)
   )
--장바구니 시퀀스
drop sequence shopping_cartItems_seq;
create sequence shopping_cartItems_seq;

--상품평
-- 인덱스, 별점, 내용, 주문내역 연동, 작성일
drop table shopping_review;
create table shopping_review(
    review_idx      number(4) primary key,
    review_star        number(4),
    review_content    varchar2(100),
    review_items_idx  number(4),
    review_date     date default sysdate
);
​--상품평 시퀀스
drop sequence shopping_review_seq;
create sequence shopping_review_seq;

--자주묻는질문/FAQ
--인덱스, 제목, 이름, 내용

drop table shopping_faq;
create table shopping_faq(
    faq_idx      number(4) primary key,
    faq_title    varchar2(100),
    faq_content  varchar2(2000)
);
​-- FAQ 시퀀스
drop sequence shopping_faq_seq;
create sequence shopping_faq_seq;
   
insert into shopping_faq(faq_idx, faq_title, faq_content)
values (shopping_faq_seq.nextval, '자주 묻는 질문입니다'|| shopping_faq_seq.nextval , '컨텐츠입니다'|| shopping_faq_seq.nextval)
   
-- 묻고답하기

--인덱스, 제목, 이름, 비밀번호, 내용, 작성일

drop table shopping_qna;
create table shopping_qna(
    qna_idx      number(4) primary key,
    qna_title    varchar2(100),
    qna_name     varchar2(20),
    qna_pw       varchar2(20),
    qna_content  varchar2(2000),
    qna_date     date default sysdate
);

-- 묻고답하기 시퀀스
drop sequence shopping_qna_seq;
create sequence shopping_qna_seq;

-- qna 글쓰기
insert into shopping_qna(qna_idx, qna_title, qna_name, qna_pw, qna_content, qna_date)
values (shopping_qna_seq.nextval, '글제목', '홍길동', '1234', '글내용', sysdate);

-- 묻고답하기 댓글

--인덱스, 이름, 내용, 작성일

drop table shopping_qna_reply;
create table shopping_qna_reply(
    reply_idx      number(4) primary key,
    reply_name     varchar2(20),
    reply_content  varchar2(2000),
    reply_date     date default sysdate,
    reply_qna_idx  number(4)
);

-- 묻고답하기댓글 시퀀스
drop sequence shopping_qna_reply_seq;
create sequence shopping_qna_reply_seq;

-- 댓글쓰기
insert into shopping_qna_reply(REPLY_IDX, REPLY_NAME, REPLY_CONTENT, reply_date, REPLY_QNA_IDX) 
VALUES (shopping_qna_reply_seq.nextval, '작성자', '댓글내용', sysdate, 1); 

--상품 등록 (관리자 전용)
--인덱스, 상품명, 상품가격, 상품설명, 상품수량, 상품 이미지

drop table shopping_add;
create table shopping_add(
    add_idx     number(4) primary key,
    add_title   varchar2(100),
    add_price   varchar2(100),
    add_content varchar2(100),
    add_count   number(4),
    add_img    varchar2(255)
);

--상품등록 시퀀스
drop sequence shopping_add_seq;
create sequence shopping_add_seq;

commit;



--환불 신청 

drop table shopping_cancel
create table shoppong_cancel(
    cancel_idx  number(4) primary key,
    cancel_id   varchar2(100),
    cancel_title varchar2(100),
    cancel_content varchar2(2000),
    cancel_status   varchar2(100)
);

create sequence shopping_cancel_seq;
drop sequence shopping_cancel_seq;

create table shopping_orderInfo(
    orderInfo_idx     number(4) primary key,
    orderInfo_addressNumb number(30),
    orderInfo_address varchar2(100),
    orderInfo_address_detail varchar2(100),
    orderInfo_address_extra varchar2(100),
    orderInfo_status varchar2(100),
    orderInfo_name  varchar2(100),
    orderInfo_phone varchar2(100),
    
    orderInfo_member_id varchar2(100)
    );
    
    drop table shopping_orderInfo
    
    insert into shopping_orderInfo(orderInfo_idx, orderInfo_addressNumb, orderInfo_address, orderInfo_address_detail, orderInfo_address_extra, orderInfo_status,orderInfo_name, orderInfo_phone, orderInfo_member_id)
    values(shopping_orderInfo_seq.nextval, #{orderInfo_addressNumb}, #{orderInfo_address}, #{orderInfo_address_detail}, #{orderInfo_address_extra}, #{orderInfo_status},#{orderInfo_name},#{orderInfo_phone},#{orderInfo_member_id})
    create sequence shopping_orderInfo_seq;




 CREATE TABLE "EZEN"."SHOPPING_TOTALORDER" 
   (	"ORDER_IDX" NUMBER(4,0), 
	"ORDER_IMG" VARCHAR2(100 BYTE), 
	"ORDER_TITLE" VARCHAR2(100 BYTE), 
	"ORDER_PRICE" NUMBER(38,0), 
	"ORDER_TOTALPRICE" VARCHAR2(100 BYTE), 
	"ORDER_NUMB" NUMBER(4,0), 
	"ORDER_MEMBER_IDX" NUMBER(4,0), 
	"ORDER_MEMBER_ID" VARCHAR2(100 BYTE)
   )

   create sequence SHOPPING_TOTALORDER_seq;