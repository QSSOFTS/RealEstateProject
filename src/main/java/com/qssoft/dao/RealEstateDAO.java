package com.qssoft.dao;


import com.qssoft.dto.Property;
import com.qssoft.entities.RealEstate;
import com.qssoft.hibernate.SessionFactoryHelper;
import com.qssoft.security.UserAccessHelper;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

@Repository
@Transactional
public class RealEstateDAO
{
    public void createUpdateProperty(Property realEstateDTO)
    {
        Session session = SessionFactoryHelper.getSession();

        RealEstate entity = createEntity(realEstateDTO);

        try {
            Transaction transaction = session.beginTransaction();

            session.saveOrUpdate(entity);

            transaction.commit();

        } catch (RuntimeException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }

    }

    private RealEstate createEntity(Property property) {
        RealEstate realEstate = new RealEstate(
                property.getTitle(),
                property.getDescription(),
                UserAccessHelper.getUserId(),
                property.getPrice(),
                property.getAddress(),
                property.getNearbyLocations(),
                property.getAdminNote(),
                property.getStatusId(),
                property.getLatitude(),
                property.getLongitude()
        );

        return realEstate;
    }

}
