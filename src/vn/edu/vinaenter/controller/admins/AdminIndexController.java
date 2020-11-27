package vn.edu.vinaenter.controller.admins;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.edu.vinaenter.daos.BookDAO;
import vn.edu.vinaenter.daos.CatDAO;
import vn.edu.vinaenter.daos.ContactDAO;
import vn.edu.vinaenter.daos.UserDAO;
import vn.edu.vinaenter.models.User;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private ContactDAO contactDAO;
	
	@GetMapping("")
	public String index(Principal principal, ModelMap modelMap) {
		int coutCat = catDAO.countItems(); 
		int coutBook = bookDAO.countItems();
		int coutUser = userDAO.countItems();
		int countContact = contactDAO.countItems();
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("account", account);
		modelMap.addAttribute("coutCat", coutCat);
		modelMap.addAttribute("coutBook",coutBook );
		modelMap.addAttribute("coutUser",coutUser );
		modelMap.addAttribute("countContact",countContact );
		return "admin.index";
	}
	@GetMapping("/profile")
	public String profile(ModelMap modelMap, Principal principal) {
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("account", account);
		return "admin.profile";
	}
}
