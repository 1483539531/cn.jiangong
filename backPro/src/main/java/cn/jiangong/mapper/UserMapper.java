package cn.jiangong.mapper;

import cn.jiangong.entity.BackUser;

import java.util.List;

public interface UserMapper {


    public List<BackUser> selectUserList(String zhanghao, String password);

}
