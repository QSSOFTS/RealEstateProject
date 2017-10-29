package com.qssoft.services;

import com.qssoft.dao.UserDAO;
import com.qssoft.entities.User;
import com.qssoft.security.CustomUser;
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
        User user = userDao.getUserByLogin(username);
        GrantedAuthority authority = new SimpleGrantedAuthority(user.getRole().getName());
        UserDetails userDetails = new CustomUser(
                user.getLogin(),
                user.getPassword(),
                true,
                true,
                true,
                true,
                Arrays.asList(authority),
                user.getId());

        return userDetails;
    }

}