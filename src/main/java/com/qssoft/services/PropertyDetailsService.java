package com.qssoft.services;

import com.qssoft.dao.RealEstateDAO;
import com.qssoft.dto.Property;
import com.qssoft.entities.RealEstate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyDetailsService
{
    @Autowired
    private RealEstateDAO realEstateDAO;

    @Autowired
    private RealEstateToPropertyHelperService realEstateToPropertyHelperService;

    public void createOrUpdateProperty(Property property) {
        realEstateDAO.createUpdateProperty(property);
    }

    public Property getPropertyById(String id) {
        RealEstate realEstate = realEstateDAO.getPropertyById(Integer.parseInt(id));
        return realEstateToPropertyHelperService.entityToProperty(realEstate);
    }

    public List<Property> getApprovedProperties() {
        List<RealEstate> propertiesListForAdmin = realEstateDAO.getApprovedProperties();
        return realEstateToPropertyHelperService.entityToPropertyList(propertiesListForAdmin);
    }

    public List<Property> getPropertiesByOwnerId(Integer id) {
        List<RealEstate> propertiesListForAdmin = realEstateDAO.getPropertiesListByOwner(id);
        return realEstateToPropertyHelperService.entityToPropertyList(propertiesListForAdmin);
    }

    public List<Property> getAllProperties() {
        List<RealEstate> propertiesListForAdmin = realEstateDAO.getPropertiesListForAdmin();
        return realEstateToPropertyHelperService.entityToPropertyList(propertiesListForAdmin);
    }

    public void deleteProperty(Integer propertyId) {
        realEstateDAO.changePropertyStatus(propertyId, 3);
    }

    public void approveProperty(Integer propertyId) {
        realEstateDAO.changePropertyStatus(propertyId, 2);
    }

}
