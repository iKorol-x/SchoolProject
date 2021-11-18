package com.skd.dao;

import com.skd.domain.User;

import java.util.List;

public interface UserDao {

    int insertUser(User user);
    List<User> selectUser();
    int deleteUser(int id);
    int updateUser(User user);

}
