package ma.zs.alc.ws.converter.quiz;

import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.ws.converter.course.ExerciceConverter;
import ma.zs.alc.ws.converter.inscription.EtudiantConverter;
import ma.zs.alc.ws.converter.quizetudiant.QuizEtudiantConverter;
import ma.zs.alc.ws.converter.quizetudiant.ReponseEtudiantConverter;
import ma.zs.alc.ws.converter.quizref.TypeDeQuestionConverter;
import ma.zs.alc.ws.dto.quiz.QuizDto;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.zynerator.util.ListUtil;
import ma.zs.alc.zynerator.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class QuizConverter extends AbstractConverter<Quiz, QuizDto> {

    @Autowired
    private QuizEtudiantConverter quizEtudiantConverter;
    @Autowired
    private TypeDeQuestionConverter typeDeQuestionConverter;
    @Autowired
    private EtudiantConverter etudiantConverter;
    @Autowired
    private ReponseEtudiantConverter reponseEtudiantConverter;
    @Autowired
    private QuestionConverter questionConverter;
    @Autowired
    private ReponseConverter reponseConverter;
    @Autowired
    private ExerciceConverter exerciceConverter;
    private boolean exercice;
    private boolean questions;
    private boolean quizEtudiants;

    public QuizConverter() {
        super(Quiz.class, QuizDto.class);
        init(true);
    }

    @Override
    public Quiz toItem(QuizDto dto) {
        if (dto == null) {
            return null;
        } else {
            Quiz item = new Quiz();
            if (StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if (StringUtil.isNotEmpty(dto.getRef()))
                item.setRef(dto.getRef());
            if (StringUtil.isNotEmpty(dto.getLib()))
                item.setLib(dto.getLib());
            if (StringUtil.isNotEmpty(dto.getDateDebut()))
                item.setDateDebut(DateUtil.stringEnToDate(dto.getDateDebut(), DateUtil.DATE_FORMAT_ENG));
            if (StringUtil.isNotEmpty(dto.getDateFin()))
                item.setDateFin(DateUtil.stringEnToDate(dto.getDateFin(), DateUtil.DATE_FORMAT_ENG));
            if (StringUtil.isNotEmpty(dto.getNumero()))
                item.setNumero(dto.getNumero());
            if (StringUtil.isNotEmpty(dto.getSeuilReussite()))
                item.setSeuilReussite(dto.getSeuilReussite());
            if (dto.getExercice() != null && dto.getExercice().getId() != null) {
                item.setExercice(new Exercice());
                item.getExercice().setId(dto.getExercice().getId());
                item.getExercice().setLibelle(dto.getExercice().getLibelle());
            }


            if (this.questions && ListUtil.isNotEmpty(dto.getQuestions()))
                item.setQuestions(questionConverter.toItem(dto.getQuestions()));
            return item;
        }
    }

    @Override
    public QuizDto toDto(Quiz item) {
        if (item == null) {
            return null;
        } else {
            QuizDto dto = new QuizDto();
            if (StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if (StringUtil.isNotEmpty(item.getRef()))
                dto.setRef(item.getRef());
            if (StringUtil.isNotEmpty(item.getLib()))
                dto.setLib(item.getLib());
            if (item.getDateDebut() != null)
                dto.setDateDebut(DateUtil.dateTimeToString(item.getDateDebut()));
            if (item.getDateFin() != null)
                dto.setDateFin(DateUtil.dateTimeToString(item.getDateFin()));
            if (StringUtil.isNotEmpty(item.getNumero()))
                dto.setNumero(item.getNumero());
            if (StringUtil.isNotEmpty(item.getSeuilReussite()))
                dto.setSeuilReussite(item.getSeuilReussite());
            if (this.exercice && item.getExercice() != null) {
                dto.setExercice(exerciceConverter.toDto(item.getExercice()));

            }
            if (this.questions && ListUtil.isNotEmpty(item.getQuestions())) {
                questionConverter.init(true);
                questionConverter.setQuiz(false);
                dto.setQuestions(questionConverter.toDto(item.getQuestions()));
                questionConverter.setQuiz(true);

            }

            return dto;
        }
    }

    public void copy(QuizDto dto, Quiz t) {
        super.copy(dto, t);
        if (t.getExercice() == null && dto.getExercice() != null) {
            t.setExercice(new Exercice());
        }
        if (dto.getQuestions() != null)
            t.setQuestions(questionConverter.copy(dto.getQuestions()));
        if (dto.getExercice() != null)
            exerciceConverter.copy(dto.getExercice(), t.getExercice());
    }


    public void initList(boolean value) {
        this.questions = value;
        this.quizEtudiants = value;
    }

    public void initObject(boolean value) {
        this.exercice = value;
    }


    public QuizEtudiantConverter getQuizEtudiantConverter() {
        return this.quizEtudiantConverter;
    }

    public void setQuizEtudiantConverter(QuizEtudiantConverter quizEtudiantConverter) {
        this.quizEtudiantConverter = quizEtudiantConverter;
    }

    public TypeDeQuestionConverter getTypeDeQuestionConverter() {
        return this.typeDeQuestionConverter;
    }

    public void setTypeDeQuestionConverter(TypeDeQuestionConverter typeDeQuestionConverter) {
        this.typeDeQuestionConverter = typeDeQuestionConverter;
    }

    public EtudiantConverter getEtudiantConverter() {
        return this.etudiantConverter;
    }

    public void setEtudiantConverter(EtudiantConverter etudiantConverter) {
        this.etudiantConverter = etudiantConverter;
    }

    public ReponseEtudiantConverter getReponseEtudiantConverter() {
        return this.reponseEtudiantConverter;
    }

    public void setReponseEtudiantConverter(ReponseEtudiantConverter reponseEtudiantConverter) {
        this.reponseEtudiantConverter = reponseEtudiantConverter;
    }

    public QuestionConverter getQuestionConverter() {
        return this.questionConverter;
    }

    public void setQuestionConverter(QuestionConverter questionConverter) {
        this.questionConverter = questionConverter;
    }

    public ReponseConverter getReponseConverter() {
        return this.reponseConverter;
    }

    public void setReponseConverter(ReponseConverter reponseConverter) {
        this.reponseConverter = reponseConverter;
    }

    public ExerciceConverter getExerciceConverter() {
        return this.exerciceConverter;
    }

    public void setExerciceConverter(ExerciceConverter exerciceConverter) {
        this.exerciceConverter = exerciceConverter;
    }

    public boolean isExercice() {
        return this.exercice;
    }

    public void setExercice(boolean exercice) {
        this.exercice = exercice;
    }

    public boolean isQuestions() {
        return this.questions;
    }

    public void setQuestions(boolean questions) {
        this.questions = questions;
    }

    public boolean isQuizEtudiants() {
        return this.quizEtudiants;
    }

    public void setQuizEtudiants(boolean quizEtudiants) {
        this.quizEtudiants = quizEtudiants;
    }
}
