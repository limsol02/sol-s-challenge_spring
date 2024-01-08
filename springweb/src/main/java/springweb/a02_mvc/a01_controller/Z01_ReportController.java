package springweb.a02_mvc.a01_controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import springweb.a02_mvc.a02_service.Z01_ReportService;

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
	   public String fileuploadExp01(@RequestParam("reports")
	         MultipartFile[] reports, Model d) {
	      if(reports != null && reports.length > 0) {
	         try {
	            for(MultipartFile mf:reports) {
	            	
	               String fname = mf.getOriginalFilename();
	               if(fname!=null&&!fname.equals("")) {
	                  mf.transferTo(new File(path+fname));
	                  d.addAttribute("msg", "파일등록 성공");
	               }else {
	                  d.addAttribute("msg", "파일등록 실패");
	               }
	            }
	         } catch (IllegalStateException e) {
	            d.addAttribute("msg", "파일등록 실패");                  
	         } catch (IOException e) {
	            d.addAttribute("msg", "파일등록 실패");
	         }
	      }else {
	         d.addAttribute("msg", "파일등록 실패");
	      }
	      return "WEB-INF\\views\\z01_homework\\0108.jsp";
	   }
}
