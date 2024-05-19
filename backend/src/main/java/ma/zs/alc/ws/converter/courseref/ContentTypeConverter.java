package  ma.zs.alc.ws.converter.courseref;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.ws.dto.courseref.ContentTypeDto;

@Component
public class ContentTypeConverter extends AbstractConverter<ContentType, ContentTypeDto> {


    public  ContentTypeConverter() {
        super(ContentType.class, ContentTypeDto.class);
    }

    @Override
    public ContentType toItem(ContentTypeDto dto) {
        if (dto == null) {
            return null;
        } else {
        ContentType item = new ContentType();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getCode()))
                item.setCode(dto.getCode());
            if(StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());



        return item;
        }
    }

    @Override
    public ContentTypeDto toDto(ContentType item) {
        if (item == null) {
            return null;
        } else {
            ContentTypeDto dto = new ContentTypeDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getCode()))
                dto.setCode(item.getCode());
            if(StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());


        return dto;
        }
    }




    public void initObject(boolean value) {
    }


}
