package  ma.zs.alc.ws.dto.faq;

import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class FaqTypeDto  extends AuditBaseDto {

    private String destinataire  ;
    private String libelle  ;
    private List<FaqDto> faqs;



    public FaqTypeDto(){
        super();
    }



    @Log
    public String getDestinataire(){
        return this.destinataire;
    }
    public void setDestinataire(String destinataire){
        this.destinataire = destinataire;
    }

    @Log
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }

    public List<FaqDto> getFaqs() {
        return faqs;
    }

    public void setFaqs(List<FaqDto> faqs) {
        this.faqs = faqs;
    }






}
