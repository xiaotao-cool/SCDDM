package com.scddm.mapper;

import com.scddm.model.AllocationApply;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface AllocationMapper {
    @Insert("insert into db_scddm.device_allocation_apply(deviceId, fromDept, toDept, reason, status, applyTime) " +
            "values (#{deviceId},#{fromDept},#{toDept},#{reason},#{status},now())")
    int insertApply(AllocationApply apply);

    @Select("select * from db_scddm.device_allocation_apply")
    List<AllocationApply> findAll();

    @Select("select * from db_scddm.device_allocation_apply where id = #{id}")
    AllocationApply findById(Integer id);

    @Update("update db_scddm.device_allocation_apply set status = #{status} where id = #{id}")
    int updateStatus(Integer id,String status);

    @Delete("delete from db_scddm.device_allocation_apply where id = #{id}")
    void delete(Integer id);
}
