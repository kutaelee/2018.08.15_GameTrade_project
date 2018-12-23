create table member(
	no number primary key, -- key
	id varchar2(20) unique not null , -- id
	pw varchar2(20) not null, -- 암호
	email varchar2(50) unique not null, -- 이메일	
	del char(1), --삭제 여부
	grade number default 0, --멤버등급
	imsi varchar2(20) -- 임시비밀번호같은 임시 데이터
);
drop table member

alter table member add(imsi varchar2(20))
alter table member modify (pw varchar2(20))
select * from MEMBER
delete from MEMBER where email='1234567@naver.com'
select * from member where email='1414141@na.com'
select * from member where id='123456'
select * from member where id='1' and pw='1'
insert into trade values(t_seq.nextval,'작성자','제목','내용','1234',sysdate,'item','5억','N','sell','N','O');
select * from member
alter table member add(grade number default 0);
alter table trade drop(grade)
alter table trade modify (price VARCHAR2(60));
delete from trade;
drop table trade;

alter table member modify (email varchar2(50) [unique] [not null]);

update member set grade=5 where id='admin'

create SEQUENCE m_seq
start with 1
increment by 1
nomaxvalue;






insert into board values(p_seq.nextval,'작성자','제목','내용','kutae@a.com',0,'1234',sysdate,'n','notice');
insert into board values(p_seq.nextval,'작성자','판매 테스트','판매 내용','kutae@a.com',0,'1234',sysdate,'n','sell');
insert into board values(p_seq.nextval,'작성자','구매 테스트','구매 내용','kutae@a.com',0,'1234',sysdate,'n','buy');
insert into board values(p_seq.nextval,'작성자','이벤트 테스트','이벤트 내용','kutae@a.com',0,'1234',sysdate,'n','event');
insert into board values(p_seq.nextval,'작성자','헬프 테스트','헬프 내용','kutae@a.com',0,'1234',sysdate,'n','help');
insert into board values(p_seq.nextval,'작성자','노하우 테스트','노하우 내용','kutae@a.com',0,'1234',sysdate,'n','knowhow');