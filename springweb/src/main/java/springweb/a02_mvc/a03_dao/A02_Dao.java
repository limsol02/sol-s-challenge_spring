package springweb.a02_mvc.a03_dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import springweb.z01_vo.Dept;
import springweb.z01_vo.EmpDTO;
import springweb.z01_vo.Job_History;
import springweb.z01_vo.Region;

public interface A02_Dao {
/*
1. Mapper를 통한 등록
 * */

public int insertEmp(EmpDTO insert);

// dept01 입력처리..
public int insertDept(Dept insert);



/*
2. 인터페이스에서 annotation을 이용하여 sql을 처리
	1) sql작성 확인
	2) annotation 으로 Select, Insert, Update, Delete 선언
		매개변수 선언
	3) 기능메서드 추상메서드로 처리..
 * */

@Select("SELECT * FROM regions WHERE region_name LIKE '%' || #{region_name} || '%'")
public List<Region> getRegionList(@Param("region_name")String region_name);

@Select("SELECT * FROM JOB_HISTORY WHERE JOB_ID LIKE '%' || #{job_id} || '%'")
public List<Job_History> getJobHistory(@Param("job_id")String job_id);
	
}
