package springweb.a02_mvc.a02_service;

import java.io.File;
import java.nio.charset.StandardCharsets;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import springweb.z01_vo.MailSender;
/*
# 회사 인사시스템에서 아이디 생성/비밀번호/메일발송/인사기본 데이터 저장
1. 인사담당자 : 메일:[  ] 클릭
2. 요청값을 받아서
	1) 회사사번생성(DB sequence + 부서코드 + 회사코드 + 입사일 조합)
	2) 임시비번생성(숫자 + 알파벳char 랜덤으로 자리수로 생성)
	3) 입력한 메일주소와 함께 DB에 등록
	4) 메일주소로 서버/비번을 타이틀과 내용을 발송 처리
	
3. 메일을 받은 사원은 생성된 사번과 임시비번으로 로그인하여, 개인정보를 추가 등록 처리한다.

# 아이디와 비밀번호를 잊었을 때
1. 등록한 메일 주소를 입력하세요.[  ] 
2. 해당 메일주소로 아이디와 비밀번호를 메일로 발송처리
 * */
@Service
public class A06_MailSenderService {
	// container에서 메일을 발송하는 객체 로딩..
	@Autowired(required = false)
	private JavaMailSender sender;
	
	// 메일발송 메서드
	public String sendMail(MailSender email) {
		String msg="";
		// 1. 메일 발송 데이터 전송을 위한 객체 생성.
		MimeMessage mmsg = sender.createMimeMessage();
		// 2. 해당 객체로 화면단에 입력된 내용 할당
		try {
		//	1) 제목	
			mmsg.setSubject(email.getTitle());
		//  2) 수신자
			mmsg.setRecipient(RecipientType.TO, 
					new InternetAddress(email.getReceiver()));
		//  3) 내용
			mmsg.setText(email.getContent());
			msg = "메일발송 성공";
		//  4) 발송처리..	
			mmsg.setFrom(new InternetAddress("ghdwjdgh89@gmail.com"));
			sender.send(mmsg);
//			// 기타 속성지정
//						MimeMessageHelper helper = new MimeMessageHelper(
//								mmsg,
//								MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,
//								StandardCharsets.UTF_8.name());
//					// 발신자 지정
//						helper.setFrom("발신자메일주소");
//						helper.setTo("수신자메일주소");
//						helper.setCc("참조메일주소");
//						helper.setBcc("숨은참조주소");
//						helper.setSubject("메일제목");
//						helper.setText("html형식 내용 설정가능/내용입력");
//						helper.addAttachment("파일명", new File("실제파일경로와 파일명"));
//						sender.send(mmsg);

		} catch (MessagingException e) {
			System.out.println("메시지 전송 에러 발송:"+e.getMessage());
			msg = "메일 발송 에러 발생:"+e.getMessage();
		} catch(Exception e) {
			System.out.println("기타 에러 :"+e.getMessage());
			msg = "기타 에러 발생:"+e.getMessage();			
		}
		return msg;
	}
	
}
