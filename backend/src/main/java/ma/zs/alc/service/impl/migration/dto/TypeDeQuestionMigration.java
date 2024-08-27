package ma.zs.alc.service.impl.migration.dto;


public class TypeDeQuestionMigration {
    private Long id;
    private String ref;
    private String lib;

    public TypeDeQuestionMigration() {
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

    public String getLib() {
        return lib;
    }

    public void setLib(String lib) {
        this.lib = lib;
    }
}
