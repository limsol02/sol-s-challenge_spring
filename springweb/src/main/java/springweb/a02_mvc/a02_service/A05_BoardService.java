package springweb.a02_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A05_BoardDao;
import springweb.z01_vo.Board;
import springweb.z01_vo.BoardSch;

@Service
public class A05_BoardService {
	@Autowired(required = false)
	A05_BoardDao dao;
	
	public List<Board> boardList(BoardSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		if(sch.getWriter()==null) sch.setWriter("");
		// 전체 데이터 수 먼저 설정하거
		sch.setCount(dao.getTot(sch));
		// 한번에 한 페이지에서 몇건 보여줄지 설정하고
		if(sch.getPageSize()==0) sch.setPageSize(5);
		// 총~ 페이지 수 가져오고
		int totPage = (int)Math.ceil(sch.getCount()/(double)sch.getPageSize());
		sch.setPageCount(totPage);
		// 현재 페이지 번호 설정하고
		if(sch.getCurPage()>sch.getPageCount()) sch.setCurPage(sch.getPageCount());
		if(sch.getCurPage()==0) sch.setCurPage(1);
		// 페이지 마지막번호
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		if(sch.getEnd()>sch.getCount()) {
			sch.setEnd(sch.getCount());
		}
		// 페이지 시작번호
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		
		// 페이지블럭관련
		// 블럭사이즈 지정하고(홀수로~)
		sch.setBlockSize(5);
		// 블럭번호 가져오고~
		int blockNum = (int)Math.ceil(sch.getCurPage()/(double)sch.getBlockSize());
		// 마지막 블럭번호
		sch.setEndBlock(blockNum*sch.getBlockSize());
		// 블럭 시작번호 
		sch.setStartBlock((blockNum-1)*sch.getBlockSize()+1);
		// 블럭 사이즈 넘어가면 404 뜨는거 방지하고
		if(sch.getEndBlock()>sch.getPageCount()) {
			sch.setEndBlock(sch.getPageCount());
		}
		
		return dao.boardList(sch);
	}
	
}
