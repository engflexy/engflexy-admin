package  ma.zs.alc.ws.dto.quiz;

import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.ws.dto.course.ExerciceDto;
import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;


import ma.zs.alc.ws.dto.course.SectionDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class QuizDto  extends AuditBaseDto {

    private String ref  ;
    private String lib  ;
    private String dateDebut ;
    private String dateFin ;
    private Long numero  ;
    private Long seuilReussite  ;

    private ExerciceDto exercice;

    private List<QuestionDto> questions ;


    public QuizDto(){
        super();
    }



    @Log
    public String getRef(){
        return this.ref;
    }
    public void setRef(String ref){
        this.ref = ref;
    }

    @Log
    public String getLib(){
        return this.lib;
    }
    public void setLib(String lib){
        this.lib = lib;
    }

    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getDateDebut(){
        return this.dateDebut;
    }
    public void setDateDebut(String dateDebut){
        this.dateDebut = dateDebut;
    }

    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getDateFin(){
        return this.dateFin;
    }
    public void setDateFin(String dateFin){
        this.dateFin = dateFin;
    }

    @Log
    public Long getNumero(){
        return this.numero;
    }
    public void setNumero(Long numero){
        this.numero = numero;
    }

    @Log
    public Long getSeuilReussite(){
        return this.seuilReussite;
    }
    public void setSeuilReussite(Long seuilReussite){
        this.seuilReussite = seuilReussite;
    }


    public ExerciceDto getExercice(){
        return this.exercice;
    }

    public void setExercice(ExerciceDto exercice){
        this.exercice = exercice;
    }



    public List<QuestionDto> getQuestions(){
        return this.questions;
    }

    public void setQuestions(List<QuestionDto> questions){
        this.questions = questions;
    }



}
