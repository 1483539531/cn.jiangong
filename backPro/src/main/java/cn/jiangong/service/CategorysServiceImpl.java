package cn.jiangong.service;

import cn.jiangong.entity.Categorys;
import cn.jiangong.mapper.CategorysMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategorysServiceImpl {

    @Autowired
    CategorysMapper categorysMapper;

    /**
     * 根据父级id查询出所属的所有分类信息
     * @param parentId
     * @return Categorys类型 List
     */
    public PageInfo<Categorys> parentIdSelectCategorysList(String parentId,String type,Integer page,Integer pageSize){
        PageHelper.startPage(page,pageSize);
        List<Categorys> categorys = categorysMapper.parentIdSelectCategorysList(parentId, type);
        PageInfo<Categorys> dev_userPageInfo = new PageInfo<Categorys>(categorys);
        return dev_userPageInfo;
    }

    public boolean addCategory(String name,String parentId,String type){
        return categorysMapper.addCategory(name,parentId,type);
    }

    public boolean updateCategory(String name,String id){
        return categorysMapper.updateCategory(name,id);
    }

    public boolean deleteCategory(String id){
        List<Categorys> categorys = categorysMapper.parentIdSelectCategorysList(id, null);
        if (!categorys.isEmpty()){
            System.out.println("有子类");
            return false;
        }
        return categorysMapper.deleteCategory(id);
    }

}
