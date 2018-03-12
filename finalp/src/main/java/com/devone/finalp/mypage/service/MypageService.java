package com.devone.finalp.mypage.service;

import com.devone.finalp.common.model.vo.Member;

public interface MypageService {
	int memberModify(Member member);
	int memberDelete(Member member);
}
