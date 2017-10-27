package com.qssoft.controllers;

import com.qssoft.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.qssoft.model.Login;

@Controller
public class LoginController
{

    @RequestMapping(method = RequestMethod.GET, value = "/login1")
    public String greeting(@RequestParam(value="name", required=false, defaultValue="World") String name, Model model) {
        Login loginObj = new Login();
        model.addAttribute("login", loginObj);
        return "login/login";
    }
}
