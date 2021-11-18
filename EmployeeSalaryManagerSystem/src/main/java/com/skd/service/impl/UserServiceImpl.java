package com.skd.service.impl;

import com.skd.dao.UserDao;
import com.skd.domain.User;
import com.skd.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public int addUser(User user) {
        int nums = userDao.insertUser(user);
        return nums;
    }

    @Override
    public List<User> querryUser() {
        List<User> users = userDao.selectUser();
        return users;
    }

    @Override
    public int modifyUser(User user) {
        int nums = userDao.updateUser(user);
        return nums;
    }

    @Override
    public int dropUser(int id) {
        int nums = userDao.deleteUser(id);
        return nums;
    }
}
