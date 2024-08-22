package ma.zs.alc.service.impl.migration.dto;
import java.util.Date;
import java.util.List;



public class ParcoursMigration {
   
    
    private Long id;
    
    private String datePublication;
    
    private String dateCreation;
    
    
    private String description;
    private String libelle;
    private String code;
    
   private List<CoursMigration> cours;
    private int numeroOrder;
    private int nombreCours;

    public List<CoursMigration> getCours() {
        return cours;
    }

    public void setCours(List<CoursMigration> cours) {
        this.cours = cours;
    }

    public ParcoursMigration() {
    }

    public ParcoursMigration(Long id, String libelle) {
        this.id = id;
        this.libelle = libelle;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDatePublication() {
        return datePublication;
    }

    public void setDatePublication(String datePublication) {
        this.datePublication = datePublication;
    }

    public String getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(String dateCreation) {
        this.dateCreation = dateCreation;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

  /*  public List<CoursMigration> getCours() {
        return cours;
    }

    public void setCours(List<CoursMigration> cours) {
        this.cours = cours;
    }*/

    public int getNumeroOrder() {
        return numeroOrder;
    }

    public void setNumeroOrder(int numeroOrder) {
        this.numeroOrder = numeroOrder;
    }

    public int getNombreCours() {
        return nombreCours;
    }

    public void setNombreCours(int nombreCours) {
        this.nombreCours = nombreCours;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ParcoursMigration other = (ParcoursMigration) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }

}
