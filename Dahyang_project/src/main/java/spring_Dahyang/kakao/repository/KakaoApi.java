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

	@Value("${kakao.api_key}")
	private String kakaoApiKey;
	
	@Value("${kakao.redirect_uri}")
	private String kakaoRedirectUri;
	
}
