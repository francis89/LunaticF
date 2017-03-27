package spring.sts.lfinder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.member_l.Member_lDAO;
import spring.model.member_l.Member_lDTO;
import spring.utility.lfinder.Utility;

@Controller
public class Member_lController {
	@Autowired
	private Member_lDAO mdao;
	
	@RequestMapping(value="/member_l/delete",method=RequestMethod.POST)
	public String delete(HttpSession session, String id,HttpServletRequest request){
		
		
		boolean flag = mdao.delete(id);
		if(flag){
		
			session.invalidate();
			return "redirect:../";
		}else{
			return "error";
		}
		
	}
	@RequestMapping(value="/member_l/delete",method=RequestMethod.GET)
	public String delete(Model model, HttpSession session){
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("id", id);
		
		return "/member_l/delete";
	}
	
	@RequestMapping(value = "/member_l/updatePw", method = RequestMethod.POST)
	public String updatePw(String id, String passwd) {
		if (mdao.updatePw(id, passwd)) {
			return "redirect:./read";
		} else {
			return "error";
		}

	}

	@RequestMapping(value = "/member_l/updatePw", method = RequestMethod.GET)
	public String updatePw() {

		return "/member_l/updatePw";
	}

	@RequestMapping(value = "/member_l/update", method = RequestMethod.POST)
	public String update(HttpSession session, Member_lDTO dto, Model model, String col, String word, String nowPage) {
		String id = (String) session.getAttribute("id");
		String grade = (String) session.getAttribute("grade");

		if (mdao.update(dto)) {
			if (nowPage != null && !nowPage.equals("")) {
				model.addAttribute("nowPage", nowPage);
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				return "redirect:../admin/list";
			} else {
				return "redirect:../";
			}
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/member_l/update", method = RequestMethod.GET)
	public String update(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		if (id == null) {
			id = (String) session.getAttribute("id");
		}
		Member_lDTO dto = mdao.read(id);

		request.setAttribute("dto", dto);
		request.setAttribute("id", id);

		return "/member_l/update";
	}
	
	@RequestMapping("/member_l/read")
	public String read(HttpServletRequest request, HttpSession session) {
		// 관리자가 list에서 id를 클릭하고 사용자 상세정보보기
		String id = request.getParameter("id");
		// read.jsp에서 회원목록 버튼 보여주기 위한 권한
		String grade = (String) session.getAttribute("grade");

		// 일반 사용자가 로그인후 나의정보 메뉴를 클릭하고 본인정보 확인할때
		if (id == null) { // 관리자가 아닐때
			id = (String) session.getAttribute("id");
		}
		Member_lDTO dto = mdao.read(id);

		request.setAttribute("id", id);
		request.setAttribute("grade", grade);
		request.setAttribute("dto", dto);

		return "/member_l/read";
	}
	
	@RequestMapping("/member_l/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:../";
	}

	@RequestMapping(value = "/member_l/login", method = RequestMethod.POST)
	public String login(String id, String passwd, HttpSession session, 
						String c_id, 
						String no,
						String nowPage, 
						String nPage,
						String col, 
						String word,
						String bflag,
						String type,
						Model model,
						HttpServletResponse response) {
		Map map = new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);
		
		boolean flag = mdao.loginCheck(map);
		String grade = null;
		if (flag) { // 회원인 경우
			grade = mdao.getGrade(id);
			session.setAttribute("id", id);
			session.setAttribute("grade", grade);
			// ----------------------------------------------
			// Cookie 저장, Checkbox는 선택하지 않으면 null 임
			// ----------------------------------------------
			Cookie cookie = null;

			if (c_id != null) { // 처음에는 값이 없음으로 null 체크로 처리
				cookie = new Cookie("c_id", "Y"); // 아이디 저장 여부 쿠키
				cookie.setMaxAge(120); // 2 분 유지
				response.addCookie(cookie); // 쿠키 기록

				cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키
				cookie.setMaxAge(120); // 2 분 유지
				response.addCookie(cookie); // 쿠키 기록

			} else {
				cookie = new Cookie("c_id", ""); // 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", ""); // 쿠키 삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			String url = "redirect:/";
			if(bflag != null && !bflag.equals("")){
			model.addAttribute(type, no);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			url = "redirect:"+bflag;
			}
			
			return url;
		} else {
			return "/member_l/idPwError";
		}
	}
	
	@RequestMapping(value = "/member_l/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		/*----쿠키설정 내용시작----------------------------*/
		String c_id = ""; // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {
					c_id = cookie.getValue(); // Y
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue(); // user1...
				}
			}
		}
		/*----쿠키설정 내용 끝----------------------------*/

		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);

		return "/member_l/login";
	}

	@RequestMapping("/member_l/id_Form")
	public String id_Form(String id, Model model) {

		return "member_l/id_Form";
	}

	@RequestMapping("/member_l/id_Proc")
	public String id_Proc(String id, Model model) {
		boolean flag = mdao.idCheck(id);
		model.addAttribute("id", id);
		model.addAttribute("flag", flag);

		return "member_l/id_Proc";
	}
	
	@RequestMapping(value = "/member_l/create", method = RequestMethod.POST)
	public String create(Member_lDTO dto, HttpServletRequest request, String id) {
		String str = "";
		String viewPage = "member/prcreateProc";

		if (mdao.idCheck(id)) {
			str = "중복된 ID";
			request.setAttribute("str", str);
		} else {
			boolean flag = mdao.create(dto);
			if (flag) {
				viewPage = "redirect:../";
			} else {
				viewPage = "error";
			}
		}

		return viewPage;
	}

	@RequestMapping(value = "/member_l/create", method = RequestMethod.GET)
	public String create() {
		return "/member_l/create";
	}

	@RequestMapping(value = "/admin/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 5; // 현 페이지당 보여줄 레코드 갯수

		// DB에서 읽어줄 시작순번과 끝순번 생성
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		// 검색에 대한 데이터를 리스트에가서 뽑아와야함.
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<Member_lDTO> list = mdao.list(map);
		int total = mdao.total(map);

		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);

		return "/member_l/list";
	}

}
