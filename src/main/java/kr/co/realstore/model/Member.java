package kr.co.realstore.model;

public class Member {

			private int no;// number primary key, -- key
			private String id;// varchar2(20) unique not null , -- id
			private String pw;// varchar2(12) not null, -- 암호
			private String email;// varchar2(30) , -- 이메일	
			private String del;// char(1) --삭제 여부
			private int grade;
			private String imsi;
			
			@Override
			public String toString() {
				return "Member [no=" + no + ", id=" + id + ", pw=" + pw + ", email=" + email + ", del=" + del
						+ ", grade=" + grade + ", imsi=" + imsi + "]";
			}
			public String getImsi() {
				return imsi;
			}
			public void setImsi(String imsi) {
				this.imsi = imsi;
			}
			public int getGrade() {
				return grade;
			}
			public void setGrade(int grade) {
				this.grade = grade;
			}
			
		
			public int getNo() {
				return no;
			}
			public void setNo(int no) {
				this.no = no;
			}
			public String getId() {
				return id;
			}
			public void setId(String id) {
				this.id = id;
			}
			public String getPw() {
				return pw;
			}
			public void setPw(String pw) {
				this.pw = pw;
			}
			public String getEmail() {
				return email;
			}
			public void setEmail(String email) {
				this.email = email;
			}
			public String getDel() {
				return del;
			}
			public void setDel(String del) {
				this.del = del;
			}
		
	
}
