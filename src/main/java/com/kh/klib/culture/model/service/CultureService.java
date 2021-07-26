package com.kh.klib.culture.model.service;

import java.util.ArrayList;

import com.kh.klib.common.model.vo.Files;
import com.kh.klib.common.model.vo.PageInfo;
import com.kh.klib.culture.model.vo.Culture;
import com.kh.klib.culture.model.vo.CultureSearchCondition;
import com.kh.klib.culture.model.vo.CultureSign;
import com.kh.klib.member.model.vo.Member;

public interface CultureService {

	int getListCount();

	ArrayList selectTList(PageInfo pi, int i);

	int getSearchResultListCount(CultureSearchCondition csc);

	ArrayList selectSearchResultTList(CultureSearchCondition csc, PageInfo pi, int i);

	Culture selectCulture(Integer cNo);

	ArrayList<Files> selectFiles(Integer cNo);

	int getApprovalCount(Integer cNo);

	int insertCultureSign(CultureSign cs);

	ArrayList<CultureSign> selectcsList(Integer cNo);

	ArrayList<CultureSign> selectList(int uNo);

	ArrayList<Culture> selectcList();

	int cancelCulture(CultureSign cs);

	int deleteCS(CultureSign cs);

	Member selectMember(int uNo);

	int updateCsMemberApply(CultureSign cs);

	int updateCsMemberNoApply(CultureSign cs);

}
