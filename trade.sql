
create table trade(
	no number primary key, -- key
	id varchar2(20), -- id
	writer varchar2(40) not null, -- 작성자
	pw varchar2(12) not null, -- 암호
	reg_date date not null, -- 작성일
	item varchar2(40) not null, --아이템 명
	price varchar2(40) not null, -- 금액
	soldout char(1), -- 팔렸는지 여부 
	tag varchar(10), --구매,판매 태그
	del char(1), --삭제 여부
	discount char(1) --흥정여부

);
select * from trade where id='1' and tag='buy'
insert into trade values(t_seq.nextval,'작성자','내용','1234',sysdate,'item','5억','N','buy','N','O');
select * from trade
alter table trade add(keyword varchar(20));
alter table trade modify (price VARCHAR2(60));
alter table trade drop column keyword;
delete from trade;

update trade set del='Y', writer='a' where no=1


drop table trade;
create SEQUENCE t_seq
start with 1
increment by 1
nomaxvalue;
drop SEQUENCE t_seq
select * from trade where tag='sell' and item like '%'||123||'%'