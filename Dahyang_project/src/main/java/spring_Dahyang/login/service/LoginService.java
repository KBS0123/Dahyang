package spring_Dahyang.login.service;

import java.io.*;
import java.net.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.*;

import spring_Dahyang.kakao.dto.Kakao;
import spring_Dahyang.kakao.repository.KakaoApi;
import spring_Dahyang.login.dto.Login;
import spring_Dahyang.user.model.User;
import spring_Dahyang.user.repository.UserMapper;

@Service
public class LoginService {

    @Autowired
    private UserMapper userMapper;
    
    @Autowired
	private KakaoApi kakaoApi;
    
    public void authenticate(Login login) {
        User user = userMapper.selectByEmail(login.getEmail());
        if (user == null) {
            login.setError("이메일이 존재하지 않습니다.");
        } else {
            if (!user.getPwd().equals(login.getPwd())) {
                login.setError("비밀번호가 다릅니다.");
            } else {
                login.setError(null);
            }
        }
    }
    
    //컨트롤러에서 사용할 메서드 만들기 
  	//화면에서 파라미터로 넘겨준 code값을 받아오고 POST로 요청을 보내서 토큰을 발급받기 
  	public String getAccessToken (String authorize_code) {
  	    System.out.println("----------------------------토큰발급---------------------------");
  	    String access_Token = "";
  	    String refresh_Token = "";
  	    String id_token ="";
  	    
  	    //토큰발급 요청을 보낼 주소
  	    String reqURL = "https://kauth.kakao.com/oauth/token";
  	       
  	       try {
                 //URL객체 생성
  	           URL url = new URL(reqURL);
  	           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
  	           
  	           // POST 요청을 위해 기본값이 false인 setDoOutput을 true로 
                 //.setDoOutput(true): URLConnection이 서버에 데이터를 보내는데 사용할 수 있는 지의 여부를 설정하는 것
  	           conn.setRequestMethod("POST");
  	           conn.setDoOutput(true);
  	           
  	           // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
  	           BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
  	           StringBuilder sb = new StringBuilder();
  	           sb.append("grant_type=authorization_code");
  	           sb.append("&client_id=").append(kakaoApi.getKakaoApiKey());
  	           sb.append("&redirect_uri=").append(kakaoApi.getKakaoRedirectUri());
  	           sb.append("&code=" + authorize_code);
  	           bw.write(sb.toString());
  	           bw.flush();
  	           
  	           //응답확인 200이면 정상
  	           int responseCode = conn.getResponseCode();
  	           System.out.println("responseCode : " + responseCode);
  	
  	           //요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
  	           BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
  	           String line = "";
  	           String result = "";
  	           
  	           while ((line = br.readLine()) != null) {
  	               result += line;
  	           }
  	           System.out.println("response body : " + result);
  	           
  	           // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
  	           JsonParser parser = new JsonParser();
  	           JsonElement element = parser.parse(result);
  	           
  	           access_Token = element.getAsJsonObject().get("access_token").getAsString();
  	           refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
  	           id_token = element.getAsJsonObject().get("id_token").getAsString();
  	           
  	           System.out.println("access_token : " + access_Token);
  	           System.out.println("refresh_token : " + refresh_Token);
  	           System.out.println("id_token: "+ id_token);
  	           
  	           br.close();
  	           bw.close();
  	       } catch (IOException e) {
  	           // TODO Auto-generated catch block
  	           e.printStackTrace();
  	       } 
  	       
  	       return access_Token;
  	   }
  	
  //회원정보 요청, 사용자 정보 보기 
 	public Kakao userInfo(String access_Token) throws IOException {
 		System.out.println("-------------------------사용자 정보 보기---------------------------");	 		
 		
 		Kakao userInfo = new Kakao();
 		
 		//토큰을 이용하여 카카오에 회원의 정보를 요청한다. 
        // v1을 통한 '사용자 정보 요청'은 만료되었다. 
 		String reqURl = "https://kapi.kakao.com/v2/user/me";
 		
 		try {
 			//URL 객체 생성
 			URL url = new URL(reqURl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			//연결 완료
			
			//헤더 필드 읽기 
			//요청에 필요한 Header에 포함 될 내용 // 문서에서 지정해둔 양식 
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			//응답코드 확인하기 
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode: "+ responseCode);
			
			//입력스트림을 가지고 오고 데이터 읽기
			//inputStream은 데이터를 바이트의 배열로 읽어 오는 low-level의 메서드
			//따라서 데이터를 문자 '데이터'로 읽기 위해서 InputStreamReader로 매핑
			//데이터를 문자'열'로 읽기 위해서 inputStream을 BufferedReader로 매핑하기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
			
			
			String line="";
			String result ="";
			
			while((line= br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body: " + result);
			
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            //JsonElement.getAsJsonObject().get("key value").getAs타입(); 의 형태로 파싱한다. 
           	//응답데이터(JSON)
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            Long id = element.getAsJsonObject().get("id").getAsLong();
            
            //파싱된 json데이터를 string에 담기
            //properties
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String img = properties.getAsJsonObject().get("profile_image").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            System.out.println("id: " + id);
            System.out.println("nickname: " + nickname);
            System.out.println("img: " + img);
            System.out.println("email: " + email);
            
            //setter이용하여 KakaoVO에 담기 
            userInfo.setKakao_id(id);
            userInfo.setKakao_nickname(nickname);
            userInfo.setKakao_email(email);
            userInfo.setKakao_img(img);

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
 		
 		
 		return userInfo;
 	}
    
}