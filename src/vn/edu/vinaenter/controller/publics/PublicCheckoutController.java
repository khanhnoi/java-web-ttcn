package vn.edu.vinaenter.controller.publics;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.edu.vinaenter.daos.BookDAO;
import vn.edu.vinaenter.daos.CartOrderDAO;
import vn.edu.vinaenter.daos.CatDAO;
import vn.edu.vinaenter.daos.OrdersDAO;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.models.Book;
import vn.edu.vinaenter.models.Cart;
import vn.edu.vinaenter.models.CartOrder;
import vn.edu.vinaenter.models.Category;
import vn.edu.vinaenter.models.Order;

@Controller
@RequestMapping("checkout")
public class PublicCheckoutController {
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private OrdersDAO orderDAO;
	@Autowired
	private CartOrderDAO cartOrdDAO;
	@Autowired
	private BookDAO bookDAO;
	
	@GetMapping("")
	public String checkout(ModelMap modelMap) {
		modelMap.addAttribute("catDAO", catDAO);
		return "public.checkout";
	}
	@PostMapping("deliver")
	public String checkout(@Valid @ModelAttribute("objOrder") Order objOrder, BindingResult br,RedirectAttributes ra,HttpSession session,
			@RequestParam("payId") int payId, ModelMap modelMap) {
		if (br.hasErrors()) {
			modelMap.addAttribute("catDAO", catDAO);
			return "public.checkout";
		}
		
		objOrder.setStatus("");
		if(payId == 1) {
		objOrder.setPayments("Giao hàng tại nhà");
		
		}
		if(payId == 2) {
			objOrder.setPayments("Paypal");
			objOrder.setPaid(1);
		}
		
		System.out.println(objOrder.getPaid());
		orderDAO.addItem(objOrder);
		objOrder = orderDAO.getItemLastest();
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)session.getAttribute("myCartItems");
		if(cartItems !=null) {
			for (Cart cart : cartItems.values()) {
				CartOrder item = new CartOrder();
				item.setPro_id(cart.getBook().getId());
				item.setQuantity(cart.getQuantity());
				item.setOrder_id(objOrder.getOrder_id());
				cartOrdDAO.addItem(item);
				Book book = bookDAO.getBook(item.getPro_id());
				
				int reamount = (int) (book.getAmount() - item.getQuantity());
				bookDAO.editAmount(item.getPro_id(),reamount);
				
			}
			session.removeAttribute("myCartItems");
			ra.addFlashAttribute("msg",MessageDefine.MSG_SUCCESSCART);
			return "redirect:/";
		}else {
			ra.addFlashAttribute("msg",MessageDefine.MSG_ERRORCART);
			return "redirect:/checkout";
		}
		
	}
}
