package cn.jiangong.service;

import cn.jiangong.entity.Role;
import cn.jiangong.mapper.RoleMapper;
import cn.jiangong.mapper.RoleMenuMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class RoleServiceImpl {

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    RoleMenuMapper roleMenuMapper;

    public PageInfo<Role> selectRoleList(Integer page,Integer limit){
        PageHelper.startPage(page,limit);
        List<Role> roles = roleMapper.selectRoleList();
        PageInfo<Role> pageInfo = new PageInfo<Role>(roles);
        return pageInfo;
    }


    @Transactional
    public boolean updateRole(Role role,String[] menusId){
        roleMapper.updateRole(role);
        roleMenuMapper.delete(role.getId());
        for (String s : menusId) {
            roleMenuMapper.insert(role.getId(),s);
        }
        return true;
    }



}
