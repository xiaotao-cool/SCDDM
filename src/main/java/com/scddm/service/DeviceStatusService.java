package com.scddm.service;

import com.scddm.mapper.DeviceMapper;
import com.scddm.mapper.DeviceStatusLogMapper;
import com.scddm.model.DeviceStatusLog;
import com.scddm.model.Devices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class DeviceStatusService {

    @Autowired
    private DeviceMapper deviceMapper;

    @Autowired
    private DeviceStatusLogMapper logMapper;

    @Transactional
    public void changeStatus(Integer deviceId, String newStatus,String operator) {

        String oldStatus = deviceMapper.getStatusById(deviceId);
        deviceMapper.updateStatus(deviceId, newStatus);

        DeviceStatusLog log = new DeviceStatusLog();
        log.setDeviceId(deviceId);
        log.setOldStatus(oldStatus);
        log.setNewStatus(newStatus);
        log.setOperator(operator);
        log.setChangeTime(LocalDateTime.now());

        logMapper.insert(log);
    }

    public Devices getDeviceById(Integer deviceId){
        return deviceMapper.getDeviceById(deviceId);
    }

    public List<DeviceStatusLog> listLogs(Integer deviceId){
        return logMapper.findByDeviceId(deviceId);
    }
}
