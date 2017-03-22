package spring.sts.lfinder;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import spring.model.memo_l.Memo_lDAO;
import spring.model.memo_l.Memo_lDTO;
import spring.utility.lfinder.Utility;


@Controller
public class Memo_lController {
	


	@Autowired
	private Memo_lDAO dao;

	@RequestMapping(value = "/memo_l/delete", method = RequestMethod.GET)
	public String delete(int memono, Model model) {
		model.addAttribute("dto", dao.read(memono));
		return "/memo_l/delete";
	}

	@RequestMapping(value = "/memo_l/delete", method = RequestMethod.POST)
	public String delete(int memono, String nowPage, String col,
			String word, Model model) {

		boolean flag = dao.delete(memono);
		if (flag) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {

			return "error";
		}
	}

	@RequestMapping(value = "/memo_l/update", method = RequestMethod.POST)
	public String update(Memo_lDTO dto,String col, String word,
			String nowPage, Model model) {

		boolean flag = dao.update(dto);
		if (flag) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {
			return "error";
		}

	}

	@RequestMapping(value = "/memo_l/update", method = RequestMethod.GET)
	public String update(int memono, Model model) {
		model.addAttribute("dto", dao.read(memono));
		return "/memo_l/update";
	}

	@RequestMapping("/memo_l/read")
	public String read(int memono, Model model, int nowPage, String col, String word) {
		dao.upViewcnt(memono);

		Memo_lDTO dto = (Memo_lDTO) dao.read(memono);
		String content = dto.getMcontent().replaceAll("\r\n", "<br>");
		dto.setMcontent(content);
		model.addAttribute("dto", dto);
	

		return "/memo_l/read";
	}

	@RequestMapping(value = "/memo_l/create", method = RequestMethod.POST)
	public String create(Memo_lDTO dto) {
		if (dao.create(dto)) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/memo_l/create", method = RequestMethod.GET)
	public String create(HttpServletRequest request) {

		return "/memo_l/create";

	}

	@RequestMapping("/memo_l/list")
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
		int recordPerPage = 5;

		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = dao.total(map);

		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		List<Memo_lDTO> list = dao.list(map);
		Iterator<Memo_lDTO> iter = list.iterator();

		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		// rdao(ReplyDAO)의 값을 request 객체에 담는다.
		

		return "/memo_l/list";
	}

}
