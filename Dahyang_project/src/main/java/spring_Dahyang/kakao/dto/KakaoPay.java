package spring_Dahyang.kakao.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class KakaoPay {
	
	private String tid;
	private String next_redirect_pc_url;
	private Date created_at;

}
