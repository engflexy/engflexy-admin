package  ma.zs.zyn.ws.converter.inscriptionref;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.inscriptionref.EtatInscription;
import ma.zs.zyn.ws.dto.inscriptionref.EtatInscriptionDto;

@Component
public class EtatInscriptionConverter extends AbstractConverter<EtatInscription, EtatInscriptionDto> {


    public  EtatInscriptionConverter() {
        super(EtatInscription.class, EtatInscriptionDto.class);
    }

    @Override
    public EtatInscription toItem(EtatInscriptionDto dto) {
        if (dto == null) {
            return null;
        } else {
        EtatInscription item = new EtatInscription();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getRef()))
                item.setRef(dto.getRef());
            if(StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());



        return item;
        }
    }

    @Override
    public EtatInscriptionDto toDto(EtatInscription item) {
        if (item == null) {
            return null;
        } else {
            EtatInscriptionDto dto = new EtatInscriptionDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getRef()))
                dto.setRef(item.getRef());
            if(StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());


        return dto;
        }
    }




    public void initObject(boolean value) {
    }


}
