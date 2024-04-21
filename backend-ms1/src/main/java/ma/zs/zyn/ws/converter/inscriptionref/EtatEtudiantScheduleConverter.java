package  ma.zs.zyn.ws.converter.inscriptionref;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.inscriptionref.EtatEtudiantSchedule;
import ma.zs.zyn.ws.dto.inscriptionref.EtatEtudiantScheduleDto;

@Component
public class EtatEtudiantScheduleConverter extends AbstractConverter<EtatEtudiantSchedule, EtatEtudiantScheduleDto> {


    public  EtatEtudiantScheduleConverter() {
        super(EtatEtudiantSchedule.class, EtatEtudiantScheduleDto.class);
    }

    @Override
    public EtatEtudiantSchedule toItem(EtatEtudiantScheduleDto dto) {
        if (dto == null) {
            return null;
        } else {
        EtatEtudiantSchedule item = new EtatEtudiantSchedule();
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
    public EtatEtudiantScheduleDto toDto(EtatEtudiantSchedule item) {
        if (item == null) {
            return null;
        } else {
            EtatEtudiantScheduleDto dto = new EtatEtudiantScheduleDto();
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
