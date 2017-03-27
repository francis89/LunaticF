package spring.sts.lfinder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Finder_lController {
	
	
	@RequestMapping(value = "/finder_l/read")
	public String read(HttpServletRequest request, int i,String ida ,Model model) {

		model.addAttribute("i",i);
		model.addAttribute("ida",ida);
		return "/finder_l/read";
	}
	@RequestMapping(value = "/finder_l/list")
	public String list(HttpServletRequest request) {
		
		
		return "/finder_l/list";
	}

}
