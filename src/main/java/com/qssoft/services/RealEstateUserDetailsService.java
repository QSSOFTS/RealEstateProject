package com.qssoft.services;

import com.qssoft.dao.UserDAO;
import com.qssoft.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service
public class RealEstateUserDetailsService implements UserDetailsService
{
    @Autowired
    private UserDAO userDao;

    public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
        User user = userDao.loginUser(username);
        GrantedAuthority authority = new SimpleGrantedAuthority(user.getRole().getName());
        UserDetails userDetails = new org.springframework.security.core.userdetails.User(user.getLogin(),
                user.getPassword(), Arrays.asList(authority));
        return userDetails;
    }

}
