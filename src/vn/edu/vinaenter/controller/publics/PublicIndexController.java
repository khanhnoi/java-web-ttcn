package vn.edu.vinaenter.controller.publics;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.daos.BookDAO;
import vn.edu.vinaenter.daos.CatDAO;
import vn.edu.vinaenter.daos.UserDAO;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Book;

@Controller
@RequestMapping("")
public class PublicIndexController {
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping("")
	public String index(ModelMap modelMap ) {
		List<Book> listNew = bookDAO.getNew();
		List<Book> listPopular = bookDAO.getPopular();
		List<Book> listFeatured = bookDAO.getFeatured();
		modelMap.addAttribute("listNew", listNew);
		modelMap.addAttribute("listPopular", listPopular);
		modelMap.addAttribute("listFeatured", listFeatured);
		modelMap.addAttribute("catDAO", catDAO);
		return "public.index";
	}
	@PostMapping({"search","search/{page}"})
	public String index(ModelMap modelMap, @PathVariable(value="page", required=false) Integer page, @RequestParam("search") String search,RedirectAttributes ra ) {
		if ("".equals(search)) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SEARCHERROR);
			modelMap.addAttribute("catDAO", catDAO);
			return "redirect:/";
		}
		if (!(search == null)) {
			if(page == null) {
				page=1;
			}
			int totalRow = bookDAO.countItems();
			int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
			int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
			List<Book> listBook = bookDAO.getSearch(search, offset);
			modelMap.addAttribute("page", page);
			modelMap.addAttribute("sumPage", sumPage);
			modelMap.addAttribute("listBook", listBook);
			modelMap.addAttribute("catDAO", catDAO);
			modelMap.addAttribute("bookDAO", bookDAO);
		}
		return "public.search";
	}
	@ResponseBody 
	@PostMapping(path = "increLove", produces = "text/html;charset=utf-8")
	public String index(
			@RequestParam("id") int id
			) { 
		
		Book books = bookDAO.getItems(id);
		
		String result = "";
		if(bookDAO.increLove(books) >0) {
			books = bookDAO.getItems(id);
				result += "<a href=\"javascript:void(0)\" onclick=\"active(${objPopular.id});\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Add to Wishlist\"><span class=\"fa fa-heart-v\">"+books.getLove()+"</span></a> ";
		}
		return result;
		
	}
	
	@ResponseBody 
	@PostMapping(path = "increLike", produces = "text/html;charset=utf-8")
	public String indexLike(
			@RequestParam("id") int id
			) { 
		
		Book books = bookDAO.getItems(id);
		
		String result = "";
		if(bookDAO.increLike(books) >0) {
			books = bookDAO.getItems(id);
				result += "<a href=\"javascript:void(0)\" onclick=\"activeL(${objPopular.id});\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Compare\">\r\n" + 
						"<span class=\"fa fa-exchangeLike\">"+books.getLikes()+"</span></a>";
		}
		return result;
		
	}
	
	@ResponseBody 
	@PostMapping(path = "increDLike", produces = "text/html;charset=utf-8")
	public String indexDLike(
			@RequestParam("id") int id
			) { 
		
		Book books = bookDAO.getItems(id);
		
		String result = "";
		if(bookDAO.increDLike(books) >0) {
			books = bookDAO.getItems(id);
				result += "<a href=\"javascript:void(0)\" onclick=\"activeL(${obj.id});\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Compare\">\r\n" + 
						"                        <span class=\"fa fa-exchange\">"+books.getLikes()+"</span></a>\r\n" + 
						"                        </span>\r\n" + 
						"                        \r\n" + 
						"                        \r\n" + 
						"                        <a href=\"javascript:void(0)\" onclick=\"activeDL(${obj.id});\" data-toggle2=\"tooltip\" data-placement=\"top\" >\r\n" + 
						"                        <span class=\"fa fa-search\"></span></a>    ";
		}
		return result;
		
	}
}
