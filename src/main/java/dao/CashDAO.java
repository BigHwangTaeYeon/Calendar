package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ArticleVO;
import vo.CashVO;

public class CashDAO {
	
	SqlSession sqlSession;
	
	public CashDAO (SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		System.out.println("-- DeptDAO --");
		System.out.println("sql : " + this.sqlSession);
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<CashVO> select(String id){
		List<CashVO> list = sqlSession.selectList("cash.cash_list", id);
		return list;
	}

	// 게시글 삭제
	public int delete(int idx) { // controller에서 보낸 idx를 받음
		return sqlSession.delete("cash.cash_delete", idx);
	}
	
	public int insert(CashVO vo) {
		int res = sqlSession.insert("cash.cash_insert", vo);
		return res;
	}
	
	public int update(CashVO vo) {
		int res = sqlSession.update("cash.cash_update", vo);
		return res;
	}

}