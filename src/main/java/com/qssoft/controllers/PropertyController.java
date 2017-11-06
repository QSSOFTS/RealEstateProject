package com.qssoft.controllers;

import com.qssoft.dto.Property;
import com.qssoft.entities.Message;
import com.qssoft.security.UserAccessHelper;
import com.qssoft.services.DealTypeService;
import com.qssoft.services.MessageService;
import com.qssoft.services.PropertyDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

    @Autowired
    private MessageService messageService;

    @Autowired
    DealTypeService dealTypeService;

    @RequestMapping(value="/addProperty", method = RequestMethod.GET)
    public String addProperty (Model model) {
        model.addAttribute("property", new Property());
        model.addAttribute("dealTypes", dealTypeService.getAllDealTypes());
        return "property/updateProperty";
    }

    @RequestMapping(value="/updateProperty/{id}", method = RequestMethod.GET)
    public String addPropertyDetails (@PathVariable("id") final String id, Model model) {
        Property property;
        if(id == null) {
            property = new Property();
        } else {
            property = propertyDetailsService.getPropertyById(id);
            List<Message> messagesList = messageService.getMessagesByPropertyId(Integer.parseInt(id));
            model.addAttribute("messages", messagesList);
        }
        model.addAttribute("dealTypes", dealTypeService.getAllDealTypes());
        model.addAttribute("property", property);
        return "property/updateProperty";
    }

    @RequestMapping(value="/viewProperty/{id}", method = RequestMethod.GET)
    public String viewPropertyDetails (@PathVariable("id") final String id, Model model) {

        model.addAttribute("property", propertyDetailsService.getPropertyById(id));
        return "property/viewProperty";
    }

    @ResponseBody
    @RequestMapping(value = "/deleteProperty/{id}", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public String deleteProperty(@PathVariable("id") final String id)
            throws Exception
    {
        propertyDetailsService.deleteProperty(Integer.parseInt(id));
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "/approveProperty/{id}", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> approveProperty(@PathVariable("id") final String id)
    {
        propertyDetailsService.approveProperty(Integer.parseInt(id));
        return new ResponseEntity<>("success", HttpStatus.OK);
    }

    @RequestMapping(value="/addProperty", method = RequestMethod.POST)
    public void addProperty (@ModelAttribute Property property, HttpServletResponse response) throws IOException {
        if(property.getOwnerId() == null) {
            property.setOwnerId(UserAccessHelper.getUserId());
        }
        if(property.getStatusId() == null) {
            property.setStatusId(propertyStatusMap.get("NEW"));
        }
        propertyDetailsService.createOrUpdateProperty(property);

        response.sendRedirect("/");
    }

    @ResponseBody
    @RequestMapping(value = "/sendMessage/{propertyId}/{ownerId}", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE, consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> sendMessage(@PathVariable("propertyId") final String propertyId, @PathVariable("ownerId") final String ownerId, @RequestParam("message") final String message)
    {
        messageService.createMessage(UserAccessHelper.getUserId(), Integer.parseInt(ownerId), message, Integer.parseInt(propertyId));
        return new ResponseEntity<>("success", HttpStatus.OK);
    }

//    list of hot deals (based on search)

}


