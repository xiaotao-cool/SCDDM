package com.scddm.security;

import com.scddm.mapper.UserMapper;
import com.scddm.model.User;
import org.jspecify.annotations.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public org.springframework.security.core.userdetails.UserDetails
    loadUserByUsername(@NonNull String username)
            throws UsernameNotFoundException {

        User user = userMapper.selectByUsername(username);

        if (user == null) {
            throw new UsernameNotFoundException("用户不存在：" + username);
        }

        return org.springframework.security.core.userdetails.User
                .withUsername(user.getUsername())
                .password(user.getPassword())
                .roles(user.getRole())       // 来自你自己的 User
                .disabled(user.getEnabled() == 0)
                .build();
    }
}
