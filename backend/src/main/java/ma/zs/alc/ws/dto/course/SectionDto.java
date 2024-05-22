package ma.zs.alc.ws.dto.course;

import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.ws.dto.quiz.QuizDto;
import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;

import java.util.List;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class SectionDto extends AuditBaseDto {

    private String code;
    private String libelle;
    private String description;
    private Long numero;
    private CoursDto cours;

    private List<ExerciceDto> exercices;


    public SectionDto() {
        super();
    }


    @Log
    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Log
    public String getLibelle() {
        return this.libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    @Log
    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Log
    public CoursDto getCours() {
        return this.cours;
    }

    public void setCours(CoursDto cours) {
        this.cours = cours;
    }

    @Log
    public Long getNumero() {
        return numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    public List<ExerciceDto> getExercices() {
        return this.exercices;
    }

    public void setExercices(List<ExerciceDto> exercices) {
        this.exercices = exercices;
    }


}
