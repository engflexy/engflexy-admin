package  ma.zs.zyn.ws.converter.freetrial;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.freetrial.StatutFreeTrial;
import ma.zs.zyn.ws.dto.freetrial.StatutFreeTrialDto;

@Component
public class StatutFreeTrialConverter extends AbstractConverter<StatutFreeTrial, StatutFreeTrialDto> {


    public  StatutFreeTrialConverter() {
        super(StatutFreeTrial.class, StatutFreeTrialDto.class);
    }

    @Override
    public StatutFreeTrial toItem(StatutFreeTrialDto dto) {
        if (dto == null) {
            return null;
        } else {
        StatutFreeTrial item = new StatutFreeTrial();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());
            if(StringUtil.isNotEmpty(dto.getCode()))
                item.setCode(dto.getCode());
            if(StringUtil.isNotEmpty(dto.getStyle()))
                item.setStyle(dto.getStyle());



        return item;
        }
    }

    @Override
    public StatutFreeTrialDto toDto(StatutFreeTrial item) {
        if (item == null) {
            return null;
        } else {
            StatutFreeTrialDto dto = new StatutFreeTrialDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());
            if(StringUtil.isNotEmpty(item.getCode()))
                dto.setCode(item.getCode());
            if(StringUtil.isNotEmpty(item.getStyle()))
                dto.setStyle(item.getStyle());


        return dto;
        }
    }




    public void initObject(boolean value) {
    }


}
