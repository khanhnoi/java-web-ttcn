package vn.edu.vinaenter.controller.auth;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.daos.CatDAO;
import vn.edu.vinaenter.daos.UserDAO;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.models.User;

@Controller
@RequestMapping("authpl")
public class AuthPublicController {
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private UserDAO userDAO;
	private User objU;
	
	@GetMapping("account")
	public String account(ModelMap modelMap) {
		modelMap.addAttribute("catDAO", catDAO);
		return "public.account";
	}
	
	@PostMapping("/account")
	public String login(ModelMap modelMap,@ModelAttribute("objUser") User objUser,HttpSession session, @RequestParam("password") String password,RedirectAttributes ra ) {
		 objUser.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
		objU = userDAO.checkLogin(objUser);
		//System.out.println(objU.toString());
		if(!"".equals(objU))  {
			session.setAttribute("userInfo", objU);
			return "redirect:/";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERRORLOGIN);
			return "redirect:/authpl/account";
		}
		
	}
}
