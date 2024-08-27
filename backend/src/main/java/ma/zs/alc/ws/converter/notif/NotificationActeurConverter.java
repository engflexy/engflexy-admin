package ma.zs.alc.ws.converter.notif;

import ma.zs.alc.bean.core.notif.NotificationActeur;
import ma.zs.alc.ws.dto.notif.NotificationActeurDto;
import ma.zs.alc.zynerator.security.ws.converter.UserConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.zynerator.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.beans.BeanUtils;


import java.util.ArrayList;
import java.util.List;






@Component
public class NotificationActeurConverter {

    @Autowired
    private UserConverter userConverter;

    public NotificationActeur toItem(NotificationActeurDto dto) {
        if (dto == null) {
            return null;
        } else {
        NotificationActeur item = new NotificationActeur();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getIcon()))
                item.setIcon(dto.getIcon());
            if(StringUtil.isNotEmpty(dto.getTitle()))
                item.setTitle(dto.getTitle());
            if(StringUtil.isNotEmpty(dto.getDescription()))
                item.setDescription(dto.getDescription());
            if(StringUtil.isNotEmpty(dto.getTime()))
                item.setTime(DateUtil.stringEnToDate(DateUtil.DATE_FORMAT_ALTERNATIVE,dto.getTime()));
            if(dto.getRead() != null)
                item.setRead(dto.getRead());
            if(StringUtil.isNotEmpty(dto.getLink()))
                item.setLink(dto.getLink());
            if(dto.getUseRouter() != null)
                item.setUseRouter(dto.getUseRouter());
            if(dto.getCommunicationEnabled() != null)
                item.setCommunicationEnabled(dto.getCommunicationEnabled());
            if(dto.getSecurityEnabled() != null)
                item.setSecurityEnabled(dto.getSecurityEnabled());
            if(dto.getLessonReminderEnabled() != null)
                item.setLessonReminderEnabled(dto.getLessonReminderEnabled());
            if(dto.getClassroomEnabled() != null)
                item.setClassroomEnabled(dto.getClassroomEnabled());
            if(dto.getPasswordChangedNotificationEnabled() != null)
                item.setPasswordChangedNotificationEnabled(dto.getPasswordChangedNotificationEnabled());
            if(dto.getContactNotificationEnabled() != null)
                item.setContactNotificationEnabled(dto.getContactNotificationEnabled());



        return item;
        }
    }


    public NotificationActeurDto toDto(NotificationActeur item) {
        if (item == null) {
            return null;
        } else {
            NotificationActeurDto dto = new NotificationActeurDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getIcon()))
                dto.setIcon(item.getIcon());
            if(StringUtil.isNotEmpty(item.getTitle()))
                dto.setTitle(item.getTitle());
            if(StringUtil.isNotEmpty(item.getDescription()))
                dto.setDescription(item.getDescription());
            if(item.getTime()!=null)
                dto.setTime(DateUtil.dateTimeToString(item.getTime()));
                dto.setRead(item.getRead());
            if(StringUtil.isNotEmpty(item.getLink()))
                dto.setLink(item.getLink());
                dto.setUseRouter(item.getUseRouter());
                dto.setCommunicationEnabled(item.getCommunicationEnabled());
                dto.setSecurityEnabled(item.getSecurityEnabled());
                dto.setLessonReminderEnabled(item.getLessonReminderEnabled());
                dto.setClassroomEnabled(item.getClassroomEnabled());
                dto.setPasswordChangedNotificationEnabled(item.getPasswordChangedNotificationEnabled());
                dto.setContactNotificationEnabled(item.getContactNotificationEnabled());


        return dto;
        }
    }


	
    public List<NotificationActeur> toItem(List<NotificationActeurDto> dtos) {
        List<NotificationActeur> items = new ArrayList<>();
        if (dtos != null && !dtos.isEmpty()) {
            for (NotificationActeurDto dto : dtos) {
                items.add(toItem(dto));
            }
        }
        return items;
    }


    public List<NotificationActeurDto> toDto(List<NotificationActeur> items) {
        List<NotificationActeurDto> dtos = new ArrayList<>();
        if (items != null && !items.isEmpty()) {
            for (NotificationActeur item : items) {
                dtos.add(toDto(item));
            }
        }
        return dtos;
    }


    public void copy(NotificationActeurDto dto, NotificationActeur item) {
        if(StringUtil.isNotEmpty(dto.getId()))
            item.setId(dto.getId());
        if(StringUtil.isNotEmpty(dto.getIcon()))
            item.setIcon(dto.getIcon());
        if(StringUtil.isNotEmpty(dto.getTitle()))
            item.setTitle(dto.getTitle());
        if(StringUtil.isNotEmpty(dto.getDescription()))
            item.setDescription(dto.getDescription());
        if(StringUtil.isNotEmpty(dto.getTime()))
            item.setTime(DateUtil.stringEnToDate(DateUtil.DATE_FORMAT_ALTERNATIVE,dto.getTime()));
        if(dto.getRead() != null)
            item.setRead(dto.getRead());
        if(StringUtil.isNotEmpty(dto.getLink()))
            item.setLink(dto.getLink());
        if(dto.getUseRouter() != null)
            item.setUseRouter(dto.getUseRouter());
        if(dto.getCommunicationEnabled() != null)
            item.setCommunicationEnabled(dto.getCommunicationEnabled());
        if(dto.getSecurityEnabled() != null)
            item.setSecurityEnabled(dto.getSecurityEnabled());
        if(dto.getLessonReminderEnabled() != null)
            item.setLessonReminderEnabled(dto.getLessonReminderEnabled());
        if(dto.getClassroomEnabled() != null)
            item.setClassroomEnabled(dto.getClassroomEnabled());
        if(dto.getPasswordChangedNotificationEnabled() != null)
            item.setPasswordChangedNotificationEnabled(dto.getPasswordChangedNotificationEnabled());
        if(dto.getContactNotificationEnabled() != null)
            item.setContactNotificationEnabled(dto.getContactNotificationEnabled());

    }

    public List<NotificationActeur> copy(List<NotificationActeurDto> dtos) {
        List<NotificationActeur> result = new ArrayList<>();
        if (dtos != null) {
            for (NotificationActeurDto dto : dtos) {
                NotificationActeur instance = new NotificationActeur();
                copy(dto, instance);
                result.add(instance);
            }
        }
        return result.isEmpty() ? null : result;
    }


}
