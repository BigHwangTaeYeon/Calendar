package dao;

import org.apache.ibatis.session.SqlSession;

import vo.MemberVO;

public class LoginDAO {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public MemberVO select(MemberVO vo) {
		MemberVO baseVO = sqlSession.selectOne("u.id_check", vo);
		return baseVO;
	}
	public int insert(MemberVO vo) {
		int res = sqlSession.insert("u.member_insert", vo);
		return res;
	}
	public int id_check(MemberVO vo) {
		int res = sqlSession.selectOne("u.id_overlap", vo);
		return res;
	}
}
