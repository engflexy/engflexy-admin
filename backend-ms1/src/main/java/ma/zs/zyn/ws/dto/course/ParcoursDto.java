package  ma.zs.zyn.ws.dto.course;

import ma.zs.zyn.zynerator.audit.Log;
import ma.zs.zyn.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;

import java.util.List;
import java.util.Date;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonFormat;


import ma.zs.zyn.ws.dto.quizetudiant.QuizEtudiantDto;
import ma.zs.zyn.ws.dto.inscriptionref.EtatEtudiantScheduleDto;
import ma.zs.zyn.ws.dto.inscriptionref.InteretEtudiantDto;
import ma.zs.zyn.ws.dto.inscription.EtudiantDto;
import ma.zs.zyn.ws.dto.inscriptionref.StatutSocialDto;
import ma.zs.zyn.ws.dto.inscriptionref.LangueDto;
import ma.zs.zyn.ws.dto.grpe.GroupeEtudiantDto;
import ma.zs.zyn.ws.dto.courseref.EtatCoursDto;
import ma.zs.zyn.ws.dto.courseref.CentreDto;
import ma.zs.zyn.ws.dto.grpe.GroupeEtudeDto;
import ma.zs.zyn.ws.dto.homework.HomeWorkDto;
import ma.zs.zyn.ws.dto.inscriptionref.SkillDto;
import ma.zs.zyn.ws.dto.inscriptionref.FonctionDto;
import ma.zs.zyn.ws.dto.pack.PackStudentDto;
import ma.zs.zyn.ws.dto.grpe.GroupeEtudiantDetailDto;
import ma.zs.zyn.ws.dto.inscriptionref.TeacherLocalityDto;
import ma.zs.zyn.ws.dto.inscriptionref.NiveauEtudeDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class ParcoursDto  extends AuditBaseDto {

    private String datePublication ;
    private String dateCreation ;
    private String description  ;
    private String code  ;
    private String libelle  ;
    private Integer numeroOrder  = 0 ;
    private Integer nombreCours  = 0 ;

    private CentreDto centre ;

    private List<CoursDto> courss ;
    private List<EtudiantDto> etudiants ;


    public ParcoursDto(){
        super();
    }



    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getDatePublication(){
        return this.datePublication;
    }
    public void setDatePublication(String datePublication){
        this.datePublication = datePublication;
    }

    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getDateCreation(){
        return this.dateCreation;
    }
    public void setDateCreation(String dateCreation){
        this.dateCreation = dateCreation;
    }

    @Log
    public String getDescription(){
        return this.description;
    }
    public void setDescription(String description){
        this.description = description;
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
    public Integer getNumeroOrder(){
        return this.numeroOrder;
    }
    public void setNumeroOrder(Integer numeroOrder){
        this.numeroOrder = numeroOrder;
    }

    @Log
    public Integer getNombreCours(){
        return this.nombreCours;
    }
    public void setNombreCours(Integer nombreCours){
        this.nombreCours = nombreCours;
    }


    public CentreDto getCentre(){
        return this.centre;
    }

    public void setCentre(CentreDto centre){
        this.centre = centre;
    }



    public List<CoursDto> getCourss(){
        return this.courss;
    }

    public void setCourss(List<CoursDto> courss){
        this.courss = courss;
    }
    public List<EtudiantDto> getEtudiants(){
        return this.etudiants;
    }

    public void setEtudiants(List<EtudiantDto> etudiants){
        this.etudiants = etudiants;
    }



}
