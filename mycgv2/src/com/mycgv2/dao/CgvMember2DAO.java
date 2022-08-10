package com.mycgv2.dao;

import java.util.ArrayList;
import java.util.List;

import com.mycgv2.vo.CgvMember2VO;

public class CgvMember2DAO extends DBConn{
	//search : 특정 회원 정보 조회
	public CgvMember2VO search(String id) {
		CgvMember2VO vo = new CgvMember2VO();
		String sql = "SELECT ID, NAME, ZONECODE, ADDR1, ADDR2, PNUMBER, HOBBYLIST, INTRO, MDATE FROM CGV_MEMBER2 WHERE ID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				vo.setId(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setZonecode(rs.getString(3));
				vo.setAddr1(rs.getString(4));
				vo.setAddr2(rs.getString(5));
				vo.setPnumber(rs.getString(6));
				vo.setHobbyList(rs.getString(7));
				vo.setIntro(rs.getString(8));
				vo.setMdate(rs.getString(9));
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}//search()
	
	//selectAll : 회원 조회
	public List<CgvMember2VO> selectAll(){
		List<CgvMember2VO> list = new ArrayList<CgvMember2VO>();
		String sql = "SELECT ROWNUM RNO, ID, NAME, PNUMBER, TO_CHAR(MDATE, 'YY-MM-DD') MDATE FROM "
				+ " (SELECT ID, NAME, PNUMBER, MDATE FROM CGV_MEMBER2 ORDER BY MDATE DESC)";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery(sql);
			while(rs.next()) {
				CgvMember2VO vo = new CgvMember2VO();
				vo.setRno(rs.getInt(1));
				vo.setId(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setPnumber(rs.getString(4));
				vo.setMdate(rs.getString(5));
				
				list.add(vo);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}//selectAll()
	
	//select : 로그인 페이지
	public int select(CgvMember2VO vo) {
		int result = 0;
		String sql = "SELECT (SUM((CASE WHEN ID = ? THEN 1 ELSE 0 END)) + " + 
				" SUM((CASE WHEN ID = ? AND PASS = ? THEN 1 ELSE 0 END))) AS TOTAL " + 
				" FROM CGV_MEMBER2";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getPass());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//insert : 회원 가입 페이지
	public int insert(CgvMember2VO vo) {
		int result = 0;
		String sql = "INSERT INTO CGV_MEMBER2 VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
		try {
			getPreparedStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getZonecode());
			pstmt.setString(7, vo.getAddr1());
			pstmt.setString(8, vo.getAddr2());
			pstmt.setString(9, vo.getHp());
			pstmt.setString(10, vo.getPnumber());
			pstmt.setString(11, vo.getHobbyList());
			pstmt.setString(12, vo.getIntro());
			
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
