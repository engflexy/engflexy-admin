package  ma.zs.zyn.ws.converter.prof;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ma.zs.zyn.ws.converter.prof.ProfConverter;

import ma.zs.zyn.bean.core.prof.Prof;


import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.prof.TrancheHoraireProf;
import ma.zs.zyn.ws.dto.prof.TrancheHoraireProfDto;

@Component
public class TrancheHoraireProfConverter extends AbstractConverter<TrancheHoraireProf, TrancheHoraireProfDto> {

    @Autowired
    private ProfConverter profConverter ;
    private boolean prof;

    public  TrancheHoraireProfConverter() {
        super(TrancheHoraireProf.class, TrancheHoraireProfDto.class);
        init(true);
    }

    @Override
    public TrancheHoraireProf toItem(TrancheHoraireProfDto dto) {
        if (dto == null) {
            return null;
        } else {
        TrancheHoraireProf item = new TrancheHoraireProf();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getStartHour()))
                item.setStartHour(dto.getStartHour());
            if(StringUtil.isNotEmpty(dto.getEndHour()))
                item.setEndHour(dto.getEndHour());
            if(StringUtil.isNotEmpty(dto.getDay()))
                item.setDay(dto.getDay());
            if(StringUtil.isNotEmpty(dto.getGroupIndex()))
                item.setGroupIndex(dto.getGroupIndex());
            if(dto.getProf() != null && dto.getProf().getId() != null){
                item.setProf(new Prof());
                item.getProf().setId(dto.getProf().getId());
                item.getProf().setRef(dto.getProf().getRef());
            }




        return item;
        }
    }

    @Override
    public TrancheHoraireProfDto toDto(TrancheHoraireProf item) {
        if (item == null) {
            return null;
        } else {
            TrancheHoraireProfDto dto = new TrancheHoraireProfDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getStartHour()))
                dto.setStartHour(item.getStartHour());
            if(StringUtil.isNotEmpty(item.getEndHour()))
                dto.setEndHour(item.getEndHour());
            if(StringUtil.isNotEmpty(item.getDay()))
                dto.setDay(item.getDay());
            if(StringUtil.isNotEmpty(item.getGroupIndex()))
                dto.setGroupIndex(item.getGroupIndex());
            if(this.prof && item.getProf()!=null) {
                dto.setProf(profConverter.toDto(item.getProf())) ;

            }


        return dto;
        }
    }

    public void copy(TrancheHoraireProfDto dto, TrancheHoraireProf t) {
    super.copy(dto, t);
    if (dto.getProf() != null)
        profConverter.copy(dto.getProf(), t.getProf());
    }



    public void initObject(boolean value) {
        this.prof = value;
    }


    public ProfConverter getProfConverter(){
        return this.profConverter;
    }
    public void setProfConverter(ProfConverter profConverter ){
        this.profConverter = profConverter;
    }
    public boolean  isProf(){
        return this.prof;
    }
    public void  setProf(boolean prof){
        this.prof = prof;
    }
}
