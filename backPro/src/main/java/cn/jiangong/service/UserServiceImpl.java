package cn.jiangong.service;


import cn.jiangong.entity.BackUser;
import cn.jiangong.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl {

    @Autowired
    UserMapper userMapper;


    public List<BackUser> selectUserList(String zhanghao, String password){
            return userMapper.selectUserList(zhanghao,password);
    }

}
