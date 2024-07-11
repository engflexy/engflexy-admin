package ma.zs.alc.ws.converter.collab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.collab.InscriptionCollaboratorState;
import ma.zs.alc.ws.dto.collab.InscriptionCollaboratorStateDto;

@Component
public class InscriptionCollaboratorStateConverter extends AbstractConverter<InscriptionCollaboratorState, InscriptionCollaboratorStateDto> {


    public  InscriptionCollaboratorStateConverter() {
        super(InscriptionCollaboratorState.class, InscriptionCollaboratorStateDto.class);
    }

    @Override
    public InscriptionCollaboratorState toItem(InscriptionCollaboratorStateDto dto) {
        if (dto == null) {
            return null;
        } else {
        InscriptionCollaboratorState item = new InscriptionCollaboratorState();
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
    public InscriptionCollaboratorStateDto toDto(InscriptionCollaboratorState item) {
        if (item == null) {
            return null;
        } else {
            InscriptionCollaboratorStateDto dto = new InscriptionCollaboratorStateDto();
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
