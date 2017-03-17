package spring.sts.lfinder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.member_l.Member_lDTO;
import spring.utility.lfinder.Utility;

@Controller
public class Finder_lController {
	
	
	@RequestMapping(value = "/finder_l/list")
	public String list(HttpServletRequest request) {


		return "/finder_l/list";
	}

}
