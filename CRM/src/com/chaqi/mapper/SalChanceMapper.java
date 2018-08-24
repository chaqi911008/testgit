package com.chaqi.mapper;

import com.chaqi.entity.Sal_Chance;

import java.util.List;
import java.util.Map;

public interface SalChanceMapper {

    /**
     * 查询所有机会信息
     * @param map  参数数组
     * @return     返回机会列表
     */
    List<Sal_Chance> selectSalChanceAll(Map map);

    /**
     * 根据编号删除机会信息
     * @param id    机会编号
     */
    void delSalChanceById(Long id);

    /**
     * 添加机会信息
     * @param sal_chance    机会对象
     */
    void addSalChance(Sal_Chance sal_chance);

    /**
     * 根据编号查询机会信息
     * @param id  机会编号
     * @return    返回机会对象
     */
    Sal_Chance selectSalChanceById(Long id);

    /**
     * 查询机会条数
     * @param map  参数数组
     * @return     返回机会条数
     */
    Long selectSalChanceCount(Map map);

    /**
     * 根据机会编号修改机会状态
     * @param map  参数数组
     */
    void updateSalChanceStatus(Map map);
}
