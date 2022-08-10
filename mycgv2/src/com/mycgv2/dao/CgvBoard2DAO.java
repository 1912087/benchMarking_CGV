package com.mycgv2.dao;

import java.util.ArrayList;
import java.util.List;

import com.mycgv2.vo.CgvBoard2VO;

public class CgvBoard2DAO extends DBConn {
	//updateHits : 조회수 업데이트
	public int updateHits(String bid) {
		int result = 0;
		String sql = "UPDATE CGV_BOARD2 SET BHITS = BHITS + 1 WHERE BID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//delete(id) : 게시글 삭제
	public int delete(String bid) {
		int result = 0;
		String sql = "DELETE FROM CGV_BOARD2 WHERE BID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//delete()
	
	//update(id) : 게시글 수정
	public int update(CgvBoard2VO vo) {
		int result = 0;
		String sql = "UPDATE CGV_BOARD2 SET BTITLE = ?, BCONTENT = ? WHERE BID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			pstmt.setString(3, vo.getBid());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//update(id)
	
	//select(id) : 게시글 상세 조회
	public CgvBoard2VO select(String bid) {
		CgvBoard2VO vo = new CgvBoard2VO();
		String sql = "SELECT BID, BTITLE, BCONTENT, BHITS, BDATE FROM CGV_BOARD2 WHERE BID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setBid(rs.getString(1));
				vo.setBtitle(rs.getString(2));
				vo.setBcontent(rs.getString(3));
				vo.setBhits(rs.getInt(4));
				vo.setBdate(rs.getString(5));
			}
			
			//close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}//select(id)
	
	//insert() : 게시글 등록
	public int insert(CgvBoard2VO vo) {
		int result = 0;
		String sql = "INSERT INTO CGV_BOARD2 VALUES('b_'||SEQU_CGV_BOARD2.NEXTVAL, ?, ?, '', '', 0, SYSDATE)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getBtitle());
			pstmt.setString(2, vo.getBcontent());
			
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}//insert()
	
	//select() : 게시글 전체 조회
	public List<CgvBoard2VO> select(){
		List<CgvBoard2VO> list = new ArrayList<CgvBoard2VO>();
		String sql = "SELECT ROWNUM RNO, BID, BTITLE, BCONTENT, BHITS, TO_CHAR(BDATE, 'YY-MM-DD') "
				+ " FROM (SELECT BID, BTITLE, BCONTENT, BHITS, BDATE FROM CGV_BOARD2 ORDER BY BDATE DESC)";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CgvBoard2VO vo = new CgvBoard2VO();
				
				vo.setRno(rs.getInt(1));
				vo.setBid(rs.getString(2));
				vo.setBtitle(rs.getString(3));
				vo.setBcontent(rs.getString(4));
				vo.setBhits(rs.getInt(5));
				vo.setBdate(rs.getString(6));
				
				list.add(vo);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}//select()
}
