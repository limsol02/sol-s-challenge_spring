package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.A06_MailSenderService;
import springweb.z01_vo.MailSender;

@Controller
public class A06_MailSenderController {
	@Autowired(required = false)
	private A06_MailSenderService service;
//	http://localhost:7080/springweb/mailSend.do
	@RequestMapping("mailSend.do")
	public String mailSend(MailSender mailVo, Model d) {
		if(mailVo.getTitle()!=null) {
			d.addAttribute("msg", service.sendMail(mailVo));
		}
		return "WEB-INF\\views\\a03_mvc\\a11_mailSenderForm.jsp";
	}
}
