package com.qssoft.controllers;

import com.qssoft.dto.Property;
import com.qssoft.security.UserAccessHelper;
import com.qssoft.services.PropertyDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.HashMap;
import java.util.Map;

@Controller
public class PropertyController
{
    private Map<String, Integer> propertyStatusMap;

    public PropertyController() {
        propertyStatusMap = new HashMap<String, Integer>();
        propertyStatusMap.put("NEW", 1);
        propertyStatusMap.put("APPROVED", 2);
        propertyStatusMap.put("DELETED", 3);
    }

    @Autowired
    private PropertyDetailsService propertyDetailsService;

    @RequestMapping(value="/addProperty", method = RequestMethod.GET)
    public String addProperty (Model model) {
        model.addAttribute("property", new Property());
        return "property/updateProperty";
    }

    @RequestMapping(value="/addProperty", method = RequestMethod.POST)
    public String addProperty (@ModelAttribute Property property) {
        if(property.getOwnerId() == null) {
            property.setOwnerId(UserAccessHelper.getUserId());
            property.setStatusId(propertyStatusMap.get("NEW"));
        }
        propertyDetailsService.createOrUpdateProperty(property);
        return "index";
    }

}
