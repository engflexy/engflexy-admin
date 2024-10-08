package ma.zs.alc.ws.converter.course;

import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.ws.converter.courseref.ContentTypeConverter;
import ma.zs.alc.ws.converter.quiz.QuizConverter;
import ma.zs.alc.ws.dto.course.ExerciceDto;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ExerciceConverter extends AbstractConverter<Exercice, ExerciceDto> {

    @Autowired
    private ContentTypeConverter contentTypeConverter;
    @Autowired
    private SectionConverter sectionConverter;
    @Autowired
    private QuizConverter quizConverter;
    private boolean contentType;
    private boolean section;
    private boolean quiz;

    public ExerciceConverter() {
        super(Exercice.class, ExerciceDto.class);
        init(true);
    }

    @Override
    public Exercice toItem(ExerciceDto dto) {
        if (dto == null) {
            return null;
        } else {
            Exercice item = new Exercice();
            if (StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if (StringUtil.isNotEmpty(dto.getContent()))
                item.setContent(dto.getContent());
            if (StringUtil.isNotEmpty(dto.getDescription()))
                item.setDescription(dto.getDescription());
            if (StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());
            if (StringUtil.isNotEmpty(dto.getNumero()))
                item.setNumero(dto.getNumero());
            if (this.contentType && dto.getContentType() != null)
                item.setContentType(contentTypeConverter.toItem(dto.getContentType()));
            if (this.quiz && dto.getQuiz() != null) item.setQuiz(quizConverter.toItem(dto.getQuiz()));
            if (dto.getSection() != null && dto.getSection().getId() != null) {
                item.setSection(new Section());
                item.getSection().setId(dto.getSection().getId());
                item.getSection().setLibelle(dto.getSection().getLibelle());
            }
            return item;
        }
    }

    @Override
    public ExerciceDto toDto(Exercice item) {
        if (item == null) {
            return null;
        } else {
            ExerciceDto dto = new ExerciceDto();
            if (StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if (StringUtil.isNotEmpty(item.getContent()))
                dto.setContent(item.getContent());
            if (StringUtil.isNotEmpty(item.getDescription()))
                dto.setDescription(item.getDescription());
            if (StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());
            if (StringUtil.isNotEmpty(item.getNumero()))
                dto.setNumero(item.getNumero());
            if (this.contentType && item.getContentType() != null) {
                dto.setContentType(contentTypeConverter.toDto(item.getContentType()));

            }
            if (this.section && item.getSection() != null) {
                dto.setSection(sectionConverter.toDto(item.getSection()));

            }
            if (this.quiz && item.getQuiz() != null) {
                dto.setQuiz(quizConverter.toDto(item.getQuiz()));
            }


            return dto;
        }
    }

    public void copy(ExerciceDto dto, Exercice t) {
        super.copy(dto, t);
        if (t.getContentType() == null && dto.getContentType() != null) {
            t.setContentType(new ContentType());
        }
        if (t.getSection() == null && dto.getSection() != null) {
            t.setSection(new Section());
        }
        if (t.getQuiz() == null && dto.getQuiz() != null) {
            t.setQuiz(new Quiz());
        }

        if (dto.getContentType() != null)
            contentTypeConverter.copy(dto.getContentType(), t.getContentType());

        if (dto.getSection() != null)
            sectionConverter.copy(dto.getSection(), t.getSection());

        if (dto.getQuiz() != null)
            quizConverter.copy(dto.getQuiz(), t.getQuiz());
    }


    public void initObject(boolean value) {
        this.contentType = value;
        this.section = value;
        this.quiz = value;
    }


    public ContentTypeConverter getContentTypeConverter() {
        return this.contentTypeConverter;
    }

    public void setContentTypeConverter(ContentTypeConverter contentTypeConverter) {
        this.contentTypeConverter = contentTypeConverter;
    }

    public SectionConverter getSectionConverter() {
        return this.sectionConverter;
    }

    public void setSectionConverter(SectionConverter sectionConverter) {
        this.sectionConverter = sectionConverter;
    }

    public boolean isContentType() {
        return this.contentType;
    }

    public void setContentType(boolean contentType) {
        this.contentType = contentType;
    }

    public boolean isSection() {
        return this.section;
    }

    public void setSection(boolean section) {
        this.section = section;
    }

    public boolean isQuiz() {
        return quiz;
    }

    public void setQuiz(boolean quiz) {
        this.quiz = quiz;
    }
}
