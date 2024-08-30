package ma.zs.alc.service.impl.migration.dto;

public class LangueMigration {

    private Long id;
    private String ref;
    private String libelle;

    public LangueMigration(Long id, String libelle, String ref) {
        this.id = id;
        this.libelle = libelle;
        this.ref = libelle;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }
}

