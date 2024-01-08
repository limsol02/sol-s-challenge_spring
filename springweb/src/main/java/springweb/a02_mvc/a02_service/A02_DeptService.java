package springweb.a02_mvc.a02_service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import springweb.a02_mvc.a03_dao.A03_DeptDao;
import springweb.z01_vo.Dept;
import springweb.z01_vo.DeptFile;
import springweb.z01_vo.FileRep;

@Service
public class A02_DeptService {
	@Autowired
	private A03_DeptDao dao;
	
	public List<Dept> getDeptList02(Dept sch){
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		return dao.getDeptList02(sch);
	}
	
	public int insertDept(Dept ins) {
		return dao.insertDept(ins);
	}
	
	public Dept getDept(int deptno) {
		return dao.getDept(deptno);
	}
	
	@Value("${file.upload}")
	private String path;
	
	public String uploadFile(DeptFile ins) {
		// 기본 부서정보입력
		int chk01 = dao.insertDept(new Dept(ins.getDeptno(),ins.getDname(),ins.getLoc()));
		int chk02 = 0;
		if(ins.getReports()!=null && ins.getReports().length>0) {
			try {
				for(MultipartFile mf : ins.getReports()) {
					String fname = mf.getOriginalFilename();
					mf.transferTo(new File(path+fname));
					chk02 += dao.uploadFile(new FileRep(ins.getDeptno(),fname, path, ins.getEtc()));
					
				}
				//ins.getReports()[0].transferTo(new File());
			} catch (IllegalStateException e){
				System.out.println("파일업로드 예외1 : "+e.getMessage());
			} catch(IOException e) {
				System.out.println("파일업로드 예외2 : "+e.getMessage());
			}
		
		}
		String msg = chk01>0?"기본정보 등록 성공" : "기본정보 등록 실패";
		msg += chk02 ==0 ? "파일정보 등록실패" : "파일 " +chk02+"건 등록성공" ;
		return 	msg;
	}

}
