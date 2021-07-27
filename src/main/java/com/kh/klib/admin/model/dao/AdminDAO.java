package com.kh.klib.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.klib.admin.model.vo.AdminSearchValue;
import com.kh.klib.bkgroup.model.vo.BookGroup;
import com.kh.klib.bkgroup.model.vo.BookGroupSearchValue;
import com.kh.klib.board.model.vo.Board;
import com.kh.klib.board.model.vo.BoardSearchValue;
import com.kh.klib.books.model.vo.Books;
import com.kh.klib.books.model.vo.SearchCondition;
import com.kh.klib.comments.model.vo.Comments;
import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSearchCondition;
import com.kh.klib.member.model.vo.Member;
import com.kh.klib.notice.model.vo.Notice;
import com.kh.klib.room.model.vo.Room;
import com.kh.klib.room.model.vo.RoomSign;

@Repository("aDAO")
public class AdminDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCount");
	}

	public ArrayList<Books> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}

	public int insertBook(SqlSessionTemplate sqlSession, Books b) {
		return sqlSession.insert("adminMapper.insertBook", b);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.insert("adminMapper.insertAttachment", f);
	}

	
	public int getcListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getcListCount");
	}

	public ArrayList<Culture> selectCList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectCList", null, rowBounds);
	}

	public int insertCulture(SqlSessionTemplate sqlSession, Culture c) {
		return sqlSession.insert("adminMapper.insertCulture", c);
	}

	public int insertCultureAttachment(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.insert("adminMapper.insertCultureAttachment", f);
	}

	public int insertCultureFile(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.insert("adminMapper.insertCultureFile" ,f);
	}

	public Member adminLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("adminMapper.adminLogin", m);
	}

	public int insertAdmin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("adminMapper.insertAdmin", m);
	}

	public int dupId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("adminMapper.dupId", id);
	}

	public int getListUserCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListUserCount");
	}

	public ArrayList<Member> selectUserList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectUserList", null, rowBounds);
	}

	public int getListadminUserCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListadminUserCount");
	}

	public ArrayList<Member> selectadminUserList(SqlSessionTemplate sqlSession, PageInfo api) {
		int offset = (api.getCurrentPage() - 1) * api.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, api.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectadminUserList", null, rowBounds);
	}

	public int deleteUser(SqlSessionTemplate sqlSession, Integer no) {
		return sqlSession.update("adminMapper.deleteUser", no);
	}

	public int deleteAdmin(SqlSessionTemplate sqlSession, Integer no) {
		return sqlSession.update("adminMapper.deleteAdmin", no);
	}

	public ArrayList<Room> selectrList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectrList");
	}

	public int getAllListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getAllListCount");
	}

	public int getrlistCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getrlistCount");
	}

	public int getChk(SqlSessionTemplate sqlSession, int uNo) {
		return sqlSession.selectOne("adminMapper.getChk", uNo);
	}

	public ArrayList<RoomSign> selectNick(SqlSessionTemplate sqlSession, Integer rNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNick", rNo);
	}

	public int cancelRoom(SqlSessionTemplate sqlSession, Integer rNo) {
		return sqlSession.update("adminMapper.cancelRoom", rNo);
	}

	public int outTime(SqlSessionTemplate sqlSession, Integer rsNo) {
		return sqlSession.update("adminMapper.outTime", rsNo);
	}

	public ArrayList<Books> selectBlist(SqlSessionTemplate sqlSession, Integer bNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBlist", bNo);
	}

	public int deleteBook(SqlSessionTemplate sqlSession, Integer bNo) {
		return sqlSession.update("adminMapper.deleteBook", bNo);
	}

	public ArrayList<Files> selectBFileName(SqlSessionTemplate sqlSession, Integer bNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectBFileName", bNo);
	}

	public int updateBook(SqlSessionTemplate sqlSession, Books b) {
		return sqlSession.update("adminMapper.updateBook", b);
	}

	public int updateBAttachment(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.update("adminMapper.updateBAttachment", f);
	}

	public ArrayList<Member> deleteUserList(SqlSessionTemplate sqlSession, Integer no) {
		return (ArrayList)sqlSession.selectList("adminMapper.deleteUserList", no);
	}

	public ArrayList<Culture> cDeleteList(SqlSessionTemplate sqlSession, Integer cNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.cDeleteList", cNo);
	}

	public int cultureDelete(SqlSessionTemplate sqlSession, Integer cNo) {
		return sqlSession.update("adminMapper.cultureDelete", cNo);
	}

	public ArrayList<Culture> selectClist(SqlSessionTemplate sqlSession, Integer cNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectClist", cNo);
	}

	public ArrayList<Files> selectCFileName(SqlSessionTemplate sqlSession, Integer cNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectCFileName", cNo);
	}

	public ArrayList<Files> selectCFileName2(SqlSessionTemplate sqlSession, Integer cNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectCFileName2", cNo);
	}

	public int updateCulture(SqlSessionTemplate sqlSession, Culture c) {
		return sqlSession.update("adminMapper.updateCulture", c);
	}

	public int updateCAttachment(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.update("adminMapper.updateCAttachment", f);
	}

	public int updateCFile(SqlSessionTemplate sqlSession, Files f) {
		return sqlSession.update("adminMapper.updateCFile", f);
	}

	public int getbgListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getbgListCount");
	}

	public ArrayList<BookGroup> selectbgList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectbgList", null, rowBounds);
	}

	public ArrayList<BookGroup> gDeleteList(SqlSessionTemplate sqlSession, Integer gNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.gDeleteList", gNo);
	}

	public int bgDelete(SqlSessionTemplate sqlSession, Integer gNo) {
		return sqlSession.update("adminMapper.bgDelete", gNo);
	}

	public int getNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getNoticeListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeList", null, rowBounds);
	}

	public int InsertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminMapper.InsertNotice", n);
	}

	public int searchUListCount(SqlSessionTemplate sqlSession, AdminSearchValue asv) {
		return sqlSession.selectOne("adminMapper.searchUListCount", asv);
	}

	public ArrayList<Member> selectSearchResultUList(SqlSessionTemplate sqlSession, AdminSearchValue asv, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchResultUList", asv, rowBounds);
	}

	public int searchAUListCount(SqlSessionTemplate sqlSession, AdminSearchValue asv) {
		return sqlSession.selectOne("adminMapper.searchAUListCount", asv);
	}

	public ArrayList<Member> selectSearchResultAUList(SqlSessionTemplate sqlSession, AdminSearchValue asv,
			PageInfo api) {
		int offset = (api.getCurrentPage() - 1) * api.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, api.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchResultAUList", asv, rowBounds);
	}

	public int bListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.bListCount");
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoardList", null, rowBounds);
	}

	public int CMListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.CMListCount");
	}

	public ArrayList<Comments> selectCommentsList(SqlSessionTemplate sqlSession, PageInfo cmpi) {
		int offset = (cmpi.getCurrentPage() - 1) * cmpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, cmpi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("adminMapper.selectCommentsList", null, rowBounds);
	}

	public Board selectDetailBoard(SqlSessionTemplate sqlSession, Integer bNo) {
		return sqlSession.selectOne("adminMapper.selectDetailBoard", bNo);
	}

	public Files selectBFile(SqlSessionTemplate sqlSession, Integer bNo) {
		return sqlSession.selectOne("adminMapper.selectBFile", bNo);
	}

	public int boardDelete(SqlSessionTemplate sqlSession, Integer bNo) {
		return sqlSession.update("adminMapper.boardDelete", bNo);
	}

	public int commentDelete(SqlSessionTemplate sqlSession, Integer cNo) {
		return sqlSession.update("adminMapper.commentDelete", cNo);
	}

	public int searchBoardListCount(SqlSessionTemplate sqlSession, BoardSearchValue bsv) {
		return sqlSession.selectOne("adminMapper.searchBoardListCount", bsv);
	}

	public ArrayList<Board> selectSearchBoardResultList(SqlSessionTemplate sqlSession, BoardSearchValue bsv,
			PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchBoardResultList", bsv, rowBounds);
	}

	public int searchBookListCount(SqlSessionTemplate sqlSession, SearchCondition sc) {
		return sqlSession.selectOne("adminMapper.searchBookListCount", sc);
	}

	public ArrayList<Books> selectSearchBookResultList(SqlSessionTemplate sqlSession, SearchCondition sc, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchBookResultList", sc, rowBounds);
	
	}

	public int searchCultureListCount(SqlSessionTemplate sqlSession, CultureSearchCondition csc) {
		return sqlSession.selectOne("adminMapper.searchCultureListCount", csc);
	}

	public ArrayList<Culture> selectSearchCultureResultList(SqlSessionTemplate sqlSession, CultureSearchCondition csc,
			PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchCultureResultList", csc, rowBounds);
	
	}

	public int searchBGroupListCount(SqlSessionTemplate sqlSession, BookGroupSearchValue gsv) {
		return sqlSession.selectOne("adminMapper.searchBGroupListCount", gsv);
	}

	public ArrayList<Culture> selectSearchBGroupResultList(SqlSessionTemplate sqlSession, BookGroupSearchValue gsv,
			PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchBGroupResultList", gsv, rowBounds);
	
	}

	public int getReListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getReListCount");
	}

	public ArrayList<Books> selectReList(SqlSessionTemplate sqlSession, PageInfo rpi) {
		int offset = (rpi.getCurrentPage() - 1) * rpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, rpi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectReList", null, rowBounds);
	}

	public int bkRecommend(SqlSessionTemplate sqlSession, Integer bNo) {
		return sqlSession.update("adminMapper.bkRecommend", bNo);
	}

	public int bkCancelRecommend(SqlSessionTemplate sqlSession, Integer bNo) {
		return sqlSession.update("adminMapper.bkCancelRecommend", bNo);
	}

	public Notice selectDetailNotice(SqlSessionTemplate sqlSession, Integer nNo) {
		return sqlSession.selectOne("adminMapper.selectDetailNotice", nNo);
	}

	public int noticeDelete(SqlSessionTemplate sqlSession, Integer nNo) {
		return sqlSession.update("adminMapper.noticeDelete", nNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("adminMapper.updateNotice", n);
	}



	
}
