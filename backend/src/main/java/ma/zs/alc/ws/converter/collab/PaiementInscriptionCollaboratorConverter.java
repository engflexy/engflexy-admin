package ma.zs.alc.ws.converter.collab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaboratorState;
import ma.zs.alc.bean.core.collab.InscriptionCollaborator;



import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaborator;
import ma.zs.alc.ws.dto.collab.PaiementInscriptionCollaboratorDto;

@Component
public class PaiementInscriptionCollaboratorConverter extends AbstractConverter<PaiementInscriptionCollaborator, PaiementInscriptionCollaboratorDto> {

    @Autowired
    private PaiementInscriptionCollaboratorStateConverter paiementInscriptionCollaboratorStateConverter ;
    @Autowired
    private InscriptionCollaboratorConverter inscriptionCollaboratorConverter ;
    private boolean inscriptionCollaborator;
    private boolean paiementInscriptionCollaboratorState;

    public  PaiementInscriptionCollaboratorConverter() {
        super(PaiementInscriptionCollaborator.class, PaiementInscriptionCollaboratorDto.class);
        init(true);
    }

    @Override
    public PaiementInscriptionCollaborator toItem(PaiementInscriptionCollaboratorDto dto) {
        if (dto == null) {
            return null;
        } else {
        PaiementInscriptionCollaborator item = new PaiementInscriptionCollaborator();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getTotal()))
                item.setTotal(dto.getTotal());
            if(StringUtil.isNotEmpty(dto.getDiscount()))
                item.setDiscount(dto.getDiscount());
            if(StringUtil.isNotEmpty(dto.getRemaining()))
                item.setRemaining(dto.getRemaining());
            if(StringUtil.isNotEmpty(dto.getPaiementDate()))
                item.setPaiementDate(DateUtil.stringEnToDate(DateUtil.DATE_FORMAT_ENG_WITH_TIME_ZONE,dto.getPaiementDate()));
            if(this.inscriptionCollaborator && dto.getInscriptionCollaborator()!=null)
                item.setInscriptionCollaborator(inscriptionCollaboratorConverter.toItem(dto.getInscriptionCollaborator())) ;

            if(this.paiementInscriptionCollaboratorState && dto.getPaiementInscriptionCollaboratorState()!=null)
                item.setPaiementInscriptionCollaboratorState(paiementInscriptionCollaboratorStateConverter.toItem(dto.getPaiementInscriptionCollaboratorState())) ;




        return item;
        }
    }

    @Override
    public PaiementInscriptionCollaboratorDto toDto(PaiementInscriptionCollaborator item) {
        if (item == null) {
            return null;
        } else {
            PaiementInscriptionCollaboratorDto dto = new PaiementInscriptionCollaboratorDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getTotal()))
                dto.setTotal(item.getTotal());
            if(StringUtil.isNotEmpty(item.getDiscount()))
                dto.setDiscount(item.getDiscount());
            if(StringUtil.isNotEmpty(item.getRemaining()))
                dto.setRemaining(item.getRemaining());
            if(item.getPaiementDate()!=null)
                dto.setPaiementDate(DateUtil.dateTimeToString(item.getPaiementDate()));
            if(this.inscriptionCollaborator && item.getInscriptionCollaborator()!=null) {
                dto.setInscriptionCollaborator(inscriptionCollaboratorConverter.toDto(item.getInscriptionCollaborator())) ;

            }
            if(this.paiementInscriptionCollaboratorState && item.getPaiementInscriptionCollaboratorState()!=null) {
                dto.setPaiementInscriptionCollaboratorState(paiementInscriptionCollaboratorStateConverter.toDto(item.getPaiementInscriptionCollaboratorState())) ;

            }


        return dto;
        }
    }

    public void copy(PaiementInscriptionCollaboratorDto dto, PaiementInscriptionCollaborator t) {
    super.copy(dto, t);
    if(t.getInscriptionCollaborator() == null && dto.getInscriptionCollaborator() != null) {
        t.setInscriptionCollaborator(new InscriptionCollaborator());
    }
    if(t.getPaiementInscriptionCollaboratorState() == null && dto.getPaiementInscriptionCollaboratorState() != null) {
        t.setPaiementInscriptionCollaboratorState(new PaiementInscriptionCollaboratorState());
    }
    if (dto.getInscriptionCollaborator() != null)
        inscriptionCollaboratorConverter.copy(dto.getInscriptionCollaborator(), t.getInscriptionCollaborator());
    if (dto.getPaiementInscriptionCollaboratorState() != null)
        paiementInscriptionCollaboratorStateConverter.copy(dto.getPaiementInscriptionCollaboratorState(), t.getPaiementInscriptionCollaboratorState());
    }



    public void initObject(boolean value) {
        this.inscriptionCollaborator = value;
        this.paiementInscriptionCollaboratorState = value;
    }


    public PaiementInscriptionCollaboratorStateConverter getPaiementInscriptionCollaboratorStateConverter(){
        return this.paiementInscriptionCollaboratorStateConverter;
    }
    public void setPaiementInscriptionCollaboratorStateConverter(PaiementInscriptionCollaboratorStateConverter paiementInscriptionCollaboratorStateConverter ){
        this.paiementInscriptionCollaboratorStateConverter = paiementInscriptionCollaboratorStateConverter;
    }
    public InscriptionCollaboratorConverter getInscriptionCollaboratorConverter(){
        return this.inscriptionCollaboratorConverter;
    }
    public void setInscriptionCollaboratorConverter(InscriptionCollaboratorConverter inscriptionCollaboratorConverter ){
        this.inscriptionCollaboratorConverter = inscriptionCollaboratorConverter;
    }
    public boolean  isInscriptionCollaborator(){
        return this.inscriptionCollaborator;
    }
    public void  setInscriptionCollaborator(boolean inscriptionCollaborator){
        this.inscriptionCollaborator = inscriptionCollaborator;
    }
    public boolean  isPaiementInscriptionCollaboratorState(){
        return this.paiementInscriptionCollaboratorState;
    }
    public void  setPaiementInscriptionCollaboratorState(boolean paiementInscriptionCollaboratorState){
        this.paiementInscriptionCollaboratorState = paiementInscriptionCollaboratorState;
    }
}
