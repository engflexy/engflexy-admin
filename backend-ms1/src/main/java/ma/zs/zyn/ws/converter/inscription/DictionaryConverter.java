package  ma.zs.zyn.ws.converter.inscription;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ma.zs.zyn.ws.converter.inscription.EtudiantConverter;

import ma.zs.zyn.bean.core.inscription.Etudiant;


import ma.zs.zyn.zynerator.util.StringUtil;
import ma.zs.zyn.zynerator.converter.AbstractConverter;
import ma.zs.zyn.zynerator.util.DateUtil;
import ma.zs.zyn.bean.core.inscription.Dictionary;
import ma.zs.zyn.ws.dto.inscription.DictionaryDto;

@Component
public class DictionaryConverter extends AbstractConverter<Dictionary, DictionaryDto> {

    @Autowired
    private EtudiantConverter etudiantConverter ;
    private boolean etudiant;

    public  DictionaryConverter() {
        super(Dictionary.class, DictionaryDto.class);
        init(true);
    }

    @Override
    public Dictionary toItem(DictionaryDto dto) {
        if (dto == null) {
            return null;
        } else {
        Dictionary item = new Dictionary();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getWord()))
                item.setWord(dto.getWord());
            if(StringUtil.isNotEmpty(dto.getDefinition()))
                item.setDefinition(dto.getDefinition());
                item.setLearned(dto.getLearned());

            if(dto.getEtudiant() != null && dto.getEtudiant().getId() != null){
                item.setEtudiant(new Etudiant());
                item.getEtudiant().setId(dto.getEtudiant().getId());
                item.getEtudiant().setRef(dto.getEtudiant().getRef());
            }




        return item;
        }
    }

    @Override
    public DictionaryDto toDto(Dictionary item) {
        if (item == null) {
            return null;
        } else {
            DictionaryDto dto = new DictionaryDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getWord()))
                dto.setWord(item.getWord());
            if(StringUtil.isNotEmpty(item.getDefinition()))
                dto.setDefinition(item.getDefinition());
                dto.setLearned(item.getLearned());
//            if(StringUtil.isNotEmpty(item.getCreatedOn()))
//                dto.setCreatedOn(item.getCreatedOn());
            if(this.etudiant && item.getEtudiant()!=null) {
                dto.setEtudiant(etudiantConverter.toDto(item.getEtudiant())) ;

            }


        return dto;
        }
    }

    public void copy(DictionaryDto dto, Dictionary t) {
    super.copy(dto, t);
    if (dto.getEtudiant() != null)
        etudiantConverter.copy(dto.getEtudiant(), t.getEtudiant());
    }



    public void initObject(boolean value) {
        this.etudiant = value;
    }


    public EtudiantConverter getEtudiantConverter(){
        return this.etudiantConverter;
    }
    public void setEtudiantConverter(EtudiantConverter etudiantConverter ){
        this.etudiantConverter = etudiantConverter;
    }
    public boolean  isEtudiant(){
        return this.etudiant;
    }
    public void  setEtudiant(boolean etudiant){
        this.etudiant = etudiant;
    }
}
