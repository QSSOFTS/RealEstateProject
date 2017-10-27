package com.qssoft.dao;

import com.qssoft.entities.User;
import com.qssoft.hibernate.SessionFactoryHelper;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

@Repository
@Transactional
public class UserDAO
{
    public User loginUser(final String login)
    {
//        SessionFactory sessionFactory = SessionFactoryHelper.getSessionFactory();
//
//        Session session = sessionFactory.getCurrentSession();

        Session session = SessionFactoryHelper.getSession();

        Transaction transaction = session.beginTransaction();

        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();

        CriteriaQuery<User> criteriaQuery = criteriaBuilder.createQuery(User.class);

        Root<User> userRoot = criteriaQuery.from(User.class);

        criteriaQuery.select(userRoot);

        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("login"), login));

//        criteriaQuery.where(criteriaBuilder.equal(userRoot.get("password"), password));

        criteriaQuery.from(User.class);

        User user = session.createQuery(criteriaQuery).uniqueResult();

        transaction.commit();

        session.close();

        return user;
    }


//    public User getUserByLogin(final String login)
//    {
//        User result = new User();
//        List<?> list = hibernateTemplate.find("FROM User WHERE login=?", login);
//        if(!list.isEmpty()) {
//            result = (User)list.get(0);
//        }
//        return result;
//    }

}
