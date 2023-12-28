package d01_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
import springweb.z01_vo.EmpDTO;
import springweb.z01_vo.Member;


//d01_dao.PreparedStmtDao

/*
checkDeptno(int deptno)
backendweb.d01_dao.PreparedStmtDao
backendweb.z01_vo.Member

import="backendweb.d01_dao.*"

import="backendweb.d01_dao.PreparedStmtDao"
import="backendweb.z01_vo.*"
*/
public class PreparedStmtDao {

	public Object templateRead(String dname) {
		Object ob = new Object();
		String sql = "SELECT* FROM emp02";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			///pstmt.setString(1, "%" + dname + "%");
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				 System.out.println("데이터 있음.."+rs.next());
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return ob;
	}

	public int templateCUD(String ename) {
		int cudCnt = 0;
		String sql = "INSERT INTO emp01(ename) values(?)";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, ename);

			cudCnt = pstmt.executeUpdate();
			if (cudCnt == 0) {
				System.out.println("CUD 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("CUD 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return cudCnt;
	}

	public List<Dept> getDeptList(Dept sch) {
		List<Dept> dlist = new ArrayList<Dept>();
		String sql = "select deptno,dname,loc " 
				+ "from dept01 " 
				+ "where dname like ? " 
				+ " and loc like ? "
				+ " order by deptno ";
		// try(객체처리-연결;대화;결과){} : try resource 구문 파일이나 DB연결 자동 자원해제..
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, "%" + sch.getDname() + "%");
			pstmt.setString(2, "%" + sch.getLoc() + "%");
			try (ResultSet rs = pstmt.executeQuery();) {
				while (rs.next()) {
					dlist.add(new Dept(rs.getInt("deptno"), rs.getString("dname"), rs.getString("loc")));
				}
				System.out.println("데이터 건수:" + dlist.size());
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return dlist;
	}

	/*
	 * SELECT * FROM emp WHERE ename LIKE ? AND job LIKE ? AND deptno = ?
	 */
	public List<Emp> getEmpList(Emp sch) {
		List<Emp> empList = new ArrayList<Emp>();
		String sql = "SELECT *\r\n" + "FROM emp02\r\n"
		            + "WHERE ename LIKE ?\r\n" 
				    + "AND job LIKE ?\r\n";
		// 기본값 0인경우 전체 검색이 필요하기에 0면 검색조건에서 제외
		// sql 문과 pstmt에 처리..
		if (sch.getDeptno() != 0)
			sql += "AND deptno = ?";
		sql += " order by empno";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, "%" + sch.getEname() + "%");
			pstmt.setString(2, "%" + sch.getJob() + "%");
			if (sch.getDeptno() != 0)
				pstmt.setInt(3, sch.getDeptno());

			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				while (rs.next()) {
//					empList.add(new Emp());
					empList.add(new Emp(rs.getInt("empno"), 
							rs.getString("ename"), rs.getString("job"),
							rs.getInt("mgr"), rs.getDate("hiredate"), rs.getDouble("sal"), rs.getDouble("comm"),
							rs.getInt("deptno")));					
				}
				System.out.println("건수:" + empList.size());
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return empList;
	}

	// INSERT INTO emp01 values(?,?,?,?, to_date(?,'YYYY-MM-DD'),?,?,?)
//	dao.insertEmp01(new EmpDTO(1003,"하길동","대리",7799,"2023-11-01",3500,1000,20));
	public int insertEmp01(EmpDTO ins) {
		int insCnt = 0;
		String sql = "INSERT INTO emp02 values(?,?,?,?, " + "to_date(?,'YYYY-MM-DD'),?,?,?)";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, ins.getEmpno());
			pstmt.setString(2, ins.getEname());
			pstmt.setString(3, ins.getJob());
			pstmt.setInt(4, ins.getMgr());
			pstmt.setString(5, ins.getHiredateStr());
			pstmt.setDouble(6, ins.getSal());
			pstmt.setDouble(7, ins.getComm());
			pstmt.setInt(8, ins.getDeptno());
			insCnt = pstmt.executeUpdate();
			if (insCnt == 0) {
				System.out.println("등록 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("등록 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return insCnt;
	}

	/*
	 * SELECT * FROM member01 WHERE id='goodman'
	 */
	public EmpDTO getEmp(int empno) {
		EmpDTO emp = null;
		String sql = "SELECT e.*, to_char(hiredate,'YYYY-MM-DD') hiredatestr  \r\n" + "FROM emp02 e\r\n"
				+ "WHERE empno=? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setInt(1, empno);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				// mno name id pwd auth point
				if (rs.next()) {
					emp = new EmpDTO(rs.getInt("empno"), rs.getString("ename"), rs.getString("job"), rs.getInt("mgr"),
							rs.getString("hiredatestr"), rs.getDouble("sal"), rs.getDouble("comm"),
							rs.getInt("deptno"));
				}
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return emp;
	}

	/*
	 * UPDATE emp01 SET ename =?, job = ?, mgr = ?, hiredate =
	 * to_date(?,'YYYY-MM-DD'), sal = ?, comm = ?, deptno = ? WHERE empno = ?
	 */
	public int updateEmp01(EmpDTO upt) {
		int uptCnt = 0;
		String sql = "UPDATE emp02\r\n" + "    SET ename =?,\r\n" + "    	job = ?,\r\n" + "    	mgr = ?,\r\n"
				+ "    	hiredate = to_date(?,'YYYY-MM-DD'),\r\n" + "    	sal = ?,\r\n" + "    	comm = ?,\r\n"
				+ "    	deptno = ?\r\n" + "  WHERE empno = ? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, upt.getEname());
			pstmt.setString(2, upt.getJob());
			pstmt.setInt(3, upt.getMgr());
			pstmt.setString(4, upt.getHiredateStr());
			pstmt.setDouble(5, upt.getSal());
			pstmt.setDouble(6, upt.getComm());
			pstmt.setInt(7, upt.getDeptno());
			pstmt.setInt(8, upt.getEmpno());
			uptCnt = pstmt.executeUpdate();
			if (uptCnt == 0) {
				System.out.println("수정 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("수정 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return uptCnt;
	}

	public int deleteEmp01(int empno) {
		int delCnt = 0;
		String sql = "delete from emp02 where empno=?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, empno);
			delCnt = pstmt.executeUpdate();
			if (delCnt == 0) {
				System.out.println("삭제 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("삭제 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return delCnt;
	}

	// INSERT INTO emp01 values(?,?,?,?, to_date(?,'YYYY-MM-DD'),?,?,?)
	// dao.insertEmp01(new EmpDTO(1003,"하길동","대리",7799,"2023-11-01",3500,1000,20));

	public int insertDept(Dept ins) {
		int insCnt = 0;
		String sql = "INSERT INTO dept01 values(?,?,?)";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, ins.getDeptno());
			pstmt.setString(2, ins.getDname());
			pstmt.setString(3, ins.getLoc());
			insCnt = pstmt.executeUpdate();
			if (insCnt == 0) {
				System.out.println("등록 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("등록 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return insCnt;
	}


	public Dept getDept(int deptno) {
		Dept d = null;
		String sql = "select * from dept01 where deptno=?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setInt(1, deptno);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				if (rs.next()) {
					d = new Dept(rs.getInt("deptno"), rs.getString("dname"), rs.getString("loc"));
				}
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return d;
	}
	/*
	 * update dept01 set dname = ?, loc = ? where deptno =?
	 */

	public int updateDept(Dept upt) {
		int uptCnt = 0;
		String sql = "update dept01\r\n" + " set dname = ?,\r\n" + "       loc = ?\r\n" + "where deptno =? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, upt.getDname());
			pstmt.setString(2, upt.getLoc());
			pstmt.setInt(3, upt.getDeptno());
			uptCnt = pstmt.executeUpdate();
			if (uptCnt == 0) {
				System.out.println("CUD 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("CUD 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return uptCnt;
	}
	/*
	 * update dept01 set dname = ?, loc = ? where deptno =?
	 */
	public int deleteDept(int deptno) {
		int uptCnt = 0;
		String sql = "delete from dept01\r\n" + "where deptno =? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, deptno);
			uptCnt = pstmt.executeUpdate();
			if (uptCnt == 0) {
				System.out.println("삭제 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("삭제 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return uptCnt;
	}
	// 
	public boolean login(Member m) {
		boolean isLog=false;
		String sql = "SELECT *\r\n"
				+ "FROM member01\r\n"
				+ "WHERE id=? AND pwd=?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPwd());
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				// 데이터가 있으면 true, 없으면 false
				isLog = rs.next();
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		
		return isLog;
	}

	public boolean checkDeptno(int deptno) {
		boolean chNo = false;
		String sql = "select * " 
				+ "from dept01 " 
				+ "where deptno =  ? ";
		// try(객체처리-연결;대화;결과){} : try resource 구문 파일이나 DB연결 자동 자원해제..
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, deptno);

			try (ResultSet rs = pstmt.executeQuery();) {
				chNo = rs.next(); 
				
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return chNo;
	}

	public boolean checkEmpno(int empno) {
		boolean chNo = false;
		String sql = "select * " 
				+ "from emp02 " 
				+ "where empno =  ? ";
		// try(객체처리-연결;대화;결과){} : try resource 구문 파일이나 DB연결 자동 자원해제..
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, empno);
	
			try (ResultSet rs = pstmt.executeQuery();) {
				chNo = rs.next(); 
				
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return chNo;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		PreparedStmtDao dao = new PreparedStmtDao();
		//dao.templateRead("");
		
		//int insCnt = dao.insertEmp01(new EmpDTO(1006, "천길동", "대리", 7799, "2023-11-16", 5500, 1000, 20));
		//System.out.println(insCnt > 0 ? "등록성공!!" : "등록실패");
		
		for (Emp e : dao.getEmpList(new Emp("", "", 20))) {
			System.out.print(e.getEmpno() + "\t");
			System.out.print(e.getEname() + "\t");
			System.out.print(e.getDeptno() + "\n");
		}
		
		/*
		for (Dept d : dao.getDeptList("", "")) {
			System.out.print(d.getDeptno() + "\t");
			System.out.print(d.getDname() + "\t");
			System.out.print(d.getLoc() + "\n");
		}*/

	}

}
