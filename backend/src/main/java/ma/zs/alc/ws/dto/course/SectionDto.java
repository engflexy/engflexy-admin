package  ma.zs.alc.ws.dto.course;

import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;


import ma.zs.alc.ws.dto.quiz.QuizDto;
import ma.zs.alc.ws.dto.courseref.ContentTypeDto;
import ma.zs.alc.ws.dto.quiz.QuestionDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class SectionDto  extends AuditBaseDto {

    private String code  ;
    private String libelle  ;
    private String description  ;

    private CoursDto cours ;

    private List<QuizDto> quizs ;
    private List<ExerciceDto> exercices ;


    public SectionDto(){
        super();
    }



    @Log
    public String getCode(){
        return this.code;
    }
    public void setCode(String code){
        this.code = code;
    }

    @Log
    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }

    @Log
    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
    }


    public CoursDto getCours(){
        return this.cours;
    }

    public void setCours(CoursDto cours){
        this.cours = cours;
    }



    public List<QuizDto> getQuizs(){
        return this.quizs;
    }

    public void setQuizs(List<QuizDto> quizs){
        this.quizs = quizs;
    }
    public List<ExerciceDto> getExercices(){
        return this.exercices;
    }

    public void setExercices(List<ExerciceDto> exercices){
        this.exercices = exercices;
    }



}
