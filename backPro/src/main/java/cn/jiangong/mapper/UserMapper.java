package cn.jiangong.mapper;

import cn.jiangong.entity.BackUser;

public interface UserMapper {


    public BackUser selectUserList(String zhanghao, String password);

}
