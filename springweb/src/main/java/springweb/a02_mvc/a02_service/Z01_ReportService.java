package springweb.a02_mvc.a02_service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import springweb.a02_mvc.a03_dao.Z01_ReportDao;
import springweb.z01_vo.FileRep;
import springweb.z01_vo.Report;
import springweb.z01_vo.ReportFile;

@Service
public class Z01_ReportService {
	@Autowired(required = false)
	private Z01_ReportDao dao;
	
	@Value("${file.upload02}")
	private String path;
	
	public int insertReport(Report ins) {
		return dao.InsertReport(ins);
	}
	
	public String uploadFile(ReportFile ins) {
		int chk00 = dao.InsertReport(new Report(ins.getNo(),ins.getReport_name()));
		int chk01 = 0;
		if(ins.getReports()!=null && ins.getReports().length>0) {
			try {
				for(MultipartFile mf : ins.getReports()) {
					String fname = mf.getOriginalFilename();
					mf.transferTo(new File(path+fname));
					chk01 += dao.uploadFile(new FileRep(ins.getNo(),fname, path, ins.getEtc()));
				}
			} catch(IllegalStateException e) {
				System.out.println("에러 1 : "+e.getMessage());
			} catch(IOException e) {
				System.out.println("에러 2 : "+e.getMessage());
			}
		}
		String msg = chk00>0?"등록성겅":"등록실패";
		msg+= chk01==0? "파일정보 등록실패" : "파일"+chk01+"건 등록성공"; 
		return msg;
	}
	
}
