package spring_Dahyang.kakao.repository;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class KakaoApi {

	private String kakaoApiKey;
	private String kakaoRedirectUri;
	
}
