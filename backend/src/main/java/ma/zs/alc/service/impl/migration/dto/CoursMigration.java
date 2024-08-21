package ma.zs.alc.service.impl.migration.dto;

import java.util.List;

public class CoursMigration {
   
    
    private Long id;
    
    
    private String description;
    
    
    private String image;
    
    
    private String libelle;
    private String code;
    private String etatCours;

   
    private ParcoursMigration parcoursMigration;

    
    
    private List<SectionMigration> sectionMigrations;

    
    
   // private List<HomeWork> homeWorkList;

    private int nombreSectionFinalise;
    private int nombreSectionEnCours;
    private int nombreLinkEnCours;
    private int nombreLinkFinalise;
    private int numeroOrder;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getEtatCours() {
        return etatCours;
    }

    public void setEtatCours(String etatCours) {
        this.etatCours = etatCours;
    }

    public ParcoursMigration getParcours() {
        return parcoursMigration;
    }

    public void setParcours(ParcoursMigration parcoursMigration) {
        this.parcoursMigration = parcoursMigration;
    }

    public List<SectionMigration> getSections() {
        return sectionMigrations;
    }

    public void setSections(List<SectionMigration> sectionMigrations) {
        this.sectionMigrations = sectionMigrations;
    }

    public int getNombreSectionFinalise() {
        return nombreSectionFinalise;
    }

    public void setNombreSectionFinalise(int nombreSectionFinalise) {
        this.nombreSectionFinalise = nombreSectionFinalise;
    }

    public int getNombreSectionEnCours() {
        return nombreSectionEnCours;
    }

    public void setNombreSectionEnCours(int nombreSectionEnCours) {
        this.nombreSectionEnCours = nombreSectionEnCours;
    }

    public int getNombreLinkEnCours() {
        return nombreLinkEnCours;
    }

    public void setNombreLinkEnCours(int nombreLinkEnCours) {
        this.nombreLinkEnCours = nombreLinkEnCours;
    }

    public int getNombreLinkFinalise() {
        return nombreLinkFinalise;
    }

    public void setNombreLinkFinalise(int nombreLinkFinalise) {
        this.nombreLinkFinalise = nombreLinkFinalise;
    }

    public int getNumeroOrder() {
        return numeroOrder;
    }

    public void setNumeroOrder(int numeroOrder) {
        this.numeroOrder = numeroOrder;
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
        CoursMigration other = (CoursMigration) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        return true;
    }


}
