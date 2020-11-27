package vn.edu.vinaenter.controller.admins;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import vn.edu.vinaenter.daos.CartOrderDAO;
import vn.edu.vinaenter.daos.OrdersDAO;
import vn.edu.vinaenter.daos.UserDAO;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.defines.PageDefine;
import vn.edu.vinaenter.models.Book;
import vn.edu.vinaenter.models.CartOrder;
import vn.edu.vinaenter.models.Order;
import vn.edu.vinaenter.models.User;

@Controller
@RequestMapping("admin/cart")
public class AdminCartController {
	@Autowired
	private OrdersDAO orderDAO;
	@Autowired
	private CartOrderDAO cartOrderDAO;
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private UserDAO userDAO;
	
	@GetMapping({ "", "{page}" })
	public String index(ModelMap modelMap, @PathVariable(value = "page", required = false) Integer page, Principal principal) {
		if (page == null)
			page = 1;
		int totalRow = orderDAO.countItems();
		int sumPage = (int) Math.ceil((float) totalRow / PageDefine.ADMIN_ROW_COUNT);
		int offset = (page - 1) * PageDefine.ADMIN_ROW_COUNT;
		List<Order> listOrder = orderDAO.getItemsPagination(offset);
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("listOrder", listOrder);
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		modelMap.addAttribute("account", account);
		modelMap.addAttribute("cartOrderDAO", cartOrderDAO);
		
		modelMap.addAttribute("bookDAO", bookDAO);
		
		return "admin.cart.index";
	}
	@ResponseBody 
	@PostMapping(path = "active", produces = "text/html;charset=utf-8")
	public String index(
			@RequestParam("order_id") int order_id, @RequestParam("checked") Integer checked
			) { 
		
		Order order = orderDAO.getItem(order_id);
		/*active = active == true ?  false : false;*/
		order.setChecked(checked == 1 ? 0 : 1);
		String result = "";
		if(orderDAO.editActive(order) >0) {
			order = orderDAO.getItem(order_id);
			if(order.getChecked() == 1) {
				result += "<a href='javascript:void(0) ' onclick='active("+order_id+", " +order.getChecked()+");'><img src='"+ request.getContextPath() +"/resources/admin/images/ac.png '/></a>";
			}else {
				result += "<a href='javascript:void(0) ' onclick='active("+order_id+", " +order.getChecked()+ ");'><img src='"+request.getContextPath() +"/resources/admin/images/de.png '/></a>";
			}
		}
		return result;
	}
	@GetMapping("view/{order_id}")
	public String view(@PathVariable("order_id") int order_id, ModelMap modelMap,Principal principal) {
		int total = 0;
		Order order = orderDAO.getItem(order_id);
		List<CartOrder> listCartOrder = cartOrderDAO.getItems(order.getOrder_id());
		
		if (listCartOrder != null) {
			modelMap.addAttribute("listCartOrder", listCartOrder);
			for (CartOrder cartOrder : listCartOrder) {
				total += bookDAO.getBook(cartOrder.getPro_id()).getPrice() * cartOrder.getQuantity();
			}
		}
		User account = userDAO.getItem(principal.getName());
		modelMap.addAttribute("order", order);
		modelMap.addAttribute("total", total);
		modelMap.addAttribute("bookDAO", bookDAO);
		modelMap.addAttribute("account",account );
		return "admin.cart.view";
	}
	@PostMapping("view/{order_id}")
	public String view(@PathVariable("order_id") int order_id, ModelMap modelMap, @RequestParam("paid") int paid, RedirectAttributes ra ) {
		if (orderDAO.edit(paid, order_id) > 0) {
			ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSEDIT);
			return "redirect:/admin/cart";
		} else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/cart/view/"+order_id;
		}
		
	}
	@GetMapping("del/{order_id}")
	public String del(@PathVariable("order_id") int order_id, ModelMap modelMap,RedirectAttributes ra ) {
		if (orderDAO.del(order_id) > 0) {
			if (cartOrderDAO.delItem(order_id) > 0) {
				ra.addFlashAttribute("msg", MessageDefine.MSG_SUCCESSDEL);
				return "redirect:/admin/cart";
			} else {
				ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
				return "redirect:/admin/cart";
			}
		} else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERROR);
			return "redirect:/admin/cart";
		}
	}
	
	@GetMapping("delAll")
	public String del(ModelMap modelMap,  RedirectAttributes ra) {
		if(orderDAO.delAll()>0) {
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSDEL);
			return "redirect:/admin/cart";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERROR);
			return "redirect:/admin/cart";
		}
		
	}
}
