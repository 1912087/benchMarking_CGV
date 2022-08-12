package com.mycgv2.dao;

import java.util.ArrayList;
import java.util.List;

import com.mycgv2.vo.CgvNotice2VO;

public class CgvNotice2DAO extends DBConn{
	//totalCount : 게시글 전체 로우 수 출력
	public int totalCount() {
		int result = 0;
		String sql = "SELECT COUNT(NID) FROM CGV_NOTICE2";
		try {
			getPreparedStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//totalCount()
	
	//delete(nid) : 공지사항 삭제
	public int delete(String nid) {
		int result = 0;
		String sql = "DELETE FROM CGV_NOTICE2 WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//delete()
	
	//update(vo) : 공지사항 수정
	public int update(CgvNotice2VO vo) {
		int result = 0;
		String sql = "UPDATE CGV_NOTICE2 SET NTITLE = ?, NCONTENT = ? WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			pstmt.setString(3, vo.getNid());
			
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//update(vo)
	
	//updateHits(id) : 조회수 업데이트
	public int updateHits(String nid) {
		int result = 0;
		String sql = "UPDATE CGV_NOTICE2 SET NHITS = NHITS + 1 WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//updateHits()
	
	//select(id) : 공지사항 세부 정보
	public CgvNotice2VO select(String nid) {
		CgvNotice2VO vo = new CgvNotice2VO();
		String sql = "SELECT NID, NTITLE, NCONTENT, NHITS, NDATE FROM CGV_NOTICE2 WHERE NID = ?";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, nid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setNid(rs.getString(1));
				vo.setNtitle(rs.getString(2));
				vo.setNcontent(rs.getString(3));
				vo.setNhits(rs.getInt(4));
				vo.setNdate(rs.getString(5));
			}
			//close(); // 조회수 카운트를 위하여
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	//insert : 공지사항 등록
	public int insert(CgvNotice2VO vo) {
		int result = 0;
		String sql = "INSERT INTO CGV_NOTICE2 VALUES('n_'||SEQU_CGV_NOTICE2.NEXTVAL, ?, ?, '', '', 0, SYSDATE)";
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, vo.getNtitle());
			pstmt.setString(2, vo.getNcontent());
			result = pstmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//insert()
	
	//select : 공지사항 전체 조회
	public List<CgvNotice2VO> select(int startCount, int endCount){
		List<CgvNotice2VO> list = new ArrayList<CgvNotice2VO>();
		String sql = "SELECT RNO, NID, NTITLE, NHITS, NDATE "
				+ " FROM (SELECT ROWNUM RNO, NID, NTITLE, NHITS, TO_CHAR(NDATE, 'YYYY-MM-DD') AS NDATE "
				+ " FROM (SELECT NID, NTITLE, NHITS, NDATE FROM CGV_NOTICE2 ORDER BY NDATE DESC)) "
				+ " WHERE RNO BETWEEN ? AND ?";
		try {
			getPreparedStatement(sql);
			pstmt.setInt(1, startCount);
			pstmt.setInt(2, endCount);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CgvNotice2VO vo = new CgvNotice2VO();
				
				vo.setRno(rs.getInt(1));
				vo.setNid(rs.getString(2));
				vo.setNtitle(rs.getString(3));
				vo.setNhits(rs.getInt(4));
				vo.setNdate(rs.getString(5));
				
				list.add(vo);
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}//select()
}
