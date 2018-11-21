package cn.jiangong.service;

import cn.jiangong.entity.Categorys;
import cn.jiangong.mapper.CategorysMapper;
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
    public List<Categorys> parentIdSelectCategorysList(String parentId,String type){
        return categorysMapper.parentIdSelectCategorysList(parentId,type);
    }



}
