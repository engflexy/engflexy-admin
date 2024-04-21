package  ma.zs.zyn.ws.converter.faq;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ma.zs.zyn.ws.converter.faq.FaqTypeConverter;



import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.faq.Faq;
import ma.zs.zyn.ws.dto.faq.FaqDto;

@Component
public class FaqConverter extends AbstractConverter<Faq, FaqDto> {

    @Autowired
    private FaqTypeConverter faqTypeConverter ;
    private boolean faqType;

    public  FaqConverter() {
        super(Faq.class, FaqDto.class);
        init(true);
    }

    @Override
    public Faq toItem(FaqDto dto) {
        if (dto == null) {
            return null;
        } else {
        Faq item = new Faq();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getDescription()))
                item.setDescription(dto.getDescription());
            if(StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());
            if(this.faqType && dto.getFaqType()!=null)
                item.setFaqType(faqTypeConverter.toItem(dto.getFaqType())) ;




        return item;
        }
    }

    @Override
    public FaqDto toDto(Faq item) {
        if (item == null) {
            return null;
        } else {
            FaqDto dto = new FaqDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getDescription()))
                dto.setDescription(item.getDescription());
            if(StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());
            if(this.faqType && item.getFaqType()!=null) {
                dto.setFaqType(faqTypeConverter.toDto(item.getFaqType())) ;

            }


        return dto;
        }
    }

    public void copy(FaqDto dto, Faq t) {
    super.copy(dto, t);
    if (dto.getFaqType() != null)
        faqTypeConverter.copy(dto.getFaqType(), t.getFaqType());
    }



    public void initObject(boolean value) {
        this.faqType = value;
    }


    public FaqTypeConverter getFaqTypeConverter(){
        return this.faqTypeConverter;
    }
    public void setFaqTypeConverter(FaqTypeConverter faqTypeConverter ){
        this.faqTypeConverter = faqTypeConverter;
    }
    public boolean  isFaqType(){
        return this.faqType;
    }
    public void  setFaqType(boolean faqType){
        this.faqType = faqType;
    }
}
