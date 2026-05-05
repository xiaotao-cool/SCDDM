package com.scddm.mapper;

import com.scddm.model.Maintenance;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MaintenanceMapper {
    @Insert("insert into db_scddm.device_maintenance(deviceId, reason, maintainer, cost, status, startTime, endTime)" +
            "values (#{deviceId},#{reason},#{maintainer},#{cost},#{status},#{startTime},#{endTime})")
    void insert(Maintenance m);

    @Select("select * from db_scddm.device_maintenance where status != '已完成'")
    List<Maintenance> findUnfinished();

    @Select("select id,deviceId,reason,maintainer,cost,status,startTime,endTime from db_scddm.device_maintenance where status !='已完成'")
    List<Maintenance> listAll();

    @Delete("delete from device_maintenance where id = #{id}")
    void deleteById(Integer id);
}
