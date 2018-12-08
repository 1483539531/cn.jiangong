package cn.jiangong.service;

import cn.jiangong.entity.Company;
import cn.jiangong.entity.User;
import cn.jiangong.mapper.CompanyMapper;
import cn.jiangong.mapper.MemberMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    MemberMapper memberMapper;

    @Autowired
    CompanyMapper companyMapper;

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

    @Transactional
    public boolean updateUser(User user){
        Company company = new Company();
        company.setName(user.getCname());
        company.setPosition(user.getPosition());
        company.setUserid(user.getId());
        Integer isexists = memberMapper.existsCompony(user.getId());

        if(isexists == 1){
            boolean b = companyMapper.updateCompany(company);
        }else{
            companyMapper.addCompany(company);
        }
        memberMapper.updateUser(user);

        return true;
    }

    public  User selectUserPass(String id){
        return memberMapper.selectUserPass(id);
    }

    public boolean updatePass(User user){
        return memberMapper.updatePass(user);
    }
    public  boolean deleteUser(Integer id){
        return memberMapper.deleteUser(id);
    }



}
