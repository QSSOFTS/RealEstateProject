package com.qssoft.controllers;

import com.qssoft.dto.Property;
import com.qssoft.security.UserAccessHelper;
import com.qssoft.services.PropertyDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/")
public class HomePageController
{
    @Autowired
    private PropertyDetailsService propertyDetailsService;

    @RequestMapping(method=RequestMethod.GET)
    public String index(Model model)
    {
        List<Property> propertiesList = null;

        if(UserAccessHelper.isAdmin()) {
            propertiesList = propertyDetailsService.getAllProperties();
        } else if (UserAccessHelper.isOwner()) {
            int userId = UserAccessHelper.getUserId();
            propertiesList = propertyDetailsService.getPropertiesByOwnerId(userId);
        } else if (UserAccessHelper.isBuyer()) {
            propertyDetailsService.getApprovedProperties();
        }
        model.addAttribute("propertiesList", propertiesList);

        return "index";
    }
}
