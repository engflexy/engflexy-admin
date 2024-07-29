package  ma.zs.alc.ws.converter.collab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaboratorState;
import ma.zs.alc.ws.dto.collab.PaiementInscriptionCollaboratorStateDto;

@Component
public class PaiementInscriptionCollaboratorStateConverter extends AbstractConverter<PaiementInscriptionCollaboratorState, PaiementInscriptionCollaboratorStateDto> {


    public  PaiementInscriptionCollaboratorStateConverter() {
        super(PaiementInscriptionCollaboratorState.class, PaiementInscriptionCollaboratorStateDto.class);
    }

    @Override
    public PaiementInscriptionCollaboratorState toItem(PaiementInscriptionCollaboratorStateDto dto) {
        if (dto == null) {
            return null;
        } else {
        PaiementInscriptionCollaboratorState item = new PaiementInscriptionCollaboratorState();
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
    public PaiementInscriptionCollaboratorStateDto toDto(PaiementInscriptionCollaboratorState item) {
        if (item == null) {
            return null;
        } else {
            PaiementInscriptionCollaboratorStateDto dto = new PaiementInscriptionCollaboratorStateDto();
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
