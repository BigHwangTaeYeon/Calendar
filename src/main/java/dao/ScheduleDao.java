package dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.DateData;
import vo.ScheduleDto;


public class ScheduleDao {
	
	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<ScheduleDto> schedule_list(DateData dateData){
		System.out.println("dateData 1 : " + dateData);
		List<ScheduleDto> list = sqlSession.selectList("schedule.schedule_list", dateData);
		System.out.println("dateData 2 : " + dateData);
		return list;
	}
	
	public int schedule_add(ScheduleDto scheduleDto) {
		int res = sqlSession.insert("schedule.schedule_add", scheduleDto);
		return res;
	}
	
	public int before_schedule_add_search(ScheduleDto scheduleDto) {
		int count = sqlSession.selectOne("schedule.before_schedule_add_search", scheduleDto);
		return count;
	}
	
	/* 리스트 출력 */
	public List<ScheduleDto> calendar_list(){
		List<ScheduleDto> list = sqlSession.selectList("schedule.schedule_list");
		return list;
	}
	public List<ScheduleDto> calendar_list(String m_id){
		System.out.println("DAO m_id : " + m_id);
		List<ScheduleDto> list = sqlSession.selectList("schedule.schedule_list", m_id);
		return list;
	}
	
	/* 수정, 삭제를 위한 리스트 불러오기 */
	/* 조회하기 */
	public ScheduleDto get(int schedule_idx) {
		ScheduleDto list = sqlSession.selectOne("schedule.get", schedule_idx);
		return list;
	}
	public List<ScheduleDto> selectInfo(int idx){
		 List<ScheduleDto> list = sqlSession.selectList("schedule.get", idx);
		 return list;
	}
	
	/* 수정하기 */
//	public int update(ScheduleDto scheduleDto) {
//		int res = sqlSession.update("schedule.update", scheduleDto);
//		return res;
//	}
	public int update(ScheduleDto scheduleDto) {
		System.out.println("1");
		int res = sqlSession.update("schedule.update", scheduleDto);
		System.out.println("2");
		return res;
	}
	
	/* 삭제하기 */
	public int delete(int schedule_idx) {
		return sqlSession.delete("schedule.delete", schedule_idx);
	}
	
}