package vn.edu.vinaenter.controller.publics;

import java.util.HashMap;
import java.util.Map;

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

import vn.edu.vinaenter.daos.BookDAO;
import vn.edu.vinaenter.daos.CartOrderDAO;
import vn.edu.vinaenter.daos.CatDAO;
import vn.edu.vinaenter.defines.MessageDefine;
import vn.edu.vinaenter.models.Book;
import vn.edu.vinaenter.models.Cart;
import vn.edu.vinaenter.models.CartOrder;
import vn.edu.vinaenter.models.Order;
import vn.edu.vinaenter.utils.StringUtils;

@Controller
@RequestMapping("cart")
public class PublicCartController {
	@Autowired
	private BookDAO bookDAO;
	@Autowired
	private CatDAO catDAO;
	@Autowired
	private CartOrderDAO carOrderDAO;
	
	@GetMapping("")
	public String cart(ModelMap modelMap) {
		modelMap.addAttribute("catDAO", catDAO);
		return "public.cart";
	}
	
	@GetMapping("add/{id}")
	public String add(@PathVariable("id") int id,ModelMap modelMap,HttpSession session, RedirectAttributes ra) {
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)session.getAttribute("myCartItems");
		if(cartItems == null) {
			cartItems = new HashMap<>();
		}
		Book book = bookDAO.getItems(id);
		if(book!=null) {
			if(book.getAmount()!=0) {
			if(cartItems.containsKey(id)) {
				Cart item = cartItems.get(id);
				item.setBook(book);
				item.setQuantity(item.getQuantity()+1);
				cartItems.put(id, item);
			}else {
				Cart item = new Cart();
				item.setBook(book);;
				item.setQuantity(1);
				cartItems.put(id, item);
			}
		}else {
			ra.addFlashAttribute("msg", MessageDefine.MSG_ERRORADD);
			return "redirect:/"; 
		}
		}
		modelMap.addAttribute("catDAO", catDAO);
		 session.setAttribute("myCartItems", cartItems);
	     session.setAttribute("myCartTotal", totalPrice(cartItems));
	     session.setAttribute("myCartNum", cartItems.size());
	     return "redirect:/";
	}
	@GetMapping("remove/{productId}")
    public String viewRemove(ModelMap modelMap, HttpSession session, @PathVariable("productId") Integer productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if (cartItems.containsKey(productId)) {
            cartItems.remove(productId);
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/cart";
    }
	public long totalPrice(HashMap<Integer, Cart> cartItems) {
        int count = 0;
        for (Map.Entry<Integer, Cart> list : cartItems.entrySet()) {
            count += list.getValue().getBook().getPrice() * list.getValue().getQuantity();
        }
        return count;
    }
	@ResponseBody 
	@PostMapping(path = "updateQuantity", produces = "text/html;charset=utf-8")
    public String upQuantity(ModelMap modelMap, HttpSession session, @RequestParam("productId") int productId,
    		@RequestParam("quantity") int quantity ) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        Book book = bookDAO.getItems(productId);
        String result="";
		if(book!=null) {
			
			if(cartItems.containsKey(productId)) {
				
				Cart item = cartItems.get(productId);
				
				item.setBook(book);
				item.setQuantity(quantity);
				cartItems.put(productId, item);
				result += "<a href=\"javascript:void(0)\" onclick=\"activeQ(${objCart.value.book.id},${objCart.value.quantity });\">\r\n" + 
						"                         <input class=\"aa-cart-quantity\" type=\"number\" name=\"quantity\" value=\"${"+item.getQuantity()+ "+}\" >\r\n" + 
						"                         </a>";
			}
		}
		
		modelMap.addAttribute("catDAO", catDAO);
		 session.setAttribute("myCartItems", cartItems);
	     session.setAttribute("myCartTotal", totalPrice(cartItems));
	     session.setAttribute("myCartNum", cartItems.size());
        return result;
    }
	@GetMapping("adds/{id}")
	public String adds(@PathVariable("id") int id,ModelMap modelMap,HttpSession session, 
			@RequestParam("quantity") int quantity,RedirectAttributes ra) {
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)session.getAttribute("myCartItems");
		if(cartItems == null) {
			cartItems = new HashMap<>();
		}
		Book book = bookDAO.getItems(id);
		if(book!=null) {
			if(book.getAmount() !=0 && book.getAmount() >=quantity) {
			if(cartItems.containsKey(id)) {
				Cart item = cartItems.get(id);
				item.setBook(book);
				item.setQuantity(item.getQuantity()+quantity);
				cartItems.put(id, item);
			}else {
				Cart item = new Cart();
				item.setBook(book);;
				item.setQuantity(quantity);
				cartItems.put(id, item);
			}
			}else {
				ra.addFlashAttribute("msg", MessageDefine.MSG_ERRORADD);
				return "redirect:/chi-tiet/"+StringUtils.makeSlug(book.getName())+"-"+id+".html";
			}
		}
		modelMap.addAttribute("catDAO", catDAO);
		 session.setAttribute("myCartItems", cartItems);
	     session.setAttribute("myCartTotal", totalPrice(cartItems));
	     session.setAttribute("myCartNum", cartItems.size());
	     return "redirect:/cart";
	}
	
	@ResponseBody 
	@PostMapping(path = "removeActive", produces = "text/html;charset=utf-8")
    public void Remove(ModelMap modelMap, HttpSession session, @RequestParam("productId") int productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if (cartItems.containsKey(productId)) {
            cartItems.remove(productId);
        }
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        
    }
	@ResponseBody 
	@PostMapping(path = "removeActive2", produces = "text/html;charset=utf-8")
    public String Remove2(ModelMap modelMap, HttpSession session, @RequestParam("productId") int productId) {
        HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>) session.getAttribute("myCartItems");
        
        if (cartItems == null) {
            cartItems = new HashMap<>();
        }
        if (cartItems.containsKey(productId)) {
            cartItems.remove(productId);
        }
        
        session.setAttribute("myCartItems", cartItems);
        session.setAttribute("myCartTotal", totalPrice(cartItems));
        session.setAttribute("myCartNum", cartItems.size());
        return "redirect:/cart";
    }
	
	@PostMapping("upCart")
	public String checkout(HttpSession session,RedirectAttributes ra,
			@RequestParam("quantity") int quantity, ModelMap modelMap) {
		System.out.println(quantity);
		HashMap<Integer, Cart> cartItems = (HashMap<Integer, Cart>)session.getAttribute("myCartItems");
		if(cartItems == null) {
			cartItems = new HashMap<>();
		}
		
			for (Cart item : cartItems.values()) {
				item.setQuantity(quantity);
			}
		 session.setAttribute("myCartItems", cartItems);
	     session.setAttribute("myCartTotal", totalPrice(cartItems));
	     session.setAttribute("myCartNum", cartItems.size());
	     return "redirect:/cart";
	}
}
