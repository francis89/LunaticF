package spring.sts.lfinder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.sharebbs_l.*;
import spring.utility.lfinder.*;

@Controller
public class Sharebbs_lController {
	
	@Autowired
	private Sharebbs_lDAO dao;
	
	@Autowired
	private Sharebbs_lService service;
	
	@Autowired
	private Sharebbs_lReplyDAO sdao;
	
	
//==================DELETE==================================================================	
	@RequestMapping(value = "/sharebbs_l/delete", method = RequestMethod.POST)
	public String delete(String oldfile, Model model, HttpServletRequest request, 
			int shareno, String col, String word, int nowPage) {
		String basePath = request.getRealPath("/sharebbs_l/storage");
		
		Map map = new HashMap();
		map.put("shareno", shareno);
		int total = dao.total(map);// 전체레코드값을 가져와서
		int totalPage = (int) (Math.ceil((double) total / 5)); // 전체 페이지
		String url = "passwdError";
		
		try {
			service.delete(shareno);
			Utility.deleteFile(basePath, oldfile);
			if (nowPage != 1 && nowPage == totalPage && total % 5 == 1) {
				nowPage = nowPage - 1;
			}
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			url = "redirect:./list";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			url = "error";
		}
		return url;

	}

	@RequestMapping(value = "/sharebbs_l/delete", method = RequestMethod.GET)
	public String delete(Model model, int shareno, String oldfile, 
			String col, String word, String nowPage) {

		boolean flag = true;
		
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("shareno", shareno);
		model.addAttribute("oldfile", oldfile);
		model.addAttribute("flag", flag);

		return "/sharebbs_l/delete";

	}	
	
	
//===============UPDATE============================================================	
	@RequestMapping(value = "/sharebbs_l/update", method = RequestMethod.POST)
	public String update(Sharebbs_lDTO dto, int shareno, Model model, String oldfile, 
			String col, String word, String nowPage, HttpServletRequest request) {
		
		String basePath = request.getRealPath("/WEB-INF/views/sharebbs_l/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "";
		if (filesize > 0) {
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}

		dto.setFilename(filename);
		dto.setFilesize(filesize);

		Map map = new HashMap();
		map.put("shareno", dto.getShareno());

			if (dao.update(dto)) {
				Utility.deleteFile(basePath, oldfile);
				model.addAttribute("nowPage", nowPage);
				model.addAttribute("col", col);
				model.addAttribute("word", word);
				return "redirect:./list";
			} else {
				return "error";
			}
	}


	@RequestMapping(value = "/sharebbs_l/update", method = RequestMethod.GET)
	public String update(int shareno, Model model, String col, String word, 
			String nowPage) {
		model.addAttribute("dto", dao.read(shareno));
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		return "/sharebbs_l/update";
	}	
	
	
	
//=========READ============================================================
	@RequestMapping("/sharebbs_l/read")
	public String read(int shareno, Model model, int nowPage, String col, 
			String word, HttpServletRequest request) {
		
		dao.upViewcnt(shareno);
		Sharebbs_lDTO dto = dao.read(shareno);
		dto.setShcontent(dto.getShcontent().replaceAll("\r\n", "<br>"));
		
		model.addAttribute("dto", dto);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		
		/* 댓글 관련 시작 */
		String url = "read";
		int nPage = 1; // 시작 페이지 번호는 1부터

		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		
		int recordPerPage = 5; // 한페이지당 출력할 레코드 갯수

		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("shareno", shareno);

		List<Sharebbs_lReplyDTO> list = sdao.list(map);

		int total = sdao.total(shareno);
		String no = "sharenono";
		String paging = Utility.paging(total, nPage, recordPerPage, url, no, shareno, nowPage, col, word);

		model.addAttribute("rlist", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nPage", nPage);

		/* 댓글 관련 끝 */

		return "/sharebbs_l/read";

	}
	
	
//=========CREATE============================================================
	@RequestMapping(value = "/sharebbs_l/create", method = RequestMethod.POST)
	public String create(HttpServletRequest request, Sharebbs_lDTO dto) {

		String basePath = request.getRealPath("/WEB-INF/views/sharebbs_l/storage");
		int filesize = (int) dto.getFileMF().getSize();
		String filename = "";
		
		if (filesize > 0) {
			filename = Utility.saveFile(dto.getFileMF(), basePath);
		}else{
			filename = "default.jpg";
		}
		
		dto.setFilename(filename);
		dto.setFilesize(filesize);
		
		if (dao.create(dto)) {
			return "redirect:./list";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/sharebbs_l/create", method = RequestMethod.GET)
	public String create() {

		return "/sharebbs_l/create";
	}

	
//=========LIST=============================================================
	@RequestMapping(value= "/sharebbs_l/list")
	public String list(HttpServletRequest request){
		// 검색관련------------------------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}
		// 페이지관련-----------------------
		int nowPage = 1;// 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int recordPerPage = 15;// 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번-----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		List<Sharebbs_lDTO> list = dao.list(map);
		int total = dao.total(map);
		
		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);

		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);
		request.setAttribute("list", list);
		request.setAttribute("sdao", sdao);
		
		
		// list.jsp에서 댓글 갯수 가져올 <util:rcount(num,rdao)>에서 사용할 
		// rdao(ReplyDAO)의 값을 request 객체에 담는다. 
	
		return "/sharebbs_l/list";
	}

	
	
//==========================REDELETE===================================================================	
	@RequestMapping("/sharebbs_l/rdelete")
	public String rdelete(int shrnum, int shareno, int nowPage, 
			int nPage, String col, String word, Model model) {
		int total = sdao.total(shareno);// 댓글전체레코드값을 가져와서
		int totalPage = (int) (Math.ceil((double) total / 3)); // 전체 페이지
		if (sdao.delete(shrnum)) {
			if (nPage != 1 && nPage == totalPage && total % 3 == 1) {
		// 마지막페이지의 마지막레코드이면(3은 한페이지당보여줄 레코드 갯수)
				nPage = nPage - 1; // 현재의 페이지값에서 1을 빼자
			}
			model.addAttribute("shareno", shareno);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);

		} else {
			return "error/error";
		}

		return "redirect:./read";
	}

	
//================RUPDATE==================================================
	@RequestMapping("/sharebbs_l/rupdate")
	public String rupdate(Sharebbs_lReplyDTO dto, int nowPage, int nPage, 
			String col, String word, Model model) {
		if (sdao.update(dto)) {
			model.addAttribute("shareno", dto.getShareno());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
		} else {
			return "error/error";
		}

		return "redirect:./read";
	}


//================RCREATE==================================================	
	@RequestMapping("/sharebbs_l/rcreate")
	public String rcreate(Sharebbs_lReplyDTO dto, int nowPage, String col, 
			String word, Model model) {

		if (sdao.create(dto)) {
			model.addAttribute("shareno", dto.getShareno());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
		} else {
			return "error/error";
		}

		return "redirect:./read";
	}
	
}
