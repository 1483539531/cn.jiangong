package cn.jiangong.mapper;

import cn.jiangong.entity.Categorys;

import java.util.List;

public interface CategorysMapper {

    /**
     * 根据父级id查询出所属的所有分类信息
     * @param parentId
     * @return Categorys类型 List
     */
    public List<Categorys> parentIdSelectCategorysList(String parentId);
}