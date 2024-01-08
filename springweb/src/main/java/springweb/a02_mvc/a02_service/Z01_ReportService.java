package springweb.a02_mvc.a02_service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import springweb.a02_mvc.a03_dao.Z01_ReportDao;
import springweb.z01_vo.report;

@Service
public class Z01_ReportService {
	@Autowired(required = false)
	private Z01_ReportDao dao;
	@Value("${file.upload02}")
	private String path;
	
	public String uploadFile(report ins) {
		int chk01 = dao.uploadFile(new report(ins.getNo(),ins.getFname(),path,ins.getEtc()));
		String msg = "";
		if(chk01 > 0) {
			msg = "등록성공";
		}else {
			msg = "등록실패";
		}
		return msg;
	}
	
}
