package com.ecjtu.service;

import com.ecjtu.bean.User;
import org.springframework.stereotype.Service;

import java.util.List;
public interface UserService {
    /**
     * 查询所有的用户分页
     * @return
     */
    List<User> findAll();
}
