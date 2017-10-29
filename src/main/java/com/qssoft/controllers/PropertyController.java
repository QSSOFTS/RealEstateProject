package com.qssoft.controllers;

import com.qssoft.dto.Property;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PropertyController
{
    @RequestMapping(value="/addProperty", method = RequestMethod.GET)
    public String addProperty (Model model) {
        model.addAttribute("property", new Property());
        return "create/addProperty";
    }

    @RequestMapping(value="/addProperty", method = RequestMethod.POST)
    public String addProperty (@ModelAttribute Property property) {
        return "redirect:/login?logout";
    }

}
