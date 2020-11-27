package vn.edu.vinaenter.controller.publics;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.daos.CatDAO;
import vn.edu.vinaenter.daos.ContactDAO;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.models.Contact;

@Controller
@RequestMapping("/lien-he")
public class PublicContactController {
	@Autowired
	private ContactDAO contactDAO;
	@Autowired
	private CatDAO catDAO;
	
	@GetMapping()
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("catDAO", catDAO);
		return "public.contact";
	}
	
	@PostMapping("")
	public String contact(@Valid @ModelAttribute("obj") Contact obj, BindingResult br, ModelMap modelMap, RedirectAttributes ra) {
		if(br.hasErrors()) {
			return "public.contact";
		}else {
		contactDAO.add(obj);
		ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSCONTACT);
		return "redirect:/lien-he"; 
		}
	}
}
