package com.qssoft.security;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

public class UserAccessHelper
{
    public static int getUserId()
    {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        CustomUser user = null;
        if(null != securityContext.getAuthentication()){
            user = (CustomUser) securityContext.getAuthentication().getPrincipal();
        }
        return user.getId();
    }
}
