package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ArticleDAO;
import dao.LoginDAO;
import vo.ArticleVO;
import vo.MemberVO;

@Controller
public class LoginController {

	LoginDAO login_dao;

	public void setLogin_dao(LoginDAO login_dao) {
		this.login_dao = login_dao;
	}
	
	ArticleDAO article_dao;
	
	public void setArticle_dao(ArticleDAO article_dao)
	{
		this.article_dao = article_dao;
	}

	@RequestMapping("/Article_form.do")
	public String articleForm(/* Model model, String f_time */) {
		
		/* model.addAttribute("f_time",f_time); */
		return "/WEB-INF/views/Member/article_form.jsp";
	}
	
	@RequestMapping("/article_list.do")
	public String article_list(Model model, String id) {
		List<ArticleVO> list= article_dao.selectList(id);
		model.addAttribute("list",list);
		System.out.println(list);
		return "/WEB-INF/views/Member/article_list.jsp";
	}
	
	@RequestMapping("/article_info.do")
	public String article_info_list(Model model, int idx) {
		List<ArticleVO> list= article_dao.selectInfo(idx);
		model.addAttribute("list",list);
		System.out.println(list);
		return "/WEB-INF/views/Member/article_info.jsp";
	}

	@RequestMapping("/Article.do")
	public String article(ArticleVO vo) {
		int res = article_dao.insert(vo);
		return "redirect:article_list.do?id="+vo.getId();
	}
	
//	@RequestMapping(value = { "/", "/main.do" })
//	public String checkLogin() {
//		return "/WEB-INF/views/Member/main.jsp";
//	}

	@RequestMapping("/login_form.do")
	public String loginForm() {
		return "/WEB-INF/views/Member/login_form.jsp";
	}

	@RequestMapping("/login.do")
	@ResponseBody
	public String loginCheck(MemberVO vo, HttpServletRequest request) {
		MemberVO baseVO = login_dao.select(vo);

		String resultStr = "";
		
		// id가 존재하지 않는 경우
		if (baseVO == null) {
			resultStr = "no_id";
			return resultStr; // no_id를 콜백메서드로 전달
		}

		// 비밀번호 불일치
		if (!baseVO.getPwd().equals(vo.getPwd())) {
			resultStr = "no_pwd";
			return resultStr; // no_pwd를 콜백메서드로 전달
		}

		// 아이디와 비밀번호에 문제가 없다면 세션에 MemberVO 객체를 저장
		// 세션에 저장된 데이터는 현재 프로젝트의 모든 jsp에서 사용이 가능
		HttpSession session = request.getSession();
		session.setAttribute("user", baseVO);

		resultStr = "clear";
		return resultStr; // 로그인 성공시 clear를 콜백메서드로 전달

	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		return "redirect:login_form.do";
	}

	@RequestMapping("/insert_form.do")
	public String insert_form() {
		return "/WEB-INF/views/Member/join_form.jsp";
	}

	@RequestMapping("/insert.do")
	public String insert(MemberVO vo) {
		
		int res = login_dao.insert(vo);
		return "redirect:main.do";
	}

	@RequestMapping("/id_check.do")
	@ResponseBody
	public String id_check(MemberVO vo, HttpServletRequest request) {
		System.out.println(vo.getId());
		int baseVO = login_dao.id_check(vo);
		System.out.println(baseVO);
		String resultStr = "";

		// id가 존재하는경우
		if (baseVO == 1) {
			resultStr = "no";
			return resultStr; // no를 콜백메서드로 전달
		} else if(baseVO == 0){
			resultStr = "yes";
			return resultStr; // no를 콜백메서드로 전달
		}
		else {
			resultStr ="null";
			return resultStr;
		}

	}

}
