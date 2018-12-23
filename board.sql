create table board(
	no number primary key, -- key
	writer varchar2(20) not null, -- 작성자
	title varchar2(50) not null, -- 제목
	content varchar2(500) not null, -- 본문
	email varchar2(30) , -- 이메일
	hits number default 0, -- 읽은 횟수
	pw varchar2(12) not null, -- 암호
	reg_date date not null, -- 작성일
	del char(1), --삭제 여부
	tag varchar2(20) --게시판 유형
);

alter table board drop column EMAIL;
create SEQUENCE p_seq
start with 1
increment by 1
nomaxvalue;
update board set del='Y' where no=18
	update board set title='1616',content='1616' where no=18

select * from BOARD where tag='notice' and del='Y'
select * from BOARD where tag='notice' and (title like '%'||'내용'||'%' or content like '%'||'내용'||'%')

insert into board values(p_seq.nextval,'작성자','글쓰기테스트','글쓰기테스트','kutae@a.com',0,'1234',sysdate,'n','notice');
insert into board values(p_seq.nextval,'작성자','판매 테스트','판매 내용','kutae@a.com',0,'1234',sysdate,'n','sell');
insert into board values(p_seq.nextval,'작성자','구매 테스트','구매 내용','kutae@a.com',0,'1234',sysdate,'n','buy');
insert into board values(p_seq.nextval,'작성자','이벤트 테스트','이벤트 내용','kutae@a.com',0,'1234',sysdate,'n','event');
insert into board values(p_seq.nextval,'작성자','헬프 테스트','헬프 내용','kutae@a.com',0,'1234',sysdate,'n','help');
insert into board values(p_seq.nextval,'작성자','노하우 테스트','노하우 내용','kutae@a.com',0,'1234',sysdate,'n','knowhow');