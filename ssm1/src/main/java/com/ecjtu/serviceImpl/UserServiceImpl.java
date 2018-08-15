package com.ecjtu.serviceImpl;

import com.ecjtu.bean.User;
import com.ecjtu.dao.UserMapper;
import com.ecjtu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public List<User> findAll() {
        return userMapper.findAllUser();
    }
}
