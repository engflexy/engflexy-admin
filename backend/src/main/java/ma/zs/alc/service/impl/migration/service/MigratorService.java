package ma.zs.alc.service.impl.migration.service;


import ma.zs.alc.bean.core.course.Cours;
import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.bean.core.quiz.Question;
import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.dao.facade.core.courseref.ContentTypeDao;
import ma.zs.alc.service.facade.admin.course.CoursAdminService;
import ma.zs.alc.service.facade.admin.course.ExerciceAdminService;
import ma.zs.alc.service.facade.admin.course.ParcoursAdminService;
import ma.zs.alc.service.facade.admin.course.SectionAdminService;
import ma.zs.alc.service.facade.admin.quiz.QuestionAdminService;
import ma.zs.alc.service.facade.admin.quiz.QuizAdminService;
import ma.zs.alc.service.impl.migration.dto.*;
import ma.zs.alc.ws.dto.course.SectionDto;
import ma.zs.alc.zynerator.util.RefelexivityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
public class MigratorService {
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private ContentTypeDao contentTypeDao;

    String baseUrl = "http://localhost:8036/api/";

    public int lunchSection() {
        String url = baseUrl + "teacher/sections/";
        SectionMigration[] sectionMigrations = restTemplate.getForObject(url, SectionMigration[].class);
        int count = 0;
        List<Section> sections = constructSections(sectionMigrations);
        if (sectionMigrations != null) {
            for (int i = 0; i < sectionMigrations.length; i++) {
                Section section = sections.get(i);
                SectionMigration sectionMigration = sectionMigrations[i];
                Section byReferenceEntity = sectionService.findByReferenceEntity(section);
                if (byReferenceEntity == null) {
                    List<Exercice> exercices = constructExercices(sectionMigration);
                    section.setExercices(exercices);
                    sectionService.create(section);
                    count++;
                }
            }
        }
        return count;
    }

    public int lunchExerciceFromQuiz() {
        String url = baseUrl + "teacher/quiz/";
        QuizMigration[] quizMigrations = restTemplate.getForObject(url, QuizMigration[].class);
        int count = 0;

        if (quizMigrations != null) {
            List<Quiz> quizzes = construct(quizMigrations, Quiz.class);
            for (int i = 0; i < quizzes.size(); i++) {
                Quiz quiz = quizzes.get(i);
                QuizMigration quizMigration = quizMigrations[i];
                List<QuestionMigration> questions = quizMigration.getQuestions();

                Quiz loadedQuiz = quizService.findByReferenceEntity(quiz);
                if (loadedQuiz == null) {
                    quizService.create(quiz);
                    count++;
                }
            }
        }

        return count;
    }


    /* public int lunchExerciceFromQuiz() {
        String url = baseUrl + "teacher/quiz/";
        QuizMigration[] quizMigrations = restTemplate.getForObject(url, QuizMigration[].class);
        int count = 0;
        ContentType contentType = contentTypeDao.findByCode("QUIZ");
        List<Quiz> quizzes = constructQuiz(quizMigrations);

        if (quizMigrations != null) {
            for (int i = 0; i < quizMigrations.length; i++) {
                Quiz quiz = quizzes.get(i);
                Exercice exercice = transform(quiz,Exercice.class);
                exercice.setContent(quiz.getLib());
                exercice.setContentType(contentType);
                exerciceService.create(exercice);
                List<Question> questions = quiz.getQuestions();
                if (questions != null) {
                    for (Question question : questions) {
                        question.setQuiz(quiz);
                        questionService.create(question);
                    }
                }

                count++;

            }
        }
        return count;
    }
*/
    private List<Quiz> constructQuiz(QuizMigration[] quizMigrations) {
        List<Quiz> quizzes = construct(quizMigrations, Quiz.class);
        for (int i = 0; i < quizzes.size(); i++) {
            Quiz quiz = quizzes.get(i);
            QuizMigration quizMigration = quizMigrations[i];
            List<Question> questions = construct(quizMigration.getQuestions().toArray(), Question.class);
            quiz.setQuestions(questions);
        }
        return quizzes;
    }


    public int lunchParcours() {
        String url = baseUrl + "parcours/";
        int count = 0;
        try {
            ParcoursMigration[] parcoursMigrations = restTemplate.getForObject(url, ParcoursMigration[].class);
            if (parcoursMigrations != null) {
                // List<Parcours> parcoursList = constructParcours(parcoursMigrations);
                List<Parcours> parcoursList = construct(parcoursMigrations, Parcours.class);

                for (int i = 0; i < parcoursMigrations.length; i++) {
                    Parcours parcours = parcoursList.get(i);
                    Parcours byReferenceEntity = parcoursService.findByReferenceEntity(parcours);
                    if (byReferenceEntity == null) {
                        parcoursService.create(parcours);
                        count++;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public int lunchCours() {
        String url = baseUrl + "student/course/";
        int count = 0;
        CoursMigration[] coursMigrations = restTemplate.getForObject(url, CoursMigration[].class);
        if (coursMigrations != null) {
            List<Cours> coursList = constructCours(coursMigrations);

            for (int i = 0; i < coursMigrations.length; i++) {
                Cours cours = coursList.get(i);
                Cours byReferenceEntity = coursService.findByReferenceEntity(cours);
                if (byReferenceEntity == null) {
                    Cours savedCours = coursService.create(cours);
                    count++;
                }
            }
        }
        return count;
    }


    private List<Parcours> constructParcours(ParcoursMigration[] parcoursMigrations) {
        List<Parcours> parcoursList = new ArrayList<>();

        if (parcoursMigrations != null) {
            for (ParcoursMigration parcoursMigration : parcoursMigrations) {
                Parcours parcours = new Parcours();
                BeanUtils.copyProperties(parcoursMigration, parcours);
                parcoursList.add(parcours);
            }
        }
        return parcoursList;
    }

    private <T, K> K transform(T t, Class<K> targetClass) {
        K output = RefelexivityUtil.constructObjectUsingDefaultConstr(targetClass);
        if (t != null) {
            BeanUtils.copyProperties(t, output);
        }
        return output;

    }

    private <T, K> List<T> construct(K[] inputs, Class<T> targetClass) {
        List<T> result = new ArrayList<>();

        if (inputs != null) {
            for (K input : inputs) {
                T elment = RefelexivityUtil.constructObjectUsingDefaultConstr(targetClass);
                BeanUtils.copyProperties(input, elment);
                result.add(elment);
            }
        }
        return result;
    }


    private List<Cours> constructCours(CoursMigration[] coursMigrations) {
        List<Cours> coursList = new ArrayList<>();

        if (coursMigrations != null) {
            for (CoursMigration coursMigration : coursMigrations) {
                Cours cours = new Cours();
                BeanUtils.copyProperties(coursMigration, cours);
                String codeParcours = coursMigration.getParcours().getCode();
                Parcours loadedParcours = parcoursService.findByCode(codeParcours);
                cours.setParcours(loadedParcours);

                coursList.add(cours);
            }
        }
        return coursList;
    }


    private List<Exercice> constructExercices(SectionMigration sectionMigration) {
        List<Exercice> exercices = new ArrayList<>();

        if (sectionMigration != null) {
            ContentType image = contentTypeDao.findByCode("image");
            ContentType video = contentTypeDao.findByCode("video");

            if (sectionMigration.getUrlImage() != null) {
                Exercice exercice = new Exercice();
                exercice.setContent(sectionMigration.getUrlImage());
                exercice.setContentType(image);
                exercices.add(exercice);
            }
            if (sectionMigration.getUrlImage2() != null) {
                Exercice exercice = new Exercice();
                exercice.setContent(sectionMigration.getUrlImage2());
                exercice.setContentType(image);
                exercices.add(exercice);
            }
            if (sectionMigration.getUrlImage3() != null) {
                Exercice exercice = new Exercice();
                exercice.setContent(sectionMigration.getUrlImage3());
                exercice.setContentType(image);
                exercices.add(exercice);

            }
            if (sectionMigration.getUrlVideo() != null) {
                Exercice exercice = new Exercice();
                exercice.setContent(sectionMigration.getUrlVideo());
                exercice.setContentType(video);
                exercices.add(exercice);

            }
        }
        return exercices;

    }

    private List<Section> constructSections(SectionMigration[] sectionMigrations) {
        List<Section> sections = new ArrayList<>();
        if (sectionMigrations != null) {
            for (SectionMigration sectionMigration : sectionMigrations) {
                Section section = new Section();
                BeanUtils.copyProperties(sectionMigration, section);

                CoursMigration coursMigration = sectionMigration.getCours();
                adaptCoursForSection(coursMigration, section);
                sections.add(section);
            }
        }
        return sections;
    }


    private void adaptCoursForSection(CoursMigration coursMigration, Section section) {
        if (coursMigration != null) {
            if (coursMigration.getCode() != null) {
                section.setCours(coursService.findByCode(coursMigration.getCode()));
            } else {
                section.setCours(null);
            }
        }
    }

    @Autowired
    private SectionAdminService sectionService;
    @Autowired
    private ParcoursAdminService parcoursService;
    @Autowired
    private CoursAdminService coursService;
    @Autowired
    private QuizAdminService quizService;
    @Autowired
    private ExerciceAdminService exerciceService;
    @Autowired
    private QuestionAdminService questionService;
}
