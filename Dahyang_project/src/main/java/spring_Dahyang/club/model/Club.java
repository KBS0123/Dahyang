package spring_Dahyang.club.model;

import lombok.Data;

import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor; //모든 멤버변수를 입력받는 생성자
import lombok.NoArgsConstructor; //디폴트 생성자 처리

import spring_Dahyang.user.model.User;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Club {
	
	private int clid;		// 모임방 번호
	private int uid;		// 사용자 번호
	private String title;	// 글제목
	private String content;	// 글내용
	private String notice;	// 공지글
	private String img;		// 이미지
	
	@ManyToOne
	private User creator;
	
}
