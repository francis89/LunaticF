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

import spring.model.lfinder.ReDAOSTDInter;
import spring.model.notice_l.NoticeService;
import spring.model.notice_l.Notice_lDAO;
import spring.model.notice_l.Notice_lDTO;
import spring.model.notice_l.Nreply_lDAO;
import spring.model.notice_l.Nreply_lDTO;
import spring.utility.lfinder.Utility;

@Controller
public class Notice_lController {
	@Autowired
	private Notice_lDAO ndao;
	@Autowired
	private Nreply_lDAO nrdao;
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/notice_l/rdelete")
	public String rdelete(int nreplyno, int noticeno, int nowPage, int nPage, String col, String word, Model model){
		int total = nrdao.total(noticeno);// 댓글전체레코드값을 가져와서
		int totalPage = (int) (Math.ceil((double) total / 3)); // 전체 페이지
		if(nrdao.delete(nreplyno)){
			if (nPage != 1 && nPage == totalPage && total % 3 == 1) {// 마지막페이지의
				// 마지막레코드이면(3은
				// 한페이지당보여줄
				// 레코드
				// 갯수)
				nPage = nPage - 1; // 현재의 페이지값에서 1을 빼자
			}
			model.addAttribute("noticeno", noticeno);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
		} else{
			return "error";
		}
		
		return "redirect:./read";
	}
	
	@RequestMapping("/notice_l/rupdate")
	public String rupdate(Nreply_lDTO dto, int nowPage, int nPage,String col, String word, Model model){
		
		if(nrdao.update(dto)){
			model.addAttribute("noticeno", dto.getNoticeno());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("nPage", nPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
		} else {
			return "error";
		}
		
		return "redirect:./read";
	}
	@RequestMapping("/notice_l/rcreate")
	public String rcreate(Nreply_lDTO dto, int nowPage, String col, String word, Model model){
		
		if(nrdao.create(dto)){
			model.addAttribute("noticeno", dto.getNoticeno());
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
		} else {
			return "error";
		}
		
		return "redirect:./read";
	}
	
	@RequestMapping(value="/notice_l/delete", method=RequestMethod.POST)
	public String delete(Model model, HttpServletRequest request, int noticeno, String col, String word, int nowPage){
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		int total = ndao.total(map);
		int totalPage = (int) (Math.ceil((double) total / 5)); // 전체 페이지
		
		String url = "error";
		try {
			service.delete(noticeno);
			if (nowPage != 1 && nowPage == totalPage && total % 5 == 1) {
				nowPage = nowPage - 1;
			}
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			model.addAttribute("nowPage", nowPage);
			url = "redirect:./list";
		} catch (Exception e) {
			// TODO: handle exception
		}
		return url;
	}
	
	@RequestMapping(value="/notice_l/delete", method=RequestMethod.GET)
	public String delete(Model model,int noticeno, String col, String word, String nowPage){
		
		model.addAttribute("noticeno", noticeno);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("nowPage", nowPage);
		
		return "/notice_l/delete";
	}
	
	@RequestMapping(value="/notice_l/update", method=RequestMethod.POST)
	public String update(Notice_lDTO dto, int noticeno, Model model, String col, String word, String nowPage){
		
		boolean flag = ndao.update(dto);
		if(flag){
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("col", col);
			model.addAttribute("word", word);
			return "redirect:./list";
		} else{
			return "error";
		}
		
	}
	
	@RequestMapping(value="/notice_l/update", method=RequestMethod.GET)
	public String update(int noticeno, Model model, String col, String word, String nowPage){
		model.addAttribute("dto", ndao.read(noticeno));
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		
		return "/notice_l/update";
	}
	
	@RequestMapping(value="/notice_l/create", method=RequestMethod.POST)
	public String create(Notice_lDTO dto, HttpServletRequest request){
		boolean flag = ndao.create(dto);
		if(flag){
			return "redirect:./list";
		} else{
			return "error";
		}
		
	}
	
	@RequestMapping(value="/notice_l/create", method=RequestMethod.GET)
	public String create(){
		return "/notice_l/create";
	}
	
	@RequestMapping(value="/notice_l/read")
	public String read(Notice_lDTO dto, int noticeno, Model model, String col, String word, int nowPage, HttpServletRequest request ){
		ndao.upviewcnt(noticeno);
		dto = (Notice_lDTO) ndao.read(noticeno);
		
		String content = dto.getNcontent().replaceAll("\r\n", "<br>");
		dto.setNcontent(content);

		model.addAttribute("dto", dto);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		model.addAttribute("noticeno", noticeno);
		
		/* 댓글 관련 시작 */
		String url = "read";
		int nPage = 1; // 시작 페이지 번호는 1부터

		if (request.getParameter("nPage") != null) {
			nPage = Integer.parseInt(request.getParameter("nPage"));
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수

		int sno = ((nPage - 1) * recordPerPage) + 1; //
		int eno = nPage * recordPerPage;

		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("noticeno", noticeno);
		
		List<Nreply_lDTO> list = nrdao.list(map);
		int total = nrdao.total(noticeno);
		String noName = "noticeno";
		String paging = Utility.paging(total, nPage, recordPerPage, url, noName, noticeno, nowPage, col, word);

		model.addAttribute("rlist", list);
		model.addAttribute("paging", paging);
		model.addAttribute("nPage", nPage);
		
		return "/notice_l/read";
	}

	@RequestMapping(value = "/notice_l/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total")) {
			word = "";
		}
		// 검색end
		// 페이지 관련 ----------------`--------------
		int nowPage = 1; // 현재 페이지(변경가능해야함))
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

		List<Notice_lDAO> list = ndao.list(map);
		int total = ndao.total(map);

		String paging = Utility.paging3(total, nowPage, recordPerPage, col, word);
		request.setAttribute("list", list);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("paging", paging);
		request.setAttribute("nrdao", nrdao);
		ReDAOSTDInter irdao = nrdao;
		request.setAttribute("irdao", irdao);
		// String type = "bbs";
		// request.setAttribute("type", type);

		return "/notice_l/list";
	}
}
