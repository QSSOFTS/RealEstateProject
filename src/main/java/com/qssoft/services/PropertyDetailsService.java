package com.qssoft.services;

import com.qssoft.dao.RealEstateDAO;
import com.qssoft.dto.Property;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PropertyDetailsService
{
    @Autowired
    private RealEstateDAO realEstateDAO;

    public void createOrUpdateProperty(Property property) {
        realEstateDAO.createUpdateProperty(property);
    }

}
