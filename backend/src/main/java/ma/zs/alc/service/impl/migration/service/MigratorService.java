package ma.zs.alc.service.impl.migration.service;


import ma.zs.alc.bean.core.course.*;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.bean.core.inscriptionref.Langue;
import ma.zs.alc.bean.core.quiz.Question;
import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.bean.core.quizref.TypeDeQuestion;
import ma.zs.alc.dao.facade.core.course.*;
import ma.zs.alc.dao.facade.core.inscriptionref.LangueDao;
import ma.zs.alc.dao.facade.core.quiz.QuestionDao;
import ma.zs.alc.dao.facade.core.quiz.QuizDao;
import ma.zs.alc.dao.facade.core.quizref.TypeDeQuestionDao;
import ma.zs.alc.service.facade.admin.course.*;
import ma.zs.alc.service.facade.admin.courseref.ContentTypeAdminService;
import ma.zs.alc.service.facade.admin.inscriptionref.LangueAdminService;
import ma.zs.alc.service.facade.admin.quiz.QuestionAdminService;
import ma.zs.alc.service.facade.admin.quiz.QuizAdminService;
import ma.zs.alc.service.facade.admin.quizref.TypeDeQuestionAdminService;
import ma.zs.alc.service.impl.migration.dto.*;
import ma.zs.alc.zynerator.security.bean.Role;
import ma.zs.alc.zynerator.security.bean.RoleUser;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.security.dao.facade.core.RoleDao;
import ma.zs.alc.zynerator.security.dao.facade.core.RoleUserDao;
import ma.zs.alc.zynerator.security.dao.facade.core.UserDao;
import ma.zs.alc.zynerator.security.service.facade.RoleService;
import ma.zs.alc.zynerator.security.service.facade.RoleUserService;
import ma.zs.alc.zynerator.security.service.facade.UserService;
import ma.zs.alc.zynerator.util.RefelexivityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
public class MigratorService {
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private ContentTypeAdminService contentTypeService;

    String baseUrl = "http://localhost:8036/api/";
    @Autowired
    private UserDao userDao;
    @Autowired
    private LangueDao langueDao;
    @Autowired
    private RoleUserDao roleUserDao;
    @Autowired
    private RoleDao roleDao;

    public List<ProcessResult> lunchAll() {
        ProcessResult processResultParcours = lunchParcours();
        ProcessResult processResultCours = new ProcessResult();
        ProcessResult processResultSection = new ProcessResult();
        ProcessResult processResultExercice = new ProcessResult();
        if (processResultParcours.getErrors().isEmpty()) {
            processResultCours = lunchCours();
            if (processResultCours.getErrors().isEmpty()) {
                processResultSection = lunchSection();
                if (processResultCours.getErrors().isEmpty()) {
                    processResultExercice=lunchExerciceFromQuiz();
                }
            }

        }

        return List.of(processResultParcours, processResultCours, processResultSection,processResultExercice);
    }

    @Transactional
    public void cleanData() {
        exerciceDao.deleteAll();
        quizDao.deleteAll();
        questionDao.deleteAll();
        typeQuestionDao.deleteAll();
        sectionItemDao.deleteAll();
        sectionDao.deleteAll();
        coursDao.deleteAll();
        parcoursDao.deleteAll();
        langueDao.deleteAll();
        roleUserDao.deleteAll();
        userDao.deleteAll();
        roleDao.deleteAll();

    }


    public void lunchQuestion(Quiz quiz) {
        String url = baseUrl + "teacher/question/quiz/ref/" + quiz.getRef();
        QuestionMigration[] questionMigrations = restTemplate.getForObject(url, QuestionMigration[].class);
        int count = 0;
        List<Question> questions = construct(questionMigrations, Question.class);
        if (questionMigrations != null) {
            for (int i = 0; i < questionMigrations.length; i++) {
                Question question = questions.get(i);
                QuestionMigration questionMigration = questionMigrations[i];
                Question byReferenceEntity = questionService.findByReferenceEntity(question);
                if (byReferenceEntity == null) {
                    question.setQuiz(quizService.findByReferenceEntity(quiz));
                    TypeDeQuestion typeQuestion = new TypeDeQuestion();
                    if (questionMigration.getTypeDeQuestion() != null) {
                        BeanUtils.copyProperties(questionMigration.getTypeDeQuestion(), typeQuestion);
                    }
                    question.setTypeDeQuestion(typeQuestionService.findOrSave(typeQuestion));
                    questionService.create(question);
                    count++;
                }
            }
        }
    }



    public ProcessResult lunchUsers() {
        String url = baseUrl+"users/";
        ProcessResult processResult = new ProcessResult();
        UserMigration[] userMigrations = restTemplate.getForObject(url, UserMigration[].class);
        int count = 0;
        List<User> users = construct(userMigrations, User.class);
        Langue langue;
        Role role;
        if (userMigrations != null) {
            for (int i = 0; i < userMigrations.length; i++) {
                User user = users.get(i);
                UserMigration userMigration = userMigrations[i];
                User byId = userService.findById(user.getId());

                if (byId == null ) {
                    user.setId(null);
                    langue=langueService.findOrSave(user.getLangue());
                    user.setLangue(langue);
                    userService.save(user);
                    String loadedRole=userMigration.getRole();
                    if(loadedRole.equals("STUDENT")){
                        loadedRole="ROLE_STUDENT";
                    } else if (loadedRole.equals("TEACHER")) {
                        loadedRole = "ROLE_TEACHER";
                    }else if (loadedRole.isEmpty()) {
                        loadedRole = "ROLE_ANONYMOUS";
                    } else if (loadedRole.equals("ADMIN")) {
                        loadedRole="ROLE_ADMIN";
                    } else if (loadedRole.equals("ADVERTISER")) {
                        loadedRole="ROLE_ADVERTISER";
                    }
                    role=roleService.findOrSave(new Role(loadedRole));
                    roleUserService.create(new RoleUser(role,user));
                    processResult.getInfos().add(user.getId().toString());
                    count++;
                }
                else {
                    processResult.getErrors().add(user.getId().toString());
                }

            }
        }
        processResult.setCount(count);
        return processResult;
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public ProcessResult lunchExerciceFromQuiz() {
        ProcessResult processResult = new ProcessResult();
        String url = baseUrl + "teacher/quiz/";
        QuizMigration[] quizMigrations = restTemplate.getForObject(url, QuizMigration[].class);
        int count = 0;
        ContentType contentType = contentTypeService.findOrSave(new ContentType("quiz"));
        List<Quiz> quizzes = constructQuiz(quizMigrations);

        if (quizMigrations != null) {
            for (int i = 0; i < quizMigrations.length; i++) {
                Quiz quiz = quizzes.get(i);
                quiz.setId(null);
                QuizMigration quizMigration = quizMigrations[i];
                Exercice exercice = transform(quiz, Exercice.class);
                exercice.setSection(sectionService.findByCode("SECTION-"+quizMigration.getSection().getId()));
                exercice.setContent(quiz.getLib());
                exercice.setContentType(contentType);
                quizService.save(quiz);
                exercice.setQuiz(quizService.findByReferenceEntity(quiz));
                exerciceService.create(exercice);
                lunchQuestion(quiz);
                processResult.getInfos().add(quiz.getRef());
                count++;

            }
        }
        processResult.setCount(count);
        return processResult;
    }

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

    public ProcessResult lunchSection() {
        ProcessResult processResult = new ProcessResult();
        Cours cours;
        String url = baseUrl + "teacher/sections/";
        String urlSectionItem = baseUrl + "teacher/sectionitem/id/";

        SectionMigration[] sectionMigrations = restTemplate.getForObject(url, SectionMigration[].class);
        int count = 0;
        List<Section> sections = constructSections(sectionMigrations);
        if (sectionMigrations != null) {
            for (int i = 0; i < sectionMigrations.length; i++) {
                Section section = sections.get(i);
                SectionMigration sectionMigration = sectionMigrations[i];
                section.setCode("SECTION-" + sectionMigration.getId());
                Section byReferenceEntity = sectionService.findByReferenceEntity(section);


                if (byReferenceEntity == null) {
                    List<Exercice> exercices = constructExercices(sectionMigration);
                    cours=coursService.findByCode("COURS-"+sectionMigration.getCours().getId());
                    section.setCours(cours);
                    section.setExercices(exercices);
                    sectionService.create(section);

                    SectionItemMigration[] sectionItemMigrations = restTemplate.getForObject(urlSectionItem+section.getId(), SectionItemMigration[].class);
                    List<SectionItem> sectionItems=construct(sectionItemMigrations, SectionItem.class);
                    if (sectionItemMigrations != null) {
                        for (int j = 0; j < sectionItemMigrations.length; j++) {
                            SectionItem sectionItem=sectionItems.get(j);
                            sectionItem.setSection(sectionService.findByReferenceEntity(section));
                            sectionItemService.create(sectionItem);
                        }
                    }


                    processResult.getInfos().add(section.getCode());
                    count++;
                } else {
                    processResult.getErrors().add(section.getCode());
                }
            }
        }
        System.out.println("les section migre: " + count);
        processResult.setCount(count);

        return processResult;
    }

    public ProcessResult lunchParcours() {
        String url = baseUrl + "parcours/";
        ProcessResult processResult = new ProcessResult();
        int count = 0;
        try {
            ParcoursMigration[] parcoursMigrations = restTemplate.getForObject(url, ParcoursMigration[].class);
            if (parcoursMigrations != null) {
                // List<Parcours> parcoursList = constructParcours(parcoursMigrations);
                List<Parcours> parcoursList = construct(parcoursMigrations, Parcours.class);

                for (int i = 0; i < parcoursMigrations.length; i++) {
                    ParcoursMigration parcoursMigration = parcoursMigrations[i];
                    Parcours parcours = parcoursList.get(i);
                    parcours.setCode("PARCOURS-" + parcoursMigration.getId());
                    Parcours byReferenceEntity = parcoursService.findByReferenceEntity(parcours);
                    if (byReferenceEntity == null) {
                        parcoursService.create(parcours);
                        processResult.getInfos().add(parcours.getCode());
                        count++;
                    } else {
                        processResult.getErrors().add(parcours.getCode());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("les parcous migre: " + count);
        processResult.setCount(count);

        return processResult;
    }
    public ProcessResult lunchCours() {
        String url = baseUrl + "student/course/";
        ProcessResult processResult = new ProcessResult();
        Parcours parcours ;
        int count = 0;
        CoursMigration[] coursMigrations = restTemplate.getForObject(url, CoursMigration[].class);
        if (coursMigrations != null) {
            List<Cours> coursList = constructCours(coursMigrations);

            for (int i = 0; i < coursMigrations.length; i++) {
                Cours cours = coursList.get(i);
                CoursMigration coursMigration = coursMigrations[i];
                cours.setCode("COURS-" + coursMigration.getId());
                Cours byReferenceEntity = coursService.findByReferenceEntity(cours);
                if (byReferenceEntity == null) {
                    parcours=parcoursService.findByCode("PARCOURS-"+coursMigration.getParcours().getId());
                    cours.setParcours(parcours);
                    coursService.create(cours);
                    processResult.getInfos().add(cours.getCode());
                    count++;
                } else {
                    processResult.getErrors().add(cours.getCode());
                }
            }
        }
        System.out.println("les cous migre: " + count);
        processResult.setCount(count);
        return processResult;
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
            ContentType image = contentTypeService.findOrSave(new ContentType("image"));
            ContentType video = contentTypeService.findOrSave(new ContentType("video"));

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
    @Autowired
    private TypeDeQuestionAdminService typeQuestionService;
    @Autowired
    private UserService userService;
    @Autowired
    private LangueAdminService langueService;
    @Autowired
    private SectionItemAdminService sectionItemService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private RoleUserService roleUserService;

    @Autowired
    private TypeDeQuestionDao typeQuestionDao;
    @Autowired
    private QuestionDao questionDao;
    @Autowired
    private ExerciceDao exerciceDao;
    @Autowired
    private QuizDao quizDao;
    @Autowired
    private CoursDao coursDao;
    @Autowired
    private ParcoursDao parcoursDao;
    @Autowired
    private SectionDao sectionDao;
    @Autowired
    private SectionItemDao sectionItemDao;


}
