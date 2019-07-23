package kr.or.ddit.member.member.service;

import java.util.List;

import kr.or.ddit.member.member.model.MemberVo;
import kr.or.ddit.page.model.PageVo;

public interface IMemberService {
	/**
	 * Method : getMemList
	 * 작성자 : PC21
	 * 변경이력 : 
	 * @return
	 * Method 설명 : 사용자 전체 리스트 조회
	 */
	List<MemberVo> getMemList();
	

	
	/**
	 * Method : deleteMem
	 * 작성자 : PC21
	 * 변경이력 : 
	 * @param userId
	 * @return
	 * Method 설명 :사용자 삭제
	 */
	int deleteMem(String mem_id);
	
	/**
	 * Method : getMemVo
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param userId
	 * @return
	 * Method 설명 : 사용자 정보조회
	 */
	MemberVo getMemVo(String mem_id);
	
	/**
	 * Method : memberCnt
	 * 작성자 : PC21
	 * 변경이력 :
	 * @return
	 * Method 설명 : 사용자 전체수 조회
	 */
	int memberCnt();
	
	/**
	 * Method : updateMem
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param userVo
	 * @return
	 * Method 설명 :사용자 업데이트
	 */
	int updateMember(MemberVo memVo);
	
	
	
	/**
	 * Method : updateMem
	 * 작성자 : PC02
	 * 변경이력 :
	 * @param userVo
	 * @return
	 * Method 설명 :사용자(대상자) 업데이트
	 */
	int updatePMember(MemberVo memVo);
	
	
	
	/**
	 * Method : memPagingList
	 * 작성자 : PC21
	 * 변경이력 :
	 * @param pageVo
	 * @return
	 * Method 설명 : 사용자 페이징 
	 */
	List<MemberVo> memPagingList(PageVo pageVo);



}
