package  ma.zs.zyn.dao.criteria.core.grpe;


import ma.zs.zyn.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.zyn.dao.criteria.core.prof.ProfCriteria;

import ma.zs.zyn.zynerator.criteria.BaseCriteria;
import java.util.List;
import java.time.LocalDateTime;
import java.time.LocalDate;

public class GroupeEtudiantCriteria extends  BaseCriteria  {

    private String libelle;
    private String libelleLike;
    private String type;
    private String typeLike;
    private LocalDateTime dateDebut;
    private LocalDateTime dateDebutFrom;
    private LocalDateTime dateDebutTo;
    private LocalDateTime dateFin;
    private LocalDateTime dateFinFrom;
    private LocalDateTime dateFinTo;
    private String nombrePlace;
    private String nombrePlaceMin;
    private String nombrePlaceMax;
    private String nombrePlacevide;
    private String nombrePlacevideMin;
    private String nombrePlacevideMax;
    private String nombrePlaceNonVide;
    private String nombrePlaceNonVideMin;
    private String nombrePlaceNonVideMax;
    private String nreCoursesComing;
    private String nreCoursesComingMin;
    private String nreCoursesComingMax;
    private String nreCoursesCompleted;
    private String nreCoursesCompletedMin;
    private String nreCoursesCompletedMax;
    private String nreCourses;
    private String nreCoursesMin;
    private String nreCoursesMax;

    private GroupeEtudeCriteria groupeEtude ;
    private List<GroupeEtudeCriteria> groupeEtudes ;
    private GroupeTypeCriteria groupeType ;
    private List<GroupeTypeCriteria> groupeTypes ;
    private GroupeEtatCriteria groupeEtat ;
    private List<GroupeEtatCriteria> groupeEtats ;
    private ParcoursCriteria parcours ;
    private List<ParcoursCriteria> parcourss ;
    private ProfCriteria prof ;
    private List<ProfCriteria> profs ;


    public GroupeEtudiantCriteria(){}

    public String getLibelle(){
        return this.libelle;
    }
    public void setLibelle(String libelle){
        this.libelle = libelle;
    }
    public String getLibelleLike(){
        return this.libelleLike;
    }
    public void setLibelleLike(String libelleLike){
        this.libelleLike = libelleLike;
    }

    public String getType(){
        return this.type;
    }
    public void setType(String type){
        this.type = type;
    }
    public String getTypeLike(){
        return this.typeLike;
    }
    public void setTypeLike(String typeLike){
        this.typeLike = typeLike;
    }

    public LocalDateTime getDateDebut(){
        return this.dateDebut;
    }
    public void setDateDebut(LocalDateTime dateDebut){
        this.dateDebut = dateDebut;
    }
    public LocalDateTime getDateDebutFrom(){
        return this.dateDebutFrom;
    }
    public void setDateDebutFrom(LocalDateTime dateDebutFrom){
        this.dateDebutFrom = dateDebutFrom;
    }
    public LocalDateTime getDateDebutTo(){
        return this.dateDebutTo;
    }
    public void setDateDebutTo(LocalDateTime dateDebutTo){
        this.dateDebutTo = dateDebutTo;
    }
    public LocalDateTime getDateFin(){
        return this.dateFin;
    }
    public void setDateFin(LocalDateTime dateFin){
        this.dateFin = dateFin;
    }
    public LocalDateTime getDateFinFrom(){
        return this.dateFinFrom;
    }
    public void setDateFinFrom(LocalDateTime dateFinFrom){
        this.dateFinFrom = dateFinFrom;
    }
    public LocalDateTime getDateFinTo(){
        return this.dateFinTo;
    }
    public void setDateFinTo(LocalDateTime dateFinTo){
        this.dateFinTo = dateFinTo;
    }
    public String getNombrePlace(){
        return this.nombrePlace;
    }
    public void setNombrePlace(String nombrePlace){
        this.nombrePlace = nombrePlace;
    }   
    public String getNombrePlaceMin(){
        return this.nombrePlaceMin;
    }
    public void setNombrePlaceMin(String nombrePlaceMin){
        this.nombrePlaceMin = nombrePlaceMin;
    }
    public String getNombrePlaceMax(){
        return this.nombrePlaceMax;
    }
    public void setNombrePlaceMax(String nombrePlaceMax){
        this.nombrePlaceMax = nombrePlaceMax;
    }
      
    public String getNombrePlacevide(){
        return this.nombrePlacevide;
    }
    public void setNombrePlacevide(String nombrePlacevide){
        this.nombrePlacevide = nombrePlacevide;
    }   
    public String getNombrePlacevideMin(){
        return this.nombrePlacevideMin;
    }
    public void setNombrePlacevideMin(String nombrePlacevideMin){
        this.nombrePlacevideMin = nombrePlacevideMin;
    }
    public String getNombrePlacevideMax(){
        return this.nombrePlacevideMax;
    }
    public void setNombrePlacevideMax(String nombrePlacevideMax){
        this.nombrePlacevideMax = nombrePlacevideMax;
    }
      
    public String getNombrePlaceNonVide(){
        return this.nombrePlaceNonVide;
    }
    public void setNombrePlaceNonVide(String nombrePlaceNonVide){
        this.nombrePlaceNonVide = nombrePlaceNonVide;
    }   
    public String getNombrePlaceNonVideMin(){
        return this.nombrePlaceNonVideMin;
    }
    public void setNombrePlaceNonVideMin(String nombrePlaceNonVideMin){
        this.nombrePlaceNonVideMin = nombrePlaceNonVideMin;
    }
    public String getNombrePlaceNonVideMax(){
        return this.nombrePlaceNonVideMax;
    }
    public void setNombrePlaceNonVideMax(String nombrePlaceNonVideMax){
        this.nombrePlaceNonVideMax = nombrePlaceNonVideMax;
    }
      
    public String getNreCoursesComing(){
        return this.nreCoursesComing;
    }
    public void setNreCoursesComing(String nreCoursesComing){
        this.nreCoursesComing = nreCoursesComing;
    }   
    public String getNreCoursesComingMin(){
        return this.nreCoursesComingMin;
    }
    public void setNreCoursesComingMin(String nreCoursesComingMin){
        this.nreCoursesComingMin = nreCoursesComingMin;
    }
    public String getNreCoursesComingMax(){
        return this.nreCoursesComingMax;
    }
    public void setNreCoursesComingMax(String nreCoursesComingMax){
        this.nreCoursesComingMax = nreCoursesComingMax;
    }
      
    public String getNreCoursesCompleted(){
        return this.nreCoursesCompleted;
    }
    public void setNreCoursesCompleted(String nreCoursesCompleted){
        this.nreCoursesCompleted = nreCoursesCompleted;
    }   
    public String getNreCoursesCompletedMin(){
        return this.nreCoursesCompletedMin;
    }
    public void setNreCoursesCompletedMin(String nreCoursesCompletedMin){
        this.nreCoursesCompletedMin = nreCoursesCompletedMin;
    }
    public String getNreCoursesCompletedMax(){
        return this.nreCoursesCompletedMax;
    }
    public void setNreCoursesCompletedMax(String nreCoursesCompletedMax){
        this.nreCoursesCompletedMax = nreCoursesCompletedMax;
    }
      
    public String getNreCourses(){
        return this.nreCourses;
    }
    public void setNreCourses(String nreCourses){
        this.nreCourses = nreCourses;
    }   
    public String getNreCoursesMin(){
        return this.nreCoursesMin;
    }
    public void setNreCoursesMin(String nreCoursesMin){
        this.nreCoursesMin = nreCoursesMin;
    }
    public String getNreCoursesMax(){
        return this.nreCoursesMax;
    }
    public void setNreCoursesMax(String nreCoursesMax){
        this.nreCoursesMax = nreCoursesMax;
    }
      

    public GroupeEtudeCriteria getGroupeEtude(){
        return this.groupeEtude;
    }

    public void setGroupeEtude(GroupeEtudeCriteria groupeEtude){
        this.groupeEtude = groupeEtude;
    }
    public List<GroupeEtudeCriteria> getGroupeEtudes(){
        return this.groupeEtudes;
    }

    public void setGroupeEtudes(List<GroupeEtudeCriteria> groupeEtudes){
        this.groupeEtudes = groupeEtudes;
    }
    public GroupeTypeCriteria getGroupeType(){
        return this.groupeType;
    }

    public void setGroupeType(GroupeTypeCriteria groupeType){
        this.groupeType = groupeType;
    }
    public List<GroupeTypeCriteria> getGroupeTypes(){
        return this.groupeTypes;
    }

    public void setGroupeTypes(List<GroupeTypeCriteria> groupeTypes){
        this.groupeTypes = groupeTypes;
    }
    public GroupeEtatCriteria getGroupeEtat(){
        return this.groupeEtat;
    }

    public void setGroupeEtat(GroupeEtatCriteria groupeEtat){
        this.groupeEtat = groupeEtat;
    }
    public List<GroupeEtatCriteria> getGroupeEtats(){
        return this.groupeEtats;
    }

    public void setGroupeEtats(List<GroupeEtatCriteria> groupeEtats){
        this.groupeEtats = groupeEtats;
    }
    public ParcoursCriteria getParcours(){
        return this.parcours;
    }

    public void setParcours(ParcoursCriteria parcours){
        this.parcours = parcours;
    }
    public List<ParcoursCriteria> getParcourss(){
        return this.parcourss;
    }

    public void setParcourss(List<ParcoursCriteria> parcourss){
        this.parcourss = parcourss;
    }
    public ProfCriteria getProf(){
        return this.prof;
    }

    public void setProf(ProfCriteria prof){
        this.prof = prof;
    }
    public List<ProfCriteria> getProfs(){
        return this.profs;
    }

    public void setProfs(List<ProfCriteria> profs){
        this.profs = profs;
    }
}
