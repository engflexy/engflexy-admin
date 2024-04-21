package  ma.zs.zyn.ws.converter.inscriptionref;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.inscriptionref.ClassRoom;
import ma.zs.zyn.ws.dto.inscriptionref.ClassRoomDto;

@Component
public class ClassRoomConverter extends AbstractConverter<ClassRoom, ClassRoomDto> {


    public  ClassRoomConverter() {
        super(ClassRoom.class, ClassRoomDto.class);
    }

    @Override
    public ClassRoom toItem(ClassRoomDto dto) {
        if (dto == null) {
            return null;
        } else {
        ClassRoom item = new ClassRoom();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());
            if(StringUtil.isNotEmpty(dto.getCode()))
                item.setCode(dto.getCode());



        return item;
        }
    }

    @Override
    public ClassRoomDto toDto(ClassRoom item) {
        if (item == null) {
            return null;
        } else {
            ClassRoomDto dto = new ClassRoomDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());
            if(StringUtil.isNotEmpty(item.getCode()))
                dto.setCode(item.getCode());


        return dto;
        }
    }




    public void initObject(boolean value) {
    }


}
