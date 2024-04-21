package  ma.zs.zyn.ws.converter.recomrecla;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.recomrecla.TypeReclamationEtudiant;
import ma.zs.zyn.ws.dto.recomrecla.TypeReclamationEtudiantDto;

@Component
public class TypeReclamationEtudiantConverter extends AbstractConverter<TypeReclamationEtudiant, TypeReclamationEtudiantDto> {


    public  TypeReclamationEtudiantConverter() {
        super(TypeReclamationEtudiant.class, TypeReclamationEtudiantDto.class);
    }

    @Override
    public TypeReclamationEtudiant toItem(TypeReclamationEtudiantDto dto) {
        if (dto == null) {
            return null;
        } else {
        TypeReclamationEtudiant item = new TypeReclamationEtudiant();
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
    public TypeReclamationEtudiantDto toDto(TypeReclamationEtudiant item) {
        if (item == null) {
            return null;
        } else {
            TypeReclamationEtudiantDto dto = new TypeReclamationEtudiantDto();
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
