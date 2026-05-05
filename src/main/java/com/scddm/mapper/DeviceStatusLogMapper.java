package com.scddm.mapper;

import com.scddm.model.DeviceStatusLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface DeviceStatusLogMapper {

    @Insert("insert into db_scddm.device_status_log(deviceId, oldStatus, newStatus, operator, changeTime)" +
            "values (#{deviceId},#{oldStatus},#{newStatus},#{operator},#{changeTime})")
    void insert(DeviceStatusLog log);

    @Select("select * from db_scddm.device_status_log where deviceId=#{deviceId}")
    List<DeviceStatusLog> findByDeviceId(Integer deviceId);
}
