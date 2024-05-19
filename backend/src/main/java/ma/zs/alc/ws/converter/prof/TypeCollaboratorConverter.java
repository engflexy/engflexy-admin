package  ma.zs.alc.ws.converter.prof;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.prof.TypeCollaborator;
import ma.zs.alc.ws.dto.prof.TypeCollaboratorDto;

@Component
public class TypeCollaboratorConverter extends AbstractConverter<TypeCollaborator, TypeCollaboratorDto> {


    public  TypeCollaboratorConverter() {
        super(TypeCollaborator.class, TypeCollaboratorDto.class);
    }

    @Override
    public TypeCollaborator toItem(TypeCollaboratorDto dto) {
        if (dto == null) {
            return null;
        } else {
        TypeCollaborator item = new TypeCollaborator();
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
    public TypeCollaboratorDto toDto(TypeCollaborator item) {
        if (item == null) {
            return null;
        } else {
            TypeCollaboratorDto dto = new TypeCollaboratorDto();
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
