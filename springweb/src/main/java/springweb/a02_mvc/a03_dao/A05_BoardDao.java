package springweb.a02_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Board;
import springweb.z01_vo.BoardSch;



// springweb.a02_mvc.a03_dao.A05_BoardDao
public interface A05_BoardDao {
	List<Board> boardList(BoardSch sch);
	int getTot(BoardSch sch);
	
}
