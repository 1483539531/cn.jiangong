package cn.jiangong.service;


import cn.jiangong.entity.BackUser;
import cn.jiangong.entity.Categorys;
import cn.jiangong.entity.UserPrivilege;
import cn.jiangong.mapper.UserMapper;
import cn.jiangong.mapper.UserPrivilegeMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl {

    @Autowired
    UserMapper userMapper;

    @Autowired
    UserPrivilegeMapper userPrivilegeMapper;


    public BackUser login(String zhanghao, String password){
            return userMapper.login(zhanghao,password);
    }

    public PageInfo<BackUser> selectBackUserList(Integer page,Integer pageSize,String startdate,String enddate,String name){
        PageHelper.startPage(page,pageSize);
        List<BackUser> backUsers = userMapper.selectBackUserList(startdate,enddate,name);
        PageInfo<BackUser> backUserPageInfo = new PageInfo<BackUser>(backUsers);
        return backUserPageInfo;
    }

    public BackUser selectBackUser(Integer id){
        return userMapper.selectBackUser(id);
    }

    public boolean updateBackUserState(String state,String id){
        Integer stateNumber;
            if(state.equals("true")){
                stateNumber = 1;
            }else{
                stateNumber = 0;
            }
            return userMapper.updateBackUserState(stateNumber,id);
    }

    public boolean updateLoginDate(String id){
        return userMapper.updateLoginDate(id);
    }

    @Transactional
    public boolean insertBackUser(BackUser backUser,String roleId){
        if(userMapper.insertBackUser(backUser) &&
        userPrivilegeMapper.insert(backUser.getId(),Integer.parseInt(roleId))){
            return true;
        }
        return false;
    }

    @Transactional
    public boolean updateBackUser(String zhanghao, String password,Integer userId,Integer roleId){
        userPrivilegeMapper.delete(userId);
        if(userMapper.updateBackUser(zhanghao,password)
                &&  userPrivilegeMapper.insert(userId, roleId)){
            return true;
        }
        return false;
    }

    public BackUser selectRoleId(String id){
        return userMapper.selectRoleId(id);
    }



}
