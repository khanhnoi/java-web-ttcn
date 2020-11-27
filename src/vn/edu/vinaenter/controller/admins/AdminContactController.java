package vn.edu.vinaenter.controller.admins;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.daos.ContactDAO;
import vn.edu.vinaenter.daos.UserDAO;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Contact;
import vn.edu.vinaenter.models.User;

@Controller
@RequestMapping("/admin/contact")
public class AdminContactController {
	@Autowired
	private ContactDAO contactDAO;
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping({"","{page}"})
	public String contact(ModelMap modelMap, @PathVariable(value="page", required=false) Integer page, HttpSession session) {
		/*if(!AuthUtil.checkLogin(session)) {
			return "redirect:/admincp/login";
		}*/
		if(page == null) {
			page=1;
		}
		//tổng số dòng/số tin trên 1 trang
		int totalRow = contactDAO.countItems();
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
		int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
		List<Contact> listContact = contactDAO.getItemsPagination(offset);
		modelMap.addAttribute("listContact", listContact);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("contactDAO", contactDAO);
		
		return "admin.contact.index";
	}
	@ResponseBody 
	@PostMapping(path = "active", produces = "text/html;charset=utf-8")
	public String index(
			@RequestParam("id") int id, @RequestParam("active") Integer active
			) { 
		
		Contact contact = contactDAO.getItem(id);
		/*active = active == true ?  false : false;*/
		contact.setActive(active == 1 ? 0 : 1);
		String result = "";
		if(contactDAO.editActive(contact) >0) {
			contact = contactDAO.getItem(id);
			if(contact.getActive() == 1) {
				result += "<a href='javascript:void(0) ' onclick='active("+id+", " +contact.getActive()+");'><img src='"+ request.getContextPath() +"/resources/admin/images/ac.png '/></a>";
			}else {
				result += "<a href='javascript:void(0) ' onclick='active("+id+", " +contact.getActive()+ ");'><img src='"+request.getContextPath() +"/resources/admin/images/de.png '/></a>";
			}
		}
		return result;
	}
	@GetMapping({"edit/{id}","edit/{id}/{page}" })
	public String edit(@PathVariable int id, RedirectAttributes ra, ModelMap modelMap,
			@PathVariable(value="page", required=false) Integer page, Principal principal) {
		if(page == null) {
			page=1;
		}
		Contact objContact = contactDAO.getItem(id);
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("id", id);
		modelMap.addAttribute("objContact",objContact );
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("account", account);
		return "admin.contact.edit";
	}
	
	@PostMapping({"edit/{id}","edit/{id}/{page}" })
	public String edit(@Valid @ModelAttribute("objContact") Contact objContact,BindingResult br,RedirectAttributes ra, @PathVariable(value="page", required=false) Integer page) {
		if(br.hasErrors()) {
			return "admin.cat.edit";
		}
		if(page == null) {
			page=1;
		}
		if(contactDAO.editItem(objContact) >0) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSEDIT);
			return "redirect:/admin/contact/"+ page;
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "admin.contact.edit";
		}
	}
	@GetMapping("del/{id}")
	public String del(ModelMap modelMap, @PathVariable int id, RedirectAttributes ra) {
		if(contactDAO.delItem(id)>0) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/contact";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "admin.contact.index";
		}
		
	}
	
	@GetMapping("delAll")
	public String del(ModelMap modelMap,  RedirectAttributes ra) {
		if(contactDAO.delAll()>0) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/contact";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "admin.contact.index";
		}
		
	}
}
