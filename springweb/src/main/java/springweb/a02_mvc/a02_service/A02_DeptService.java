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
		// 다중의 파일정보등록
		int chk02 = 0;
		// 파일을 화면 form애서 업로드했을 때만 처리..
		if(ins.getReports()!=null && ins.getReports().length>0) {
			try {
				// 다중파일이기에 반복문으로 처리..
				for(MultipartFile mf : ins.getReports()) {
					// 1. 파일 업로드..
					// getOriginalFilename() : 파일명 가지고오기 
					String fname = mf.getOriginalFilename();
					
					// 클라이언트에서 네트워크로 전달된 것을 받는 객체(MultipartFile) 
					// 물리적으로 특정위치에 저장할 수 있는 객체(new File(path+fname))
					// MultipartFile를 new File(path+fname)로 전환해주는 메서드가 transferTo 요고(실제 물리적으로 특정위치에 파일명으로 저장
					mf.transferTo(new File(path+fname));
					
					// 2. 업로드된 파일경로를 DB에 저장..
					chk02 += dao.uploadFile(new FileRep(ins.getDeptno(),fname, path, ins.getEtc()));
					
				}
				//ins.getReports()[0].transferTo(new File());
			} catch (IllegalStateException e){
				System.out.println("파일업로드 예외1 : "+e.getMessage());
			} catch(IOException e) {
				System.out.println("파일업로드 예외2 : "+e.getMessage());
			}
		
		}
		String msg = chk01>0?"기본정보 등록 성공" : "기본정보 등록 실패\\n";
		msg += chk02 ==0 ? "파일정보 등록실패" : "파일 " +chk02+"건 등록성공" ;
		return 	msg;
	}

}
