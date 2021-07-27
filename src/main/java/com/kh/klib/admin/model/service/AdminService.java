package com.kh.klib.admin.model.service;

import java.util.ArrayList;

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

public interface AdminService {

	int getListCount();

	ArrayList<Books> selectList(PageInfo pi);

	int insertBook(Books b);

	int insertAttachment(Files f);

	
	int getcListCount();
	
	ArrayList<Culture> selectCList(PageInfo pi);

	int insertCulture(Culture c);

	int insertCultureAttachment(Files f);

	int insertCultureFile(Files f);

	Member adminLogin(Member m);

	int insertAdmin(Member m);

	int dupId(String id);

	int getListUserCount();

	ArrayList<Member> selectUserList(PageInfo pi);

	int getListadminUserCount();

	ArrayList<Member> selectadminUserList(PageInfo api);

	int deleteUser(Integer no);

	int deleteAdmin(Integer no);

	ArrayList<Room> selectrList();

	int getAllListCount();

	int getrlistCount();

	int getChk(int uNo);

	ArrayList<RoomSign> selectNick(Integer rNo);

	int cancelRoom(Integer rNo);

	int outTime(Integer rsNo);

	ArrayList<Books> selectBlist(Integer bNo);

	int deleteBook(Integer bNo);

	ArrayList<Files> selectBFileName(Integer bNo);

	int updateBook(Books b);

	int updateBAttachment(Files f);

	ArrayList<Member> deleteUserList(Integer no);

	ArrayList<Culture> cDeleteList(Integer cNo);

	int cultureDelete(Integer cNo);

	ArrayList<Culture> selectClist(Integer cNo);

	ArrayList<Files> selectCFileName(Integer cNo);

	ArrayList<Files> selectCFileName2(Integer cNo);

	int updateCulture(Culture c);

	int updateCAttachment(Files f);

	int updateCFile(Files f);

	int getbgListCount();

	ArrayList<BookGroup> selectbgList(PageInfo pi);

	ArrayList<BookGroup> gDeleteList(Integer gNo);

	int bgDelete(Integer gNo);

	int getNoticeListCount();

	ArrayList<Notice> selectNoticeList(PageInfo pi);

	int InsertNotice(Notice n);

	int searchUListCount(AdminSearchValue asv);

	ArrayList<Member> selectSearchResultUList(AdminSearchValue asv, PageInfo pi);

	ArrayList<Member> selectSearchResultAUList(AdminSearchValue asv, PageInfo api);

	int searchAUListCount(AdminSearchValue asv);

	int bListCount();

	ArrayList<Board> selectBoardList(PageInfo pi);

	int CMListCount();

	ArrayList<Comments> selectCommentsList(PageInfo cmpi);

	Board selectDetailBoard(Integer bNo);

	Files selectBFile(Integer bNo);

	int boardDelete(Integer bNo);

	int commentDelete(Integer cNo);

	int searchBoardListCount(BoardSearchValue bsv);

	ArrayList<Board> selectSearchBoardResultList(BoardSearchValue bsv, PageInfo pi);

	int searchBookListCount(SearchCondition sc);

	ArrayList<Books> selectSearchBookResultList(SearchCondition sc, PageInfo pi);

	int searchCultureListCount(CultureSearchCondition csc);

	ArrayList<Culture> selectSearchCultureResultList(CultureSearchCondition csc, PageInfo pi);

	int searchBGroupListCount(BookGroupSearchValue gsv);

	ArrayList<Culture> selectSearchBGroupResultList(BookGroupSearchValue gsv, PageInfo pi);

	int getReListCount();

	ArrayList<Books> selectReList(PageInfo rpi);

	int bkRecommend(Integer bNo);

	int bkCancelRecommend(Integer bNo);

	Notice selectDetailNotice(Integer nNo);

	int noticeDelete(Integer nNo);

	int updateNotice(Notice n);






}
