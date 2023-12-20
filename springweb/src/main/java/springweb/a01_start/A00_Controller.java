package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class A00_Controller {
	@RequestMapping("callSecu.do")
	public String callSecu() {
		return "";
	}
}
