package com.scddm.service;

import com.scddm.mapper.DeviceMapper;
import com.scddm.model.Devices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeviceService {
    @Autowired
    private DeviceMapper deviceMapper;

    public void addDevice(Devices device ){
        deviceMapper.insertDevice(device);
    }

    public List<Devices> searchDevices(String name, String model, String status){
        return deviceMapper.queryDevices(name,model,status);
    }

    public void  updateDevice(Devices device ){
        deviceMapper.updateDevice(device);
    }

    public void  deleteDevice(Integer id){
        deviceMapper.deleteDevice(id);
    }

    public Devices getDeviceById(Integer id){
        return deviceMapper.getDeviceById(id);
    }
}
