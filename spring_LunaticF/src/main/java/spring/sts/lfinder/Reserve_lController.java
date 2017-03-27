package spring.sts.lfinder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.reserve_l.Reserve_lDAO;
import spring.model.reserve_l.Reserve_lDTO;
import spring.utility.lfinder.Utility;

@Controller
public class Reserve_lController {
	@Autowired
	private Reserve_lDAO rdao;
	
	@RequestMapping(value="/reserve_l/reply", method=RequestMethod.POST)
	public String reply(Reserve_lDTO dto, Model model, String col, String word, String nowPage) {
		Map map = new HashMap();
		map.put("grpno", dto.getGrpno());
		map.put("ansnum", dto.getAnsnum());
		rdao.addAnsnum(map);
		
		boolean flag = rdao.reply(dto);
		if(flag) {
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			return "redirect:./list";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value="/reserve_l/reply", method=RequestMethod.GET)
	public String reply(int reserveno, Model model) {
		model.addAttribute("dto", rdao.readReply(reserveno));
		
		return "/reserve_l/reply";
	}
	
	@RequestMapping(value="/reserve_l/delete", method=RequestMethod.POST)
	public String delete(int reserveno, Reserve_lDTO dto, Model model, String col, String word, String nowPage) {
		boolean flag = rdao.delete(reserveno);
		if(flag) {
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value="/reserve_l/delete", method=RequestMethod.GET)
	public String delete(int reserveno, Model model) {
		model.addAttribute("flag", rdao.checkRefno(reserveno));
		return "/reserve_l/delete";
	}
	
	@RequestMapping(value="/reserve_l/update", method=RequestMethod.POST)
	public String update(Reserve_lDTO dto, Model model, String col, String word, String nowPage, HttpServletRequest request) {
		boolean flag = rdao.update(dto);
		if(flag) {
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			return "redirect:./list";
		} else {		
			return "error";
		}
	}
	
	@RequestMapping(value="/reserve_l/update", method=RequestMethod.GET)
	public String update(int reserveno, Model model) {
		model.addAttribute("dto", rdao.read(reserveno));
		return "/reserve_l/update";
	}
	
	@RequestMapping("/reserve_l/read")
	public String read(int nowPage, String col, String word, int reserveno, Model model, HttpServletRequest request) {
		rdao.upViewcnt(reserveno);
		
		Reserve_lDTO dto = (Reserve_lDTO)rdao.read(reserveno);
		dto.getRecontent().replaceAll("\r\n", "<br>");
		model.addAttribute("dto", dto);

		return "/reserve_l/read";
	}
	
	@RequestMapping(value="/reserve_l/create", method=RequestMethod.POST)
	public String create(Reserve_lDTO dto, HttpSession session) {
		boolean flag = rdao.create(dto);
		if(flag) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value="/reserve_l/create", method=RequestMethod.GET)
	public String create() {
		return "/reserve_l/create";
	}
	
	@RequestMapping(value="/reserve_l/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
		if(col.equals("total")) {
			word = "";
		}
		
		int nowPage = 1;
		if(request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int recordPerPage = 5;
		
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;
		
		Map map = new HashMap();
		map.put("col",  col);
		map.put("word",  word);
		map.put("sno",  sno);
		map.put("eno",  eno);
		
		List<Reserve_lDTO> list = rdao.list(map);
		int total = rdao.total(map);
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		
		return "/reserve_l/list";
	}
}
