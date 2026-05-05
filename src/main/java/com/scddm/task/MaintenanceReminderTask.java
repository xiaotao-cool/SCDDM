package com.scddm.task;

import com.scddm.mapper.MaintenanceMapper;
import com.scddm.model.Maintenance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@EnableScheduling
public class MaintenanceReminderTask {

    @Autowired
    private MaintenanceMapper mapper;

    @Scheduled(cron = "0 0 9 * * ?")
    public void reminder(){
        List<Maintenance> list = mapper.findUnfinished();
        list.forEach(m->
            System.out.println("设备" + m.getDeviceId() + "仍处于维修状态")
        );
    }
}
