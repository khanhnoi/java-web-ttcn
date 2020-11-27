package vn.edu.vinaenter.utils;

import javax.servlet.http.HttpSession;

public class AuthUtil {
	public static boolean checkLogin(HttpSession session) {
		if(session.getAttribute("userInfo") == null) {
			return false;
		}
		return true;
	}
}
