package spring_Dahyang.kakao.repository;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import spring_Dahyang.kakao.dto.KakaoPay;
import spring_Dahyang.user.model.User;

@Service
@RequiredArgsConstructor
@Transactional
@Log
public class KakaoPayService {
    private static final String Host = "https://kapi.kakao.com";
    
    @Value("${kakao.admin}")
    private String kakaoAdminKey;

    private KakaoPay kakaoPay;

    public String kakaoPayReady(HttpSession session) {
    	User user = (User)session.getAttribute("user");
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory()); // 정확한 에러 파악을 위해 생성

        // Server Request Header : 서버 요청 헤더
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + kakaoAdminKey); // 어드민 키
        headers.add("Accept", "application/json");
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        // Server Request Body : 서버 요청 본문
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();

        params.add("cid", "TCSEQUENCE"); // 가맹점 코드 - 테스트용
        params.add("partner_order_id", "1001"); // 주문 번호
        params.add("partner_user_id", user.getNickname()); // 회원 아이디
        params.add("item_name", "모임방 생성"); // 상품 명
        params.add("quantity", "1"); // 상품 수량
        params.add("total_amount", "5000"); // 상품 가격
        params.add("tax_free_amount", "0"); // 상품 비과세 금액
        params.add("approval_url", "http://localhost:8081/Dahyang_project/kakaoPaySuccess"); // 성공시 url
        params.add("cancel_url", "http://localhost:8081/Dahyang_project/views/"); // 실패시 url
        params.add("fail_url", "http://localhost:8081/Dahyang_project/views/");

        // 헤더와 바디 붙이기
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            kakaoPay = restTemplate.postForObject(new URI(Host + "/v1/payment/ready"), body, KakaoPay.class);

            log.info(""+ kakaoPay);
            return kakaoPay.getNext_redirect_pc_url();

        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        return "/pay";
    }
}