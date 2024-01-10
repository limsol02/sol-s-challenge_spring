package springweb.a03_util;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DownloadController {
	// http://localhost:7080/springweb/download.do?fname=SSS.txt
	@RequestMapping("download.do")
	public String download(@RequestParam("fname")String fname, Model d) {
		d.addAttribute("downloadFile",fname);
		return "downloadViewer";
	}
}
