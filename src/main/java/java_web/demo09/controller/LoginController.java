package java_web.demo09.controller;

import java_web.demo09.model.Customer;
import java_web.demo09.service.login.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping
    public String login() {
        return "login";
    }

    @PostMapping
    public ModelAndView login(@RequestParam("email") String email,
                      @RequestParam("password") String password) {
        ModelAndView mv = new ModelAndView();
        Customer customer = loginService.login(email, password);
        if (customer != null) {
            mv.addObject("customer", customer);
            mv.setViewName("redirect:/home");
            return mv;
        }else {
            mv.addObject("message", "Sai email hoặc mật khẩu.");
            mv.setViewName("login");
            return mv;
        }

    }
}
