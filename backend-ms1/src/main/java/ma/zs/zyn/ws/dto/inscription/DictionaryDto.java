package ma.zs.zyn.ws.dto.inscription;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.zyn.zynerator.audit.Log;
import ma.zs.zyn.zynerator.dto.AuditBaseDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class DictionaryDto extends AuditBaseDto {

    private String word;
    private String definition;
    private boolean learned;
    private String createdOn;

    private EtudiantDto etudiant;


    public DictionaryDto() {
        super();
    }


    @Log
    public String getWord() {
        return this.word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    @Log
    public String getDefinition() {
        return this.definition;
    }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    @Log
    public boolean getLearned() {
        return this.learned;
    }

    public void setLearned(boolean learned) {
        this.learned = learned;
    }

    @Log
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy HH:mm")
    public String getCreatedOn() {
        return this.createdOn;
    }

    public void setCreatedOn(String createdOn) {
        this.createdOn = createdOn;
    }


    public EtudiantDto getEtudiant() {
        return this.etudiant;
    }

    public void setEtudiant(EtudiantDto etudiant) {
        this.etudiant = etudiant;
    }


}
