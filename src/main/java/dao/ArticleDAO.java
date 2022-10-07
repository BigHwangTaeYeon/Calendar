package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ArticleVO;

public class ArticleDAO {
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	public int insert(ArticleVO vo) {
		int res = sqlSession.insert("t.article_insert", vo);
		return res;
	}
	public List<ArticleVO> selectList(String id){
	 List<ArticleVO> list = sqlSession.selectList("t.article_list", id);
	 return list;
	}
	public List<ArticleVO> selectInfo(int idx){
		 List<ArticleVO> list = sqlSession.selectList("t.article_info_list", idx);
		 return list;
	}
}
