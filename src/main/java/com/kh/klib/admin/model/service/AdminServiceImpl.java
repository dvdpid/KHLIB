package com.kh.klib.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.klib.admin.model.dao.AdminDAO;
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

@Service("aService")
public class AdminServiceImpl implements AdminService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDAO aDAO;
	
	@Override
	public int getListCount() {
		return aDAO.getListCount(sqlSession);
	}

	@Override
	public int getListUserCount() {
		return aDAO.getListUserCount(sqlSession);
	}
	
	@Override
	public ArrayList<Books> selectList(PageInfo pi) {
		return aDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertBook(Books b) {
		
		int result1 = aDAO.insertBook(sqlSession, b);
		
		return result1;
	}

	@Override
	public int insertAttachment(Files f) {
		return aDAO.insertAttachment(sqlSession, f);
	}

	@Override
	public int getcListCount() {
		return aDAO.getcListCount(sqlSession);
	}

	@Override
	public ArrayList<Culture> selectCList(PageInfo pi) {
		return aDAO.selectCList(sqlSession, pi);
	}

	@Override
	public int insertCulture(Culture c) {
		return aDAO.insertCulture(sqlSession, c);
	}

	@Override
	public int insertCultureAttachment(Files f) {
		return aDAO.insertCultureAttachment(sqlSession, f);
	}

	@Override
	public int insertCultureFile(Files f) {
		return aDAO.insertCultureFile(sqlSession, f);
	}

	@Override
	public Member adminLogin(Member m) {
		return aDAO.adminLogin(sqlSession, m);
	}

	@Override
	public int insertAdmin(Member m) {
		return aDAO.insertAdmin(sqlSession, m);
	}

	@Override
	public int dupId(String id) {
		return aDAO.dupId(sqlSession, id);
	}

	@Override
	public ArrayList<Member> selectUserList(PageInfo pi) {
		return aDAO.selectUserList(sqlSession, pi);
	}

	@Override
	public int getListadminUserCount() {
		return aDAO.getListadminUserCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectadminUserList(PageInfo api) {
		return aDAO.selectadminUserList(sqlSession, api);
	}

	@Override
	public int deleteUser(Integer no) {
		return aDAO.deleteUser(sqlSession, no);
	}

	@Override
	public int deleteAdmin(Integer no) {
		return aDAO.deleteAdmin(sqlSession, no);
	}

	@Override
	public ArrayList<Room> selectrList() {
		return aDAO.selectrList(sqlSession);
	}

	@Override
	public int getAllListCount() {
		return aDAO.getAllListCount(sqlSession);
	}

	@Override
	public int getrlistCount() {
		return aDAO.getrlistCount(sqlSession);
	}

	@Override
	public int getChk(int uNo) {
		return aDAO.getChk(sqlSession, uNo);
	}

	@Override
	public ArrayList<RoomSign> selectNick(Integer rNo) {
		return aDAO.selectNick(sqlSession, rNo);
	}

	@Override
	public int cancelRoom(Integer rNo) {
		return aDAO.cancelRoom(sqlSession, rNo);
	}

	@Override
	public int outTime(Integer rsNo) {
		return aDAO.outTime(sqlSession, rsNo);
	}

	@Override
	public ArrayList<Books> selectBlist(Integer bNo) {
		return aDAO.selectBlist(sqlSession, bNo);
	}

	@Override
	public int deleteBook(Integer bNo) {
		return aDAO.deleteBook(sqlSession, bNo);
	}

	@Override
	public ArrayList<Files> selectBFileName(Integer bNo) {
		return aDAO.selectBFileName(sqlSession, bNo);
	}

	@Override
	public int updateBook(Books b) {
		return aDAO.updateBook(sqlSession, b);
	}

	@Override
	public int updateBAttachment(Files f) {
		return aDAO.updateBAttachment(sqlSession, f);
	}

	@Override
	public ArrayList<Member> deleteUserList(Integer no) {
		return aDAO.deleteUserList(sqlSession, no);
	}

	@Override
	public ArrayList<Culture> cDeleteList(Integer cNo) {
		return aDAO.cDeleteList(sqlSession, cNo);
	}

	@Override
	public int cultureDelete(Integer cNo) {
		return aDAO.cultureDelete(sqlSession, cNo);
	}

	@Override
	public ArrayList<Culture> selectClist(Integer cNo) {
		return aDAO.selectClist(sqlSession, cNo);
	}

	@Override
	public ArrayList<Files> selectCFileName(Integer cNo) {
		return aDAO.selectCFileName(sqlSession, cNo);
	}

	@Override
	public ArrayList<Files> selectCFileName2(Integer cNo) {
		return aDAO.selectCFileName2(sqlSession, cNo);
	}

	@Override
	public int updateCulture(Culture c) {
		return aDAO.updateCulture(sqlSession, c);
	}

	@Override
	public int updateCAttachment(Files f) {
		return aDAO.updateCAttachment(sqlSession, f);
	}
	@Override
	public int updateCFile(Files f) {
		return aDAO.updateCFile(sqlSession, f);
	}

	@Override
	public int getbgListCount() {
		return aDAO.getbgListCount(sqlSession);
	}

	@Override
	public ArrayList<BookGroup> selectbgList(PageInfo pi) {
		return aDAO.selectbgList(sqlSession, pi);
	}

	@Override
	public ArrayList<BookGroup> gDeleteList(Integer gNo) {
		return aDAO.gDeleteList(sqlSession, gNo);
	}

	@Override
	public int bgDelete(Integer gNo) {
		return aDAO.bgDelete(sqlSession, gNo);
	}

	@Override
	public int getNoticeListCount() {
		return aDAO.getNoticeListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return aDAO.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int InsertNotice(Notice n) {
		return aDAO.InsertNotice(sqlSession, n);
	}

	@Override
	public int searchUListCount(AdminSearchValue asv) {
		return aDAO.searchUListCount(sqlSession, asv);
	}

	@Override
	public ArrayList<Member> selectSearchResultUList(AdminSearchValue asv, PageInfo pi) {
		return aDAO.selectSearchResultUList(sqlSession, asv, pi);
	}

	@Override
	public ArrayList<Member> selectSearchResultAUList(AdminSearchValue asv, PageInfo api) {
		return aDAO.selectSearchResultAUList(sqlSession, asv, api);
	}

	@Override
	public int searchAUListCount(AdminSearchValue asv) {
		return aDAO.searchAUListCount(sqlSession, asv);
	}

	@Override
	public int bListCount() {
		return aDAO.bListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return aDAO.selectBoardList(sqlSession, pi);
	}

	@Override
	public int CMListCount() {
		return aDAO.CMListCount(sqlSession);
	}

	@Override
	public ArrayList<Comments> selectCommentsList(PageInfo cmpi) {
		return aDAO.selectCommentsList(sqlSession, cmpi);
	}

	@Override
	public Board selectDetailBoard(Integer bNo) {
		Board b = null;
		b = aDAO.selectDetailBoard(sqlSession, bNo);
		return b;
	}

	@Override
	public Files selectBFile(Integer bNo) {
		return aDAO.selectBFile(sqlSession, bNo);
	}

	@Override
	public int boardDelete(Integer bNo) {
		return aDAO.boardDelete(sqlSession, bNo);
	}

	@Override
	public int commentDelete(Integer cNo) {
		return aDAO.commentDelete(sqlSession, cNo);
	}

	@Override
	public int searchBoardListCount(BoardSearchValue bsv) {
		return aDAO.searchBoardListCount(sqlSession, bsv);
	}

	@Override
	public ArrayList<Board> selectSearchBoardResultList(BoardSearchValue bsv, PageInfo pi) {
		return aDAO.selectSearchBoardResultList(sqlSession, bsv, pi);
	}

	@Override
	public int searchBookListCount(SearchCondition sc) {
		return aDAO.searchBookListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<Books> selectSearchBookResultList(SearchCondition sc, PageInfo pi) {
		return aDAO.selectSearchBookResultList(sqlSession, sc, pi);
	}

	@Override
	public int searchCultureListCount(CultureSearchCondition csc) {
		return aDAO.searchCultureListCount(sqlSession, csc);
	}

	@Override
	public ArrayList<Culture> selectSearchCultureResultList(CultureSearchCondition csc, PageInfo pi) {
		return aDAO.selectSearchCultureResultList(sqlSession, csc, pi);
	}

	@Override
	public int searchBGroupListCount(BookGroupSearchValue gsv) {
		return aDAO.searchBGroupListCount(sqlSession, gsv);
	}

	@Override
	public ArrayList<Culture> selectSearchBGroupResultList(BookGroupSearchValue gsv, PageInfo pi) {
		return aDAO.selectSearchBGroupResultList(sqlSession, gsv, pi);
	}

	@Override
	public int getReListCount() {
		return aDAO.getReListCount(sqlSession);
	}

	@Override
	public ArrayList<Books> selectReList(PageInfo rpi) {
		return aDAO.selectReList(sqlSession, rpi);
	}

	@Override
	public int bkRecommend(Integer bNo) {
		return aDAO.bkRecommend(sqlSession, bNo);
	}

	@Override
	public int bkCancelRecommend(Integer bNo) {
		return aDAO.bkCancelRecommend(sqlSession, bNo);
	}

	@Override
	public Notice selectDetailNotice(Integer nNo) {
		return aDAO.selectDetailNotice(sqlSession, nNo);
	}

	@Override
	public int noticeDelete(Integer nNo) {
		return aDAO.noticeDelete(sqlSession, nNo);
	}

	@Override
	public int updateNotice(Notice n) {
		return aDAO.updateNotice(sqlSession, n);
	}



	
}
