package vn.edu.vinaenter.controller.admins;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.daos.BookDAO;
import vn.edu.vinaenter.daos.CatDAO;
import vn.edu.vinaenter.daos.RoleDAO;
import vn.edu.vinaenter.daos.UserDAO;
import vn.edu.vinaenter.defines.FileDefine;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Book;
import vn.edu.vinaenter.models.Category;
import vn.edu.vinaenter.models.Role;
import vn.edu.vinaenter.models.User;

@Controller
@RequestMapping("/admin/book")
public class AdminBookController {
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private RoleDAO roleDAO;
	
	@GetMapping({ "", "{page}" })
	public String index(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page,
			HttpSession session, Principal principal) {

		if (page == null) {
			page = 1;
		}
		// tổng số dòng/số tin trên 1 trang
		int totalRow = bookDAO.countItems();
		int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
		int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
		List<Book> listBook = bookDAO.getItemsPagination1(offset);
		User account = userDAO.getItem(principal.getName());
		
		modelMap.addAttribute("listBook", listBook);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("account", account);
		System.out.println("");
		
		return "admin.books.index";
	}

	@PostMapping({ "", "{page}" })
	public String index(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page,
			@RequestParam("search") String search, RedirectAttributes ra) {
		if ("".equals(search)) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SEARCHERROR);
			return "redirect:/admin/book";
		}
		if (!(search == null)) {
			if (page == null) {
				page = 1;
			}
			int totalRow = bookDAO.countItemsSearch(search);
			int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
			int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
			List<Book> listBook = bookDAO.getSearch(search, offset);
			modelMap.addAttribute("listBook", listBook);
			modelMap.addAttribute("sumPage", sumPage);
			modelMap.addAttribute("page", page);
		}
		return "admin.books.search";
	}
	
	@ResponseBody 
	@PostMapping(path = "active", produces = "text/html;charset=utf-8")
	public String index(
			@RequestParam("id") int id, @RequestParam("active") Integer active
			) { 
		
		Book books = bookDAO.getItems(id);
		/*active = active == true ?  false : false;*/
		books.setActive(active == 1 ? 0 : 1);
		String result = "";
		if(bookDAO.editActive(books) >0) {
			books = bookDAO.getItems(id);
			if(books.getActive() == 1) {
				result += "<a href='javascript:void(0) ' onclick='active("+id+", " +books.getActive()+");'><img src='"+ request.getContextPath() +"/resources/admin/images/ac.png '/></a>";
			}else {
				result += "<a href='javascript:void(0) ' onclick='active("+id+", " +books.getActive()+ ");'><img src='"+request.getContextPath() +"/resources/admin/images/de.png '/></a>";
			}
		}
		return result;
	}
	
	@GetMapping("add")
	public String add(ModelMap modelMap, Principal principal ) {
		List<Category> listCat = catDAO.getItem();
		modelMap.addAttribute("listCat", listCat);
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("account", account);
		return "admin.books.add";
	}

	@PostMapping("add")
	public String add(ModelMap modelMap, @Valid @ModelAttribute("objBook") Book objBook, BindingResult br,
			@RequestParam("cid") Integer cid, @RequestParam("picturePreview") MultipartFile cmf,
			@RequestParam("picturePreview1") MultipartFile cmf1, @RequestParam("picturePreview2") MultipartFile cmf2, 
			RedirectAttributes ra)
			throws IllegalStateException, IOException {
		// b1. kiểm tra dữ liệu đầu vào- validation
		if (br.hasErrors()) {
			List<Category> listCat = catDAO.getItem();
			modelMap.addAttribute("listCat", listCat);
			return "admin.books.add";
		}
		if (cid == null) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/book/add?msg=catError";
		} else
			objBook.setCat(new Category(cid, ""));

		String fileName = cmf.getOriginalFilename();
		
		String fileName2 = cmf2.getOriginalFilename();
		// kiểm tra định dạng
		String tmp = FilenameUtils.getExtension(fileName);
		
		String tmp2 = FilenameUtils.getExtension(fileName2);
		if (tmp.equalsIgnoreCase("jpg") || tmp.equalsIgnoreCase("png") || tmp.equalsIgnoreCase("jpeg")) {
			if (!"".equals(fileName)) {
				fileName = FilenameUtils.getBaseName(fileName) + "-" + System.nanoTime() + "."
						+ FilenameUtils.getExtension(fileName);
				String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
				File createDir = new File(dirPath);
				if (!createDir.exists()) {
					createDir.mkdirs();
				}
				fileName = FileDefine.rename(fileName);
				String filPath = dirPath + File.separator + fileName;
				cmf.transferTo(new File(filPath));
				objBook.setPicture(fileName);
				modelMap.addAttribute("fileName", fileName);
				System.out.println(dirPath + File.separator + fileName);
			}
		} else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERRORFILE);
			return "redirect:/admin/book/add?msg=fileError";
		}

		objBook.setPicture(fileName);
		
		String fileName1 = cmf1.getOriginalFilename();
		
		String tmp1 = FilenameUtils.getExtension(fileName1);
		if (tmp1.equalsIgnoreCase("jpg") || tmp1.equalsIgnoreCase("png") || tmp1.equalsIgnoreCase("jpeg")) {
			
				fileName1 = FilenameUtils.getBaseName(fileName1) + "-" + System.nanoTime() + "."
						+ FilenameUtils.getExtension(fileName1);
				String dirPath1 = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
				File createDir1 = new File(dirPath1);
				if (!createDir1.exists()) {
					createDir1.mkdirs();
				}
				fileName1 = FileDefine.rename(fileName1);
				String filPath1 = dirPath1 + File.separator + fileName1;
				cmf1.transferTo(new File(filPath1));
				objBook.setDetailpicture1(fileName1);
				modelMap.addAttribute("fileName1", fileName1);
				System.out.println(dirPath1 + File.separator + fileName1);
			}
		objBook.setDetailpicture1(fileName1);

		if (tmp2.equalsIgnoreCase("jpg") || tmp2.equalsIgnoreCase("png") || tmp2.equalsIgnoreCase("jpeg")) {
			
			fileName2 = FilenameUtils.getBaseName(fileName2) + "-" + System.nanoTime() + "."
					+ FilenameUtils.getExtension(fileName2);
			String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
			File createDir = new File(dirPath);
			if (!createDir.exists()) {
				createDir.mkdirs();
			}
			fileName2 = FileDefine.rename(fileName2);
			String filPath2 = dirPath + File.separator + fileName2;
			cmf2.transferTo(new File(filPath2));
			objBook.setDetailpicture2(fileName2);
			modelMap.addAttribute("fileName2", fileName2);
			System.out.println(dirPath + File.separator + fileName2);
		}
		objBook.setDetailpicture2(fileName2);

		if (bookDAO.addItem(objBook) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESS);
			return "redirect:/admin/book";
		}
		ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
		return "redirect:/admin.books.add";
	}
	
	@GetMapping({"edit/{id}","edit/{id}/{page}"})
	public String edit(ModelMap modelMap, @PathVariable int id,@PathVariable(value="page", required=false) Integer page, Principal principal ) {
		if(page == null) {
			page=1;
		}
		Book objBook = bookDAO.getItems(id);
		Category cat = bookDAO.getCat(id);
		List<Category> listCat = catDAO.getItemx(cat.getCid());
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("account", account);
		modelMap.addAttribute("listCat", listCat);
		modelMap.addAttribute("id", id);
		modelMap.addAttribute("objBook",objBook );
		modelMap.addAttribute("cat", cat);
		modelMap.addAttribute("page", page);
		return "admin.books.edit";
	}
	@PostMapping({"edit/{id}","edit/{id}/{page}"} )
	public String edit(ModelMap modelMap, @Valid @ModelAttribute("objBook") Book objBook,BindingResult br,@RequestParam("cid") Integer cid,
			@RequestParam("picturePreview") MultipartFile cmf,
			@RequestParam("picturePreview1") MultipartFile cmf1, @RequestParam("picturePreview2") MultipartFile cmf2,
			RedirectAttributes ra,@PathVariable(value="page", required=false) Integer page) throws IllegalStateException, IOException {
		
		if (br.hasErrors()) {
			List<Category> listCat = catDAO.getItem();
			modelMap.addAttribute("listCat", listCat);
			return "admin.books.edit";
		}
		if (cid == null) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/book/edit?msg=catError";
		} else
			objBook.setCat(new Category(cid, ""));

		String fileName = cmf.getOriginalFilename();
		// kiểm tra định dạng
		String tmp = FilenameUtils.getExtension(fileName);
		if (tmp.equalsIgnoreCase("jpg") || tmp.equalsIgnoreCase("png") || tmp.equalsIgnoreCase("jpeg")) {
			if (!"".equals(fileName)) {
				fileName = FilenameUtils.getBaseName(fileName) + "-" + System.nanoTime() + "."
						+ FilenameUtils.getExtension(fileName);
				String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
				File createDir = new File(dirPath);
				if (!createDir.exists()) {
					createDir.mkdirs();
				}
				fileName = FileDefine.rename(fileName);
				String filPath = dirPath + File.separator + fileName;
				cmf.transferTo(new File(filPath));
				objBook.setPicture(fileName);
				modelMap.addAttribute("fileName", fileName);
				System.out.println(dirPath + File.separator + fileName);
			}
		} else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERRORFILE);
			return "redirect:/admin/book/edit?msg=fileError";
		}

		objBook.setPicture(fileName);
			String fileName1 = cmf1.getOriginalFilename();
		
		String tmp1 = FilenameUtils.getExtension(fileName1);
		if (tmp1.equalsIgnoreCase("jpg") || tmp1.equalsIgnoreCase("png") || tmp1.equalsIgnoreCase("jpeg")) {
			
				fileName1 = FilenameUtils.getBaseName(fileName1) + "-" + System.nanoTime() + "."
						+ FilenameUtils.getExtension(fileName1);
				String dirPath1 = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
				File createDir1 = new File(dirPath1);
				if (!createDir1.exists()) {
					createDir1.mkdirs();
				}
				fileName1 = FileDefine.rename(fileName1);
				String filPath1 = dirPath1 + File.separator + fileName1;
				cmf1.transferTo(new File(filPath1));
				objBook.setDetailpicture1(fileName1);
				modelMap.addAttribute("fileName1", fileName1);
				System.out.println(dirPath1 + File.separator + fileName1);
			}
		objBook.setDetailpicture1(fileName1);
		String fileName2 = cmf2.getOriginalFilename();
		
		String tmp2 = FilenameUtils.getExtension(fileName2);
		if (tmp2.equalsIgnoreCase("jpg") || tmp2.equalsIgnoreCase("png") || tmp2.equalsIgnoreCase("jpeg")) {
			
			fileName2 = FilenameUtils.getBaseName(fileName2) + "-" + System.nanoTime() + "."
					+ FilenameUtils.getExtension(fileName2);
			String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
			File createDir = new File(dirPath);
			if (!createDir.exists()) {
				createDir.mkdirs();
			}
			fileName2 = FileDefine.rename(fileName2);
			String filPath2 = dirPath + File.separator + fileName2;
			cmf2.transferTo(new File(filPath2));
			objBook.setDetailpicture2(fileName2);
			modelMap.addAttribute("fileName2", fileName2);
			System.out.println(dirPath + File.separator + fileName2);
		}
		objBook.setDetailpicture2(fileName2);
		if (bookDAO.editItem(objBook) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSEDIT);
			return "redirect:/admin/book/"+page;
		}
		ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
		return "redirect:/admin.books.edit";
	}
	@GetMapping("del/{id}")
	public String del(@PathVariable int id, RedirectAttributes ra){
		if(bookDAO.delItem(id)>0) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/book";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "admin.books.index";
		}	
		
	}
}
