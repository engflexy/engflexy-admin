package ma.zs.alc.ws.dto.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.ws.dto.collab.CollaboratorDto;
import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;

import java.util.List;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class ParcoursDto extends AuditBaseDto {

    private String datePublication;
    private String dateCreation;
    private String description;
    private String code;
    private String libelle;
    private Integer numeroOrder = 0;
    private Integer nombreCours = 0;
    private String url;
    private String color;
    private CollaboratorDto collaborator;

    private List<CoursDto> courss;


    public ParcoursDto() {
        super();
    }


    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getDatePublication() {
        return this.datePublication;
    }

    public void setDatePublication(String datePublication) {
        this.datePublication = datePublication;
    }

    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getDateCreation() {
        return this.dateCreation;
    }

    public void setDateCreation(String dateCreation) {
        this.dateCreation = dateCreation;
    }

    @Log
    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
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
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Log
    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Log
    public Integer getNumeroOrder() {
        return this.numeroOrder;
    }

    public void setNumeroOrder(Integer numeroOrder) {
        this.numeroOrder = numeroOrder;
    }

    @Log
    public Integer getNombreCours() {
        return this.nombreCours;
    }

    public void setNombreCours(Integer nombreCours) {
        this.nombreCours = nombreCours;
    }


    public CollaboratorDto getCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(CollaboratorDto collaborator) {
        this.collaborator = collaborator;
    }


    public List<CoursDto> getCourss() {
        return this.courss;
    }

    public void setCourss(List<CoursDto> courss) {
        this.courss = courss;
    }


}
