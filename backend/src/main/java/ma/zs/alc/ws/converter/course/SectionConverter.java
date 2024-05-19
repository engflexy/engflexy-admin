package  ma.zs.alc.ws.converter.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ma.zs.alc.zynerator.util.ListUtil;

import ma.zs.alc.ws.converter.quiz.QuizConverter;
import ma.zs.alc.ws.converter.courseref.ContentTypeConverter;
import ma.zs.alc.ws.converter.quiz.QuestionConverter;
import ma.zs.alc.ws.converter.course.ExerciceConverter;
import ma.zs.alc.ws.converter.course.CoursConverter;

import ma.zs.alc.bean.core.course.Cours;


import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.ws.dto.course.SectionDto;

@Component
public class SectionConverter extends AbstractConverter<Section, SectionDto> {

    @Autowired
    private QuizConverter quizConverter ;
    @Autowired
    private ContentTypeConverter contentTypeConverter ;
    @Autowired
    private QuestionConverter questionConverter ;
    @Autowired
    private ExerciceConverter exerciceConverter ;
    @Autowired
    private CoursConverter coursConverter ;
    private boolean cours;
    private boolean quizs;
    private boolean exercices;

    public  SectionConverter() {
        super(Section.class, SectionDto.class);
        init(true);
    }

    @Override
    public Section toItem(SectionDto dto) {
        if (dto == null) {
            return null;
        } else {
        Section item = new Section();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getCode()))
                item.setCode(dto.getCode());
            if(StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());
            if(StringUtil.isNotEmpty(dto.getDescription()))
                item.setDescription(dto.getDescription());
            if(dto.getCours() != null && dto.getCours().getId() != null){
                item.setCours(new Cours());
                item.getCours().setId(dto.getCours().getId());
                item.getCours().setLibelle(dto.getCours().getLibelle());
            }


            if(this.quizs && ListUtil.isNotEmpty(dto.getQuizs()))
                item.setQuizs(quizConverter.toItem(dto.getQuizs()));
            if(this.exercices && ListUtil.isNotEmpty(dto.getExercices()))
                item.setExercices(exerciceConverter.toItem(dto.getExercices()));


        return item;
        }
    }

    @Override
    public SectionDto toDto(Section item) {
        if (item == null) {
            return null;
        } else {
            SectionDto dto = new SectionDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getCode()))
                dto.setCode(item.getCode());
            if(StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());
            if(StringUtil.isNotEmpty(item.getDescription()))
                dto.setDescription(item.getDescription());
            if(this.cours && item.getCours()!=null) {
                dto.setCours(coursConverter.toDto(item.getCours())) ;

            }
        if(this.quizs && ListUtil.isNotEmpty(item.getQuizs())){
            quizConverter.init(true);
            quizConverter.setSection(false);
            dto.setQuizs(quizConverter.toDto(item.getQuizs()));
            quizConverter.setSection(true);

        }
        if(this.exercices && ListUtil.isNotEmpty(item.getExercices())){
            exerciceConverter.init(true);
            exerciceConverter.setSection(false);
            dto.setExercices(exerciceConverter.toDto(item.getExercices()));
            exerciceConverter.setSection(true);

        }


        return dto;
        }
    }

    public void copy(SectionDto dto, Section t) {
    super.copy(dto, t);
    if (dto.getCours() != null)
        coursConverter.copy(dto.getCours(), t.getCours());
    if (dto.getQuizs() != null)
        t.setQuizs(quizConverter.copy(dto.getQuizs()));
    if (dto.getExercices() != null)
        t.setExercices(exerciceConverter.copy(dto.getExercices()));
    }


    public void initList(boolean value) {
        this.quizs = value;
        this.exercices = value;
    }

    public void initObject(boolean value) {
        this.cours = value;
    }


    public QuizConverter getQuizConverter(){
        return this.quizConverter;
    }
    public void setQuizConverter(QuizConverter quizConverter ){
        this.quizConverter = quizConverter;
    }
    public ContentTypeConverter getContentTypeConverter(){
        return this.contentTypeConverter;
    }
    public void setContentTypeConverter(ContentTypeConverter contentTypeConverter ){
        this.contentTypeConverter = contentTypeConverter;
    }
    public QuestionConverter getQuestionConverter(){
        return this.questionConverter;
    }
    public void setQuestionConverter(QuestionConverter questionConverter ){
        this.questionConverter = questionConverter;
    }
    public ExerciceConverter getExerciceConverter(){
        return this.exerciceConverter;
    }
    public void setExerciceConverter(ExerciceConverter exerciceConverter ){
        this.exerciceConverter = exerciceConverter;
    }
    public CoursConverter getCoursConverter(){
        return this.coursConverter;
    }
    public void setCoursConverter(CoursConverter coursConverter ){
        this.coursConverter = coursConverter;
    }
    public boolean  isCours(){
        return this.cours;
    }
    public void  setCours(boolean cours){
        this.cours = cours;
    }
    public boolean  isQuizs(){
        return this.quizs ;
    }
    public void  setQuizs(boolean quizs ){
        this.quizs  = quizs ;
    }
    public boolean  isExercices(){
        return this.exercices ;
    }
    public void  setExercices(boolean exercices ){
        this.exercices  = exercices ;
    }
}
