package springweb.a02_mvc.a01_controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import springweb.a02_mvc.a02_service.Z01_ReportService;
import springweb.z01_vo.ReportFile;

@Controller
public class Z01_ReportController {
	@Autowired
	private Z01_ReportService service;

	
	@GetMapping("fileuploadExp01.do")
	public String fileuploadExp01Frm() {
		return "WEB-INF\\views\\z01_homework\\0108.jsp";
	}
	
	@Value("${file.upload02}")
	String path;	 
	// 다중파일등록
	   @PostMapping("fileuploadExp01.do")
	   public String fileuploadExp01(ReportFile rf, Model d) {
	      d.addAttribute("msg", service.uploadFile(rf));
	      return "WEB-INF\\views\\z01_homework\\0108.jsp";
	   }
}
