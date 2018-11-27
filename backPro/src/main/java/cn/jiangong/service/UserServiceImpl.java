package cn.jiangong.service;


import cn.jiangong.entity.BackUser;
import cn.jiangong.entity.Categorys;
import cn.jiangong.mapper.UserMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl {

    @Autowired
    UserMapper userMapper;


    public BackUser login(String zhanghao, String password){
            return userMapper.login(zhanghao,password);
    }

    public PageInfo<BackUser> selectUserList(Integer page,Integer pageSize,String startdate,String enddate,String name){
        PageHelper.startPage(page,pageSize);
        List<BackUser> backUsers = userMapper.selectUserList(startdate,enddate,name);
        PageInfo<BackUser> backUserPageInfo = new PageInfo<BackUser>(backUsers);
        return backUserPageInfo;
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

}
