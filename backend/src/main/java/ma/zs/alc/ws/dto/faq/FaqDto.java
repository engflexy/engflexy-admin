package  ma.zs.alc.ws.dto.faq;

import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;





@JsonInclude(JsonInclude.Include.NON_NULL)
public class FaqDto  extends AuditBaseDto {

    private String question;
    private String answer;

    private FaqTypeDto faqType ;



    public FaqDto(){
        super();
    }



    @Log
    public String getQuestion(){
        return this.question;
    }
    public void setQuestion(String question){
        this.question = question;
    }

    @Log
    public String getAnswer(){
        return this.answer;
    }
    public void setAnswer(String answer){
        this.answer = answer;
    }


    public FaqTypeDto getFaqType(){
        return this.faqType;
    }

    public void setFaqType(FaqTypeDto faqType){
        this.faqType = faqType;
    }






}
