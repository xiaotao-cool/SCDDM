package com.scddm.mapper;

import com.scddm.model.InventoryCheck;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface InventoryMapper {
    @Insert("insert into db_scddm.inventory_check(deviceId, systemQty, actualQty, diffQty, result, checker, checkTime) " +
            "values (#{deviceId},#{systemQty},#{actualQty},#{diffQty},#{result},#{checker},#{checkTime})")
    void insert(InventoryCheck check);

    @Select("select id,deviceId,systemQty,actualQty,diffQty,result,checker,checkTime " +
            "from db_scddm.inventory_check order by checkTime DESC ")
    List<InventoryCheck> selectAll();

    @Delete("delete from db_scddm.inventory_check where id=#{id}")
    void delete(Integer id);
}
