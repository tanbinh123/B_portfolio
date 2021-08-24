--DB설계
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
-- 인덱스, 상품명, 상품가격, 상품 갯수, 상품배송상태,회원이름,회원 이메일 (이름, 이메일 두가지는 관리자 화면에서 사용), 회원인덱스 연동
-- items_status 배송완료 시 상품평 작성 가능 연동
-- 1 = 배송준비 2 = 배송중 3 = 배송완료
drop table shopping_items;
create table shopping_items(
    items_idx       number(4) primary key,
    items_title     varchar2(100),
    items_price     varchar2(100),
    items_numb      number(4),
    items_status    number(4),
    items_name      varchar2(100),
    items_email     varchar2(100),
    items_member_idx    number(4)
)
--주문내역 시퀀스
drop sequence shopping_items_seq;
create sequence shopping_items_seq;

--장바구니
-- 인덱스, 상품명, 상품가격, 회원인덱스 연동
drop table shopping_cartItems;
create table shopping_cartItems(
    citems_idx       number(4) primary key,
    citems_title     varchar2(100),
    citems_price     varchar2(100),
    citems_member_idx    number(4)
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
    faq_name     varchar2(100),
    faq_content  varchar2(2000)
);
​-- FAQ 시퀀스
drop sequence shopping_faq_seq;
create sequence shopping_faq_seq;
   
   
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



--상품 등록 (관리자 전용)
--인덱스, 상품명, 상품가격, 상품설명, 상품수량, 상품키워드

drop table shopping_add;
create table shopping_add(
    add_idx     number(4) primary key,
    add_title   varchar2(100),
    add_price   varchar2(100),
    add_content varchar2(100),
    add_count   number(4),
    add_keyword varchar2(100)
);

--상품등록 시퀀스
drop sequence shopping_add_seq;
create sequence shopping_add_seq;


