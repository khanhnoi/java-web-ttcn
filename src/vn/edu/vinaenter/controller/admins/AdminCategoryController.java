package vn.edu.vinaenter.controller.admins;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.daos.CatDAO;
import vn.edu.vinaenter.daos.UserDAO;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Category;
import vn.edu.vinaenter.models.User;

@Controller
@RequestMapping("/admin/cat")
public class AdminCategoryController {
	
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping({"","{page}"})
	public String index(ModelMap modelMap, HttpSession session, @PathVariable(value="page", required=false) Integer page, Principal principal) {
		/*if(!AuthUtil.checkLogin(session)) {
			return "redirect:/admincp/login";
		}*/
		if(page == null) {
			page=1;
		}
		//tổng số dòng/số tin trên 1 trang
		int totalRow = catDAO.countItems();
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
		int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
		List<Category> listCat = catDAO.getItemsPagination(offset);
		List<Category> listCatDad = catDAO.getItemDad2(offset);
		
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("account", account);
		modelMap.addAttribute("listCat", listCat);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("listCatDad", listCatDad);
		modelMap.addAttribute("catDAO", catDAO);
		return "admin.cat.index";
	}
	
	@PostMapping({"","{page}"})
	public String index(ModelMap modelMap, @PathVariable(value="page", required=false) Integer page, @RequestParam("search") String search,RedirectAttributes ra ) {
		if ("".equals(search)) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SEARCHERROR);
			return "redirect:/admin/cat";
		}
		if (!(search == null)) {
			if(page == null) {
				page=1;
			}
			int totalRow = catDAO.countItemsSearch(search);
			int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
			int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
			List<Category> listCat = catDAO.search(search,offset);
			modelMap.addAttribute("listCat", listCat);
			modelMap.addAttribute("sumPage", sumPage);
			modelMap.addAttribute("page", page);
		}
		return "admin.cat.search";
	}
	@GetMapping("add")
	public String add(ModelMap modelMap) {
		List<Category> listCat = catDAO.getItem();
		modelMap.addAttribute("listCat", listCat);
		
		return "admin.cat.add";
	}
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objCat") Category objCat,BindingResult br, RedirectAttributes ra, ModelMap modelMap) {
		
		if(br.hasErrors()) {
			List<Category> listCat = catDAO.getItem();
			modelMap.addAttribute("listCat", listCat);
			return "admin.cat.add";
		}
		if(catDAO.search1(objCat) ==0) {
			if( catDAO.addItem(objCat) >0  ) {
				
				ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESS);
				return "redirect:/admin/cat";
			}else {
				ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
				return "admin.cat.add";
			}
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERRORCAT);
			return "redirect:/admin/cat/add";
		}
		
	}
	@GetMapping("del/{cid}")
	public String del(@PathVariable int cid, RedirectAttributes ra, ModelMap modelMap) {
		if(catDAO.delItem(cid)>0) {
			modelMap.addAttribute("catDAO", catDAO);
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/cat";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "admin.cat.index";
		}
	}
	@GetMapping({"edit/{cid}","edit/{cid}/{page}"})
	public String edit(@PathVariable int cid, RedirectAttributes ra, Model model,@PathVariable(value="page", required=false) Integer page ) {
		if(page == null) {
			page=1;
		}
		List<Category> listCat = catDAO.getItemx(cid);
		model.addAttribute("listCat", listCat);
		Category objCat = catDAO.getItem(cid);
		model.addAttribute("cid", cid);
		model.addAttribute("objCat", objCat);
		model.addAttribute("page", page);
		model.addAttribute("catDAO", catDAO);
		if(objCat.getScid() == 0) {
			return "admin.cat.edit";
		}else {
			Category catDad = catDAO.getCatDad(objCat.getScid());
			List<Category> listCat2 = catDAO.getItemx(catDad.getCid());
			model.addAttribute("listCat2", listCat2);
			model.addAttribute("catDad", catDad);
			return "admin.cat.edit2";
		}
	}
	@PostMapping({"edit/{cid}","edit/{cid}/{page}"})
	public String edit(@Valid @ModelAttribute("objCat") Category objCat,BindingResult br,RedirectAttributes ra,
			@PathVariable int cid,@PathVariable(value="page", required=false) Integer page, Model model ) {
		if(br.hasErrors()) {
			List<Category> listCat = catDAO.getItemx(cid);
			model.addAttribute("listCat", listCat);
			return "admin.cat.edit";
		}
		if(page == null) {
			page=1;
		}
		
		if(catDAO.search(objCat, cid) ==0) {
		if( catDAO.editItem(objCat, cid) >0) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSEDIT);
			return "redirect:/admin/cat/"+page;
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "admin.cat.edit";
		}
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERRORCAT);
			return "redirect:/admin/cat/edit/"+cid;
		}
	}
}
