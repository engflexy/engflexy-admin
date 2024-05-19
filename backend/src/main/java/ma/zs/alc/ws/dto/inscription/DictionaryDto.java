package ma.zs.alc.ws.dto.inscription;

import com.fasterxml.jackson.annotation.JsonInclude;
import ma.zs.alc.zynerator.audit.Log;
import ma.zs.alc.zynerator.dto.AuditBaseDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class DictionaryDto extends AuditBaseDto {

    private String word;
    private String definition;
    private boolean learned = false;
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
