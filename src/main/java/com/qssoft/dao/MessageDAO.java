package com.qssoft.dao;

import com.qssoft.entities.Message;
import com.qssoft.hibernate.SessionFactoryHelper;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class MessageDAO
{
    public List<Message> getMessagesByOwnerId(final int ownerId)
    {
        Session session = SessionFactoryHelper.getSession();
        List<Message> result = null;
        try {
            session.beginTransaction();
            Query query = session.createQuery("from Message where recipientId = :ownerId");
            query.setParameter("ownerId", ownerId);
            result = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.getTransaction().commit();
                session.close();
            }
        }
        return result;
    }

    public List<Message> getMessagesByPropertyId(final int propertyId)
    {
        Session session = SessionFactoryHelper.getSession();
        List<Message> result = null;
        try {
            session.beginTransaction();
            Query query = session.createQuery("from Message where propertyId = :propertyId");
            query.setParameter("propertyId", propertyId);
            result = query.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session != null && session.isOpen()) {
                session.getTransaction().commit();
                session.close();
            }
        }
        return result;
    }

    public void createMessage(Message message)
    {
        Session session = SessionFactoryHelper.getSession();
        try {
            session.beginTransaction();
            session.saveOrUpdate(message);
            session.getTransaction().commit();
        } catch (RuntimeException ex) {
            ex.printStackTrace();
        } finally {
            session.close();
        }
    }

}
