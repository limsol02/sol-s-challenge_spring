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
