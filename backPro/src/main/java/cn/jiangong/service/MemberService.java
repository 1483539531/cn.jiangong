package cn.jiangong.service;

import cn.jiangong.entity.User;
import cn.jiangong.mapper.MemberMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    MemberMapper memberMapper;

    public PageInfo<User> selectUserList(int page,int limit,String startDate,String endDate,User user){
        PageHelper.startPage(page,limit);
        List<User> users = memberMapper.selectUserList(startDate, endDate, user);
        PageInfo<User> pageInfo = new PageInfo<User>(users);
        return pageInfo;
    }

    public  User selectUser(Integer id){
        Integer isexists = memberMapper.existsCompony(id);
        System.out.println(isexists+"存在不存在公司呢");
        User user = memberMapper.selectUser(id, isexists);
        return user;
    }


}
