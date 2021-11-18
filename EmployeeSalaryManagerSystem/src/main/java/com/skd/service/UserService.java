package com.skd.service;



import com.skd.domain.User;

import java.util.List;

public interface UserService {
    int addUser(User user);
    List<User> querryUser();
    int modifyUser(User user);
    int dropUser(int id);
}
