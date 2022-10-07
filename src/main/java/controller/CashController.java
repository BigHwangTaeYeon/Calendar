package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CashDAO;
import vo.ArticleVO;
import vo.CashVO;

@Controller
public class CashController {
	CashDAO cash_dao;
	
	public CashController(CashDAO cash_dao) {
		System.out.println("Controller 구도오옹ㅇ");
		this.cash_dao = cash_dao;
	}

	@RequestMapping("/list.do")
	public String list(Model model, String id) {
		List<CashVO> list= cash_dao.select(id);
		model.addAttribute("m_list",list);
		System.out.println(list);
		return "/WEB-INF/views/cash/cash_list.jsp";
	}
	
	@RequestMapping("/history.do")
	public String history_list(Model model, String id) {
		List<CashVO> list= cash_dao.select(id);
		model.addAttribute("m_list",list);
		System.out.println(list);
		return "/WEB-INF/views/cash/history.jsp";
	}

	@RequestMapping("/delete.do")
	public String delete(int idx, String id) {	// visit_list.jsp에서 idx를 받고
		cash_dao.delete(idx);// dao로 idx를 보낸다
		return "redirect:list.do?id="+id;
	}
	
	@RequestMapping("/insert_income.do")
	public String insert_income(CashVO vo) {
		int res = cash_dao.insert(vo);
		System.out.println("HWang");
		return "redirect:list.do?id="+vo.getId();
	}
	
	
	@RequestMapping("/modify.do")
	public String modify(CashVO vo, String id) {
		int res = cash_dao.update(vo);
		return "redirect:history.do?id="+id;
	}
	
}