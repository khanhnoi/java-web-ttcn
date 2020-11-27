package vn.edu.vinaenter.controller.admins;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.daos.RoleDAO;
import vn.edu.vinaenter.daos.SexDAO;
import vn.edu.vinaenter.daos.UserDAO;
import vn.edu.vinaenter.defines.FileDefine;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Role;
import vn.edu.vinaenter.models.Sex;
import vn.edu.vinaenter.models.User;

@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private RoleDAO roleDAO;
	@Autowired
	private SexDAO sexDAO;
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private ServletContext servletContext;
	
	@GetMapping({"","{page}"})
	public String contact(ModelMap modelMap, @PathVariable(value="page", required=false) Integer page,Principal principal) {
		if(page == null) {
			page=1;
		}
		//tổng số dòng/số tin trên 1 trang
		int totalRow = userDAO.countItems();
		int sumPage = (int) Math.ceil((float)totalRow/PageDefine.ADMIN_ROW_COUNT);
		int offset = (page -1)*PageDefine.ADMIN_ROW_COUNT;
		List<User> listUser = userDAO.getItemsPagination(offset);
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("account", account);
		modelMap.addAttribute("listUser", listUser);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.user.index";
	}
	
	@ResponseBody 
	@PostMapping(path = "active", produces = "text/html;charset=utf-8")
	public String index(
			@RequestParam("id") int id, @RequestParam("active") Integer active
			) { 
		
		User users = userDAO.getItem(id);
		/*active = active == true ?  false : false;*/
		users.setActive(active == 1 ? 0 : 1);
		String result = "";
		if(userDAO.editActive(users) >0) {
			users = userDAO.getItem(id);
			if(users.getActive() == 1) {
				result += "<a href='javascript:void(0) ' onclick='active("+id+", " +users.getActive()+");'><img src='"+ request.getContextPath() +"/resources/admin/images/ac.png '/></a>";
			}else {
				result += "<a href='javascript:void(0) ' onclick='active("+id+", " +users.getActive()+ ");'><img src='"+request.getContextPath() +"/resources/admin/images/de.png '/></a>";
			}
		}
		return result;
	}
	
	
	@GetMapping("add")
	public String add(ModelMap modelMap,Principal principal) {
		
		List<Role> listRole = roleDAO.getItem();
		List<Sex> listSex = sexDAO.getItem();
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("account", account);
		modelMap.addAttribute("listRole", listRole);
		modelMap.addAttribute("listSex", listSex);
		
		return "admin.user.add";
	}
	@PostMapping("add")
	public String add(@Valid @ModelAttribute("objUser") User objUser, BindingResult br, ModelMap modelMap, RedirectAttributes ra, 
			@RequestParam("password") String password, @RequestParam("roleId") Integer roleId,
			@RequestParam("sId") Integer sId,@RequestParam("picturePreview") MultipartFile cmf  ) throws IllegalStateException, IOException {
		if(br.hasErrors()) {
			List<Role> listRole = roleDAO.getItem();
			List<Sex> listSex = sexDAO.getItem();
			modelMap.addAttribute("listRole", listRole);
			modelMap.addAttribute("listSex", listSex);
			return "admin.user.add";
		}
		if (roleId ==null && sId == null) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "redirect:/admin/user/add?msg=userError";
		}
		else {
			objUser.setRole(new Role(roleId, ""));
			objUser.setSex(new Sex(sId, ""));
		}
		String fileName = cmf.getOriginalFilename();
		//kiểm tra định dạng
		String tmp=FilenameUtils.getExtension(fileName);
		if (tmp.equalsIgnoreCase("jpg")||tmp.equalsIgnoreCase("png")||tmp.equalsIgnoreCase("jpeg")) {
			if(!"".equals(fileName)) 
			{	
				fileName = FilenameUtils.getBaseName(fileName) +"-"+ System.nanoTime() +"."+FilenameUtils.getExtension(fileName);
				String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
				File createDir = new File(dirPath);
				if(!createDir.exists()) {
					createDir.mkdirs();
				}
				fileName = FileDefine.rename(fileName);
				String filPath = dirPath+File.separator + fileName;
				cmf.transferTo(new File(filPath));
				objUser.setAvatar(fileName);
				modelMap.addAttribute("fileName", fileName);
				System.out.println(dirPath + File.separator + fileName);
			}
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERRORFILE);
			return "redirect:/admin/user/add?msg=fileError";
			}
		
		objUser.setAvatar(fileName);
		objUser.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
		if(userDAO.search(objUser)==0) {
			if(userDAO.addItem(objUser) >0) {
				
				ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESS);
				return "redirect:/admin/user";
			}else {
				ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
				return "admin.user.add";
			}
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSUSER);
			return "redirect:/admin/user/add";
		}
	}
	@GetMapping("del/{id}")
	public String del(@PathVariable int id, RedirectAttributes ra) {
		if(userDAO.delItem(id)>0) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/user";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "admin.user.index";
		}
	}
	@GetMapping({"edit/{id}","edit/{id}/{page}" })
	public String edit(@PathVariable int id, RedirectAttributes ra, Model model,
			@PathVariable(value="page", required=false) Integer page, Principal principal ) {
		if(page == null) {
			page=1;
		}
		
		Role role = userDAO.getUser(id);
		Sex sex = sexDAO.getSex(id);
		User objUser = userDAO.getItem(id);
		List<Role> listRole = roleDAO.getItems(role.getRoleId());
		List<Sex> listSex = sexDAO.getItems(sex.getsId());
		User account = userDAO.getItem(principal.getName());
		model.addAttribute("account", account);
		model.addAttribute("listRole", listRole);
		model.addAttribute("listSex", listSex);
		model.addAttribute("id", id);
		model.addAttribute("objUser", objUser);
		model.addAttribute("page", page);
		model.addAttribute("role", role);
		model.addAttribute("sex", sex);
		return "admin.user.edit";
	}
	@PostMapping({"edit/{id}","edit/{id}/{page}" })
	public String edit(@Valid @ModelAttribute("objUser") User objUser,BindingResult br,RedirectAttributes ra,@RequestParam("password") String password,
			@PathVariable int id,@PathVariable(value="page", required=false) Integer page, @RequestParam("roleId") Integer roleId, 
			Model model,@RequestParam("sId") Integer sId,@RequestParam("picturePreview") MultipartFile cmf) throws IllegalStateException, IOException {
		if(br.hasErrors()) {
			Role role = userDAO.getUser(id);
			Sex sex = sexDAO.getSex(id);
			
			List<Role> listRole = roleDAO.getItems(role.getRoleId());
			List<Sex> listSex = sexDAO.getItems(sex.getsId());
			model.addAttribute("listRole", listRole);
			model.addAttribute("listSex", listSex);
			model.addAttribute("id", id);
			model.addAttribute("objUser", objUser);
			model.addAttribute("page", page);
			model.addAttribute("role", role);
			model.addAttribute("sex", sex);
			return "admin.user.edit";
		}
		if(page == null) {
			page=1;
		}
		if (roleId == null && sId == null) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "redirect:/admin/user/edit/"+ id + "?msg=userError";
		}
		else {
			objUser.setRole(new Role(roleId, ""));
			objUser.setSex(new Sex(sId, ""));
		}
		String fileName = cmf.getOriginalFilename();
		//kiểm tra định dạng
		String tmp=FilenameUtils.getExtension(fileName);
		if (tmp.equalsIgnoreCase("jpg")||tmp.equalsIgnoreCase("png")||tmp.equalsIgnoreCase("jpeg")) {
			if(!"".equals(fileName)) 
			{	
				fileName = FilenameUtils.getBaseName(fileName) +"-"+ System.nanoTime() +"."+FilenameUtils.getExtension(fileName);
				String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
				File createDir = new File(dirPath);
				if(!createDir.exists()) {
					createDir.mkdirs();
				}
				fileName = FileDefine.rename(fileName);
				String filPath = dirPath+File.separator + fileName;
				cmf.transferTo(new File(filPath));
				
				model.addAttribute("fileName", fileName);
				System.out.println(dirPath + File.separator + fileName);
			}
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERRORFILE);
			return "redirect:/admin/land/edit";}
		objUser.setAvatar(fileName);
		
		objUser.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
		System.out.println(objUser.getPassword());
		if(userDAO.search(objUser, id)==0) {
			if(userDAO.editItem(objUser, id) >0) {
				ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSEDIT);
				return "redirect:/admin/user/"+page;
			}else {
				ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
				return "admin.user.edit";
			}
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSUSER);
			return "redirect:/admin/user/edit/"+id;
		}
	}
}
