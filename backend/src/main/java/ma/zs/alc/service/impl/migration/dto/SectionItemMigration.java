package ma.zs.alc.service.impl.migration.dto;

import java.util.List;



public class SectionItemMigration {
   
    
    private Long id;
    
    
    private String imageUrl;
    
    
    private String response;

    private String transcription;
    
    
    private String translation;
    
    
    private String explanation;
    private SectionMigration section;
    
    private String example;
    private List<String> synonyms;

    public SectionMigration getSection() {
        return section;
    }

    public void setSection(SectionMigration section) {
        this.section = section;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public String getTranscription() {
        return transcription;
    }

    public void setTranscription(String transcription) {
        this.transcription = transcription;
    }

    public String getTranslation() {
        return translation;
    }

    public void setTranslation(String translation) {
        this.translation = translation;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public String getExample() {
        return example;
    }

    public void setExample(String example) {
        this.example = example;
    }

    public List<String> getSynonyms() {
        return synonyms;
    }

    public void setSynonyms(List<String> synonyms) {
        this.synonyms = synonyms;
    }

    @Override
    public String toString() {
        return "SectionItem{" +
                "id=" + id +
                ", imageUrl='" + imageUrl + '\'' +
                ", response='" + response + '\'' +
                ", transcription='" + transcription + '\'' +
                ", translation='" + translation + '\'' +
                ", explanation='" + explanation + '\'' +
                ", example='" + example + '\'' +
                ", synonyms=" + synonyms +
                '}';
    }
}
