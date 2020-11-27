package vn.edu.vinaenter.controller.publics;

import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oracle.jrockit.jfr.UseConstantPool;

import vn.edu.vinaenter.daos.BookDAO;
import vn.edu.vinaenter.daos.CatDAO;
import vn.edu.vinaenter.daos.CmtDAO;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Book;
import vn.edu.vinaenter.models.Category;
import vn.edu.vinaenter.models.Comment;
import vn.edu.vinaenter.models.Contact;
import vn.edu.vinaenter.models.Cart;

@Controller
@RequestMapping("")
public class PublicBookController {
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private CmtDAO cmtDAO;
	
	
	@GetMapping({"all","all/{page}"})
	public String all(ModelMap modelMap,@PathVariable(value="page", required=false) Integer page) {
		if(page == null) {
			page=1;
		}
		int totalRow = bookDAO.countItems();
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.PUBLIC_ROW_COUNT);
		int offset = (page -1)*PageDefine.PUBLIC_ROW_COUNT;
		List<Book> listBook = bookDAO.getItemsPagination(offset);
		List<Book> listTOP = bookDAO.getFeatured();
		modelMap.addAttribute("listBook", listBook);
		modelMap.addAttribute("catDAO", catDAO);
		modelMap.addAttribute("bookDAO", bookDAO);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		
		return "public.all";
		
	}
	
	@GetMapping({"danh-muc/{cname}-{cid}.html","danh-muc/{cname}-{cid}.html/{page}"})
	public String index(ModelMap modelMap, @PathVariable int cid, @PathVariable("cname") String cname, @PathVariable(value="page", required=false) Integer page) {
		if(page == null) {
			page=1;
		}
		
		int totalRow = bookDAO.countItems(cid);
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.PUBLIC_ROW_CAT);
		int offset = (page -1)*PageDefine.PUBLIC_ROW_CAT;
		List<Category> listCat = catDAO.getItem();
		Category cat = catDAO.getItem(cid);
		List<Book> listBook = bookDAO.getItem(cid, offset);
		
		modelMap.addAttribute("cat", cat);
		modelMap.addAttribute("listBook", listBook);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("catDAO", catDAO);
		modelMap.addAttribute("bookDAO", bookDAO);
		return "public.cat";
	}
	
	
	@GetMapping("chi-tiet/{name}-{id}.html")
	public String detail(ModelMap modelMap,@PathVariable int id, HttpSession session, @PathVariable("name") String name) {
		Category cat = catDAO.getCat(id);
		Book obj = bookDAO.getBook(id);
		String hasVisited = (String) session.getAttribute("hasVisited: "+ id);
		if(hasVisited == null) {
			session.setAttribute("hasVisited" + id, "yes");
			session.setMaxInactiveInterval(3600);;
			bookDAO.increaseView(obj);
		}
		List<Comment> listCmt = cmtDAO.getItem(id);
		List<Book> listRelated = bookDAO.getRelated(cat,id);
		modelMap.addAttribute("cat", cat);
		modelMap.addAttribute("obj", obj);
		modelMap.addAttribute("listCmt", listCmt);
		modelMap.addAttribute("listRelated", listRelated);
		modelMap.addAttribute("catDAO", catDAO);
		modelMap.addAttribute("cmtDAO", cmtDAO);
		return "public.detail";
	}
	
	@PostMapping(path = "chi-tiet/{name}-{id}.html", produces = "text/html;charset=utf-8")
	public String cmt(@Valid @ModelAttribute("obj") Comment obj, BindingResult br, ModelMap modelMap, RedirectAttributes ra,
			@PathVariable int id, @PathVariable("name") String name ) {
		if(br.hasErrors()) {
			return "redirect:/chi-tiet/"+name+"-"+id+".html";
		}else {
			if(cmtDAO.add(obj,id) > 0) {
				List<Comment> listCmt = cmtDAO.getItem(id);
				ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESS);
				 
			}
			return "redirect:/chi-tiet/"+name+"-"+id+".html";
		}
		
	}
	
	@GetMapping("cart/{id}")
	public String cart(ModelMap modelMap,@PathVariable int id) {
	
		modelMap.addAttribute("catDAO", catDAO);
		return "public.cart";
	}
	
}