package ma.zs.alc;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.bean.core.common.ClassAverageBonus;
import ma.zs.alc.bean.core.common.Contact;
import ma.zs.alc.bean.core.common.News;
import ma.zs.alc.bean.core.course.*;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.bean.core.courseref.LevelTestConfiguration;
import ma.zs.alc.bean.core.faq.Faq;
import ma.zs.alc.bean.core.faq.FaqEtudiant;
import ma.zs.alc.bean.core.faq.FaqProf;
import ma.zs.alc.bean.core.faq.FaqType;
import ma.zs.alc.bean.core.freetrial.*;
import ma.zs.alc.bean.core.grpe.*;
import ma.zs.alc.bean.core.homework.*;
import ma.zs.alc.bean.core.inscription.Dictionary;
import ma.zs.alc.bean.core.inscriptionref.*;
import ma.zs.alc.bean.core.learning.SessionCours;
import ma.zs.alc.bean.core.pack.PackStudent;
import ma.zs.alc.bean.core.paiement.Paiement;
import ma.zs.alc.bean.core.price.Price;
import ma.zs.alc.bean.core.prof.*;
import ma.zs.alc.bean.core.quiz.Question;
import ma.zs.alc.bean.core.quiz.Quiz;
import ma.zs.alc.bean.core.quiz.Reponse;
import ma.zs.alc.bean.core.quizetudiant.QuizEtudiant;
import ma.zs.alc.bean.core.quizetudiant.ReponseEtudiant;
import ma.zs.alc.bean.core.quizref.TypeDeQuestion;
import ma.zs.alc.bean.core.recomrecla.*;
import ma.zs.alc.bean.core.review.ProfReview;
import ma.zs.alc.bean.core.salary.Salary;
import ma.zs.alc.bean.core.salary.WorkloadBonus;
import ma.zs.alc.bean.core.salary.WorkloadBonusProf;
import ma.zs.alc.bean.core.vocab.Vocabulary;
import ma.zs.alc.service.facade.admin.collab.PackageCollaboratorAdminService;
import ma.zs.alc.service.facade.admin.common.ClassAverageBonusAdminService;
import ma.zs.alc.service.facade.admin.common.ContactAdminService;
import ma.zs.alc.service.facade.admin.common.NewsAdminService;
import ma.zs.alc.service.facade.admin.course.*;
import ma.zs.alc.service.facade.admin.courseref.ContentTypeAdminService;
import ma.zs.alc.service.facade.admin.courseref.LevelTestConfigurationAdminService;
import ma.zs.alc.service.facade.admin.faq.FaqAdminService;
import ma.zs.alc.service.facade.admin.faq.FaqEtudiantAdminService;
import ma.zs.alc.service.facade.admin.faq.FaqProfAdminService;
import ma.zs.alc.service.facade.admin.faq.FaqTypeAdminService;
import ma.zs.alc.service.facade.admin.freetrial.*;
import ma.zs.alc.service.facade.admin.grpe.*;
import ma.zs.alc.service.facade.admin.homework.*;
import ma.zs.alc.service.facade.admin.inscription.DictionaryAdminService;
import ma.zs.alc.service.facade.admin.inscriptionref.*;
import ma.zs.alc.service.facade.admin.learning.SessionCoursAdminService;
import ma.zs.alc.service.facade.admin.pack.PackStudentAdminService;
import ma.zs.alc.service.facade.admin.paiement.PaiementAdminService;
import ma.zs.alc.service.facade.admin.price.PriceAdminService;
import ma.zs.alc.service.facade.admin.prof.*;
import ma.zs.alc.service.facade.admin.quiz.QuestionAdminService;
import ma.zs.alc.service.facade.admin.quiz.QuizAdminService;
import ma.zs.alc.service.facade.admin.quiz.ReponseAdminService;
import ma.zs.alc.service.facade.admin.quizetudiant.QuizEtudiantAdminService;
import ma.zs.alc.service.facade.admin.quizetudiant.ReponseEtudiantAdminService;
import ma.zs.alc.service.facade.admin.quizref.TypeDeQuestionAdminService;
import ma.zs.alc.service.facade.admin.recomrecla.*;
import ma.zs.alc.service.facade.admin.review.ProfReviewAdminService;
import ma.zs.alc.service.facade.admin.salary.SalaryAdminService;
import ma.zs.alc.service.facade.admin.salary.WorkloadBonusAdminService;
import ma.zs.alc.service.facade.admin.salary.WorkloadBonusProfAdminService;
import ma.zs.alc.service.facade.admin.vocab.VocabularyAdminService;
import ma.zs.alc.zynerator.security.bean.*;
import ma.zs.alc.zynerator.security.common.AuthoritiesConstants;
import ma.zs.alc.zynerator.security.service.facade.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.client.RestTemplate;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
//@EnableFeignClients
@EnableScheduling
public class AlcApplication {
    @Autowired
    private PackageCollaboratorAdminService packageCollaboratorAdminService;

    public static ConfigurableApplicationContext ctx;
    @Value("${engflexy.front.url}")
    private String FRONT_URL;

    public static void main(String[] args) {
        ctx = SpringApplication.run(AlcApplication.class, args);
    }


    @Bean
    RestTemplate restTemplate() {
        return new RestTemplate();
    }

    @Bean
    ObjectMapper objectMapper() {
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.disable(SerializationFeature.FAIL_ON_EMPTY_BEANS);
        objectMapper.registerModule(new JavaTimeModule());
        return objectMapper;
    }

    public static ConfigurableApplicationContext getCtx() {
        return ctx;
    }

    @Bean
    public CommandLineRunner demo(UserService userService, RoleService roleService, ModelPermissionService modelPermissionService, ActionPermissionService actionPermissionService, ModelPermissionUserService modelPermissionUserService) {
        return (args) -> {
            if (false) {
                PackageCollaborator p = new PackageCollaborator();
                p.setLibelle("default package");
                p.setNbrStudentBase(BigDecimal.valueOf(8));
                p.setPriceBase(BigDecimal.valueOf(800));
                p.setPriceBannerAd(BigDecimal.valueOf(10));
                p.setPriceColor(BigDecimal.valueOf(8));
                p.setPriceColorOld(BigDecimal.valueOf(14));
                p.setPriceLogo(BigDecimal.valueOf(20));
                packageCollaboratorAdminService.create(p);

                ContentType type0 = new ContentType("IMAGE", "Image");
                ContentType type1 = new ContentType("MULTI_IMAGE", "Multi-Image");
                ContentType type2 = new ContentType("VIDEO", "Video");
                ContentType type3 = new ContentType("CONTENT", "Content");
                ContentType type4 = new ContentType("QUIZ", "Quiz");
                contentTypeService.create(type0);
                contentTypeService.create(type1);
                contentTypeService.create(type2);
                contentTypeService.create(type3);
                contentTypeService.create(type4);
            }
            if (false) {
            createContentType();
            createPaiement();
            createStatutSocial();
            createHomeWorkEtudiant();
            createQuiz();
            createReponse();
            createProfReview();
            createNews();
            createSkill();
            createInteretEtudiant();
            createLangue();
            createWorkloadBonusProf();
            createPackStudent();
            createSectionItem();
            createEtatInscription();
            createScheduleProf();
            createExercice();
            createFreeTrialConfiguration();
            createFreeTrialformule();
            createFaqEtudiant();
            createFreeTrial();
            createInviteStudent();
            createParcours();
            createDictionary();
            createClassAverageBonus();
            createFreeTrialTeacherWhatsTemplate();
            createStatutFreeTrial();
            createWorkloadBonus();
            createTeacherLocality();
            createServices();
            createHomeWorkQuestion();
            createSalary();
            createTypeReclamationEtudiant();
            createGroupeEtat();
            createReponseEtudiant();
            createHoweWorkQSTReponse();
            createSection();
            createEtudiantReview();
            createQuestion();
            createCategorieProf();
            createRecommendTeacher();
            createInscription();
            createFaqType();
            createFonction();
            createNiveauEtude();
            createTypeHomeWork();
            createVocabulary();
            createReclamationProf();
            createReponseEtudiantHomeWork();
            createFreeTrialDetail();
            createQuizEtudiant();
            createGroupeType();
            createFreeTrialTeacherEmailTemplate();
            createCours();
            createSessionCours();
            createLevelTestConfiguration();
            createPrice();
            createFaqProf();
            createClassAverageBonusProf();
            createFreeTrialStudentWhatsTemplate();
            createHomeWork();
            createReclamationEtudiant();
            createConfirmationToken();
            createTypeTeacher();
            createTrancheHoraireProf();
            createFreeTrialStudentEmailTemplate();
            createGroupeEtude();
            createTypeDeQuestion();
            createFaq();
            createGroupeEtudiant();
            createContact();
            createTypeReclamationProf();

                // ModelPermissions
                List<ModelPermission> modelPermissions = new ArrayList<>();
                addPermission(modelPermissions);
                modelPermissions.forEach(e -> modelPermissionService.create(e));
                // ActionPermissions
                List<ActionPermission> actionPermissions = new ArrayList<>();
                addActionPermission(actionPermissions);
                actionPermissions.forEach(e -> actionPermissionService.create(e));


                // User Admin
                User userForAdmin = new User("admin");
                userForAdmin.setPassword("123");
                // Role Admin
                Role roleForAdmin = new Role();
                roleForAdmin.setAuthority(AuthoritiesConstants.ADMIN);
                roleForAdmin.setCreatedAt(LocalDateTime.now());
                Role savedRoleForAdmin = roleService.create(roleForAdmin);
                RoleUser roleUserForAdmin = new RoleUser();
                roleUserForAdmin.setRole(savedRoleForAdmin);
                if (userForAdmin.getRoleUsers() == null) userForAdmin.setRoleUsers(new ArrayList<>());

                userForAdmin.getRoleUsers().add(roleUserForAdmin);
                if (userForAdmin.getModelPermissionUsers() == null)
                    userForAdmin.setModelPermissionUsers(new ArrayList<>());


                userForAdmin.setModelPermissionUsers(modelPermissionUserService.initModelPermissionUser());

                userService.create(userForAdmin);

                // User Collaborator
                User userForCollaborator = new User("collaborator");
                userForCollaborator.setPassword("123");
                // Role Collaborator
                Role roleForCollaborator = new Role();
                roleForCollaborator.setAuthority(AuthoritiesConstants.COLLABORATOR);
                roleForCollaborator.setCreatedAt(LocalDateTime.now());
                Role savedRoleForCollaborator = roleService.create(roleForCollaborator);
                RoleUser roleUserForCollaborator = new RoleUser();
                roleUserForCollaborator.setRole(savedRoleForCollaborator);
                if (userForCollaborator.getRoleUsers() == null) userForCollaborator.setRoleUsers(new ArrayList<>());
                userForCollaborator.getRoleUsers().add(roleUserForCollaborator);
                if (userForCollaborator.getModelPermissionUsers() == null)
                    userForCollaborator.setModelPermissionUsers(new ArrayList<>());


                userForCollaborator.setModelPermissionUsers(modelPermissionUserService.initModelPermissionUser());

                userService.create(userForCollaborator);

            }
        };
    }


    private void createContentType() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            ContentType item = new ContentType();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            contentTypeService.create(item);
        }
    }

    private void createPaiement() {
        String datePaiement = "datePaiement";
        for (int i = 1; i < 100; i++) {
            Paiement item = new Paiement();
            item.setDatePaiement(fakeLocalDateTime(datePaiement, i));
            paiementService.create(item);
        }
    }

    private void createStatutSocial() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            StatutSocial item = new StatutSocial();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            statutSocialService.create(item);
        }
    }

    private void createHomeWorkEtudiant() {
        String note = "note";
        String resultat = "resultat";
        String dateHomeWork = "dateHomeWork";
        for (int i = 1; i < 100; i++) {
            HomeWorkEtudiant item = new HomeWorkEtudiant();
            item.setNote(fakeBigDecimal(note, i));
            item.setResultat(fakeString(resultat, i));
            item.setDateHomeWork(fakeLocalDateTime(dateHomeWork, i));
            homeWorkEtudiantService.create(item);
        }
    }

    private void createQuiz() {
        String ref = "ref";
        String lib = "lib";
        String dateDebut = "dateDebut";
        String dateFin = "dateFin";
        String numero = "numero";
        String seuilReussite = "seuilReussite";
        for (int i = 1; i < 100; i++) {
            Quiz item = new Quiz();
            item.setRef(fakeString(ref, i));
            item.setLib(fakeString(lib, i));
            item.setDateDebut(fakeLocalDateTime(dateDebut, i));
            item.setDateFin(fakeLocalDateTime(dateFin, i));
            item.setNumero(fakeLong(numero, i));
            item.setSeuilReussite(fakeLong(seuilReussite, i));
            quizService.create(item);
        }
    }

    private void createReponse() {
        String ref = "ref";
        String lib = "lib";
        String etatReponse = "etatReponse";
        String numero = "numero";
        for (int i = 1; i < 100; i++) {
            Reponse item = new Reponse();
            item.setRef(fakeString(ref, i));
            item.setLib(fakeString(lib, i));
            item.setEtatReponse(true);
            item.setNumero(fakeLong(numero, i));
            reponseService.create(item);
        }
    }

    private void createProfReview() {
        String review = "review";
        String comment = "comment";
        String dateReview = "dateReview";
        for (int i = 1; i < 100; i++) {
            ProfReview item = new ProfReview();
            item.setReview(fakeInteger(review, i));
            item.setComment(fakeString(comment, i));
            item.setDateReview(fakeLocalDateTime(dateReview, i));
            profReviewService.create(item);
        }
    }

    private void createNews() {
        String ref = "ref";
        String libelle = "libelle";
        String image = "image";
        String description = "description";
        String dateNews = "dateNews";
        String dateDebut = "dateDebut";
        String dateFin = "dateFin";
        String numeroOrdre = "numeroOrdre";
        String destinataire = "destinataire";
        for (int i = 1; i < 100; i++) {
            News item = new News();
            item.setRef(fakeString(ref, i));
            item.setLibelle(fakeString(libelle, i));
            item.setImage(fakeString(image, i));
            item.setDescription(fakeString(description, i));
            item.setDateNews(fakeLocalDateTime(dateNews, i));
            item.setDateDebut(fakeLocalDateTime(dateDebut, i));
            item.setDateFin(fakeLocalDateTime(dateFin, i));
            item.setNumeroOrdre(fakeInteger(numeroOrdre, i));
            item.setDestinataire(fakeString(destinataire, i));
            newsService.create(item);
        }
    }

    private void createSkill() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            Skill item = new Skill();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            skillService.create(item);
        }
    }

    private void createInteretEtudiant() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            InteretEtudiant item = new InteretEtudiant();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            interetEtudiantService.create(item);
        }
    }

    private void createLangue() {
        String ref = "ref";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            Langue item = new Langue();
            item.setRef(fakeString(ref, i));
            item.setLibelle(fakeString(libelle, i));
            langueService.create(item);
        }
    }

    private void createWorkloadBonusProf() {
        String mois = "mois";
        String annee = "annee";
        for (int i = 1; i < 100; i++) {
            WorkloadBonusProf item = new WorkloadBonusProf();
            item.setMois(fakeInteger(mois, i));
            item.setAnnee(fakeInteger(annee, i));
            workloadBonusProfService.create(item);
        }
    }

    private void createPackStudent() {
        String nombreCours = "nombreCours";
        String forGroupe = "forGroupe";
        String code = "code";
        String libelle = "libelle";
        String description = "description";
        String preRequisites = "preRequisites";
        String whyTakeThisCourse = "whyTakeThisCourse";
        String expectations = "expectations";
        String imgUrl = "imgUrl";
        String totalStudents = "totalStudents";
        String rating = "rating";
        String oldPrice = "oldPrice";
        for (int i = 1; i < 100; i++) {
            PackStudent item = new PackStudent();
            item.setNombreCours(fakeInteger(nombreCours, i));
            item.setForGroupe(fakeBoolean(forGroupe, i));
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            item.setDescription(fakeString(description, i));
            item.setPreRequisites(fakeString(preRequisites, i));
            item.setWhyTakeThisCourse(fakeString(whyTakeThisCourse, i));
            item.setExpectations(fakeString(expectations, i));
            item.setImgUrl(fakeString(imgUrl, i));
            item.setTotalStudents(fakeInteger(totalStudents, i));
            item.setRating(fakeString(rating, i));
            item.setOldPrice(fakeString(oldPrice, i));
            packStudentService.create(item);
        }
    }

    private void createSectionItem() {
        String imageUrl = "imageUrl";
        String response = "response";
        String transcription = "transcription";
        String translation = "translation";
        String explanation = "explanation";
        String example = "example";
        String synonyms = "synonyms";
        for (int i = 1; i < 100; i++) {
            SectionItem item = new SectionItem();
            item.setImageUrl(fakeString(imageUrl, i));
            item.setResponse(fakeString(response, i));
            item.setTranscription(fakeString(transcription, i));
            item.setTranslation(fakeString(translation, i));
            item.setExplanation(fakeString(explanation, i));
            item.setExample(fakeString(example, i));
            item.setSynonyms(fakeString(synonyms, i));
            sectionItemService.create(item);
        }
    }

    private void createEtatInscription() {
        String ref = "ref";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            EtatInscription item = new EtatInscription();
            item.setRef(fakeString(ref, i));
            item.setLibelle(fakeString(libelle, i));
            etatInscriptionService.create(item);
        }
    }

    private void createScheduleProf() {
        String subject = "subject";
        String startTime = "startTime";
        String endTime = "endTime";
        String ref = "ref";
        String grpName = "grpName";
        String profName = "profName";
        String profsId = "profsId";
        String courseFinished = "courseFinished";
        for (int i = 1; i < 100; i++) {
            ScheduleProf item = new ScheduleProf();
            item.setSubject(fakeString(subject, i));
            item.setStartTime(fakeLocalDateTime(startTime, i));
            item.setEndTime(fakeLocalDateTime(endTime, i));
            item.setRef(fakeString(ref, i));
            item.setGrpName(fakeString(grpName, i));
            item.setProfName(fakeString(profName, i));
            item.setProfsId(fakeLong(profsId, i));
            item.setCourseFinished(fakeBoolean(courseFinished, i));
            scheduleProfService.create(item);
        }
    }

    private void createExercice() {
        String content = "content";
        String description = "description";
        String libelle = "libelle";
        String numero = "numero";
        for (int i = 1; i < 100; i++) {
            Exercice item = new Exercice();
            item.setContent(fakeString(content, i));
            item.setDescription(fakeString(description, i));
            item.setLibelle(fakeString(libelle, i));
            item.setNumero(fakeLong(numero, i));
            exerciceService.create(item);
        }
    }

    private void createFreeTrialConfiguration() {
        String dateApplicationDebut = "dateApplicationDebut";
        String dateApplicationFin = "dateApplicationFin";
        String nombreStudentMax = "nombreStudentMax";
        String nombreStudentMin = "nombreStudentMin";
        for (int i = 1; i < 100; i++) {
            FreeTrialConfiguration item = new FreeTrialConfiguration();
            item.setDateApplicationDebut(fakeLocalDateTime(dateApplicationDebut, i));
            item.setDateApplicationFin(fakeLocalDateTime(dateApplicationFin, i));
            item.setNombreStudentMax(fakeInteger(nombreStudentMax, i));
            item.setNombreStudentMin(fakeInteger(nombreStudentMin, i));
            freeTrialConfigurationService.create(item);
        }
    }

    private void createFreeTrialformule() {
        String code = "code";
        String dayspeerweek = "dayspeerweek";
        String timeperday = "timeperday";
        String teacherGenderoption = "teacherGenderoption";
        String teacherAgeRange = "teacherAgeRange";
        String teacherPersonnality = "teacherPersonnality";
        String status = "status";
        String dateConfirmation = "dateConfirmation";
        for (int i = 1; i < 100; i++) {
            FreeTrialformule item = new FreeTrialformule();
            item.setCode(fakeString(code, i));
            item.setDayspeerweek(fakeString(dayspeerweek, i));
            item.setTimeperday(fakeString(timeperday, i));
            item.setTeacherGenderoption(fakeString(teacherGenderoption, i));
            item.setTeacherAgeRange(fakeString(teacherAgeRange, i));
            item.setTeacherPersonnality(fakeString(teacherPersonnality, i));
            item.setStatus(fakeBoolean(status, i));
            item.setDateConfirmation(fakeLocalDateTime(dateConfirmation, i));
            freeTrialformuleService.create(item);
        }
    }

    private void createFaqEtudiant() {
        String description = "description";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            FaqEtudiant item = new FaqEtudiant();
            item.setDescription(fakeString(description, i));
            item.setLibelle(fakeString(libelle, i));
            faqEtudiantService.create(item);
        }
    }

    private void createFreeTrial() {
        String reference = "reference";
        String dateFreeTrial = "dateFreeTrial";
        String link = "link";
        String emailTeacherSent = "emailTeacherSent";
        String emailTeacherSendingDate = "emailTeacherSendingDate";
        String whatsTeacherSent = "whatsTeacherSent";
        String whatsTeacherSendingDate = "whatsTeacherSendingDate";
        String dateFreeTrialPremierRappel = "dateFreeTrialPremierRappel";
        String dateFreeTrialPremierDeuxiemeRappel = "dateFreeTrialPremierDeuxiemeRappel";
        String nombreStudentTotal = "nombreStudentTotal";
        String nombreStudentAbonne = "nombreStudentAbonne";
        String nombreStudentPresent = "nombreStudentPresent";
        for (int i = 1; i < 100; i++) {
            FreeTrial item = new FreeTrial();
            item.setReference(fakeString(reference, i));
            item.setDateFreeTrial(fakeLocalDateTime(dateFreeTrial, i));
            item.setLink(fakeString(link, i));
            item.setEmailTeacherSent(fakeBoolean(emailTeacherSent, i));
            item.setEmailTeacherSendingDate(fakeLocalDateTime(emailTeacherSendingDate, i));
            item.setWhatsTeacherSent(fakeBoolean(whatsTeacherSent, i));
            item.setWhatsTeacherSendingDate(fakeLocalDateTime(whatsTeacherSendingDate, i));
            item.setDateFreeTrialPremierRappel(fakeLocalDateTime(dateFreeTrialPremierRappel, i));
            item.setDateFreeTrialPremierDeuxiemeRappel(fakeLocalDateTime(dateFreeTrialPremierDeuxiemeRappel, i));
            item.setNombreStudentTotal(fakeInteger(nombreStudentTotal, i));
            item.setNombreStudentAbonne(fakeInteger(nombreStudentAbonne, i));
            item.setNombreStudentPresent(fakeInteger(nombreStudentPresent, i));
            freeTrialService.create(item);
        }
    }

    private void createInviteStudent() {
        String code = "code";
        String isAccepted = "isAccepted";
        String isPaidPack = "isPaidPack";
        String emailInvited = "emailInvited";
        String dateSentInvitation = "dateSentInvitation";
        String dateAcceptInvitation = "dateAcceptInvitation";
        String datePayPack = "datePayPack";
        for (int i = 1; i < 100; i++) {
            InviteStudent item = new InviteStudent();
            item.setCode(fakeString(code, i));
            item.setIsAccepted(fakeBoolean(isAccepted, i));
            item.setIsPaidPack(fakeBoolean(isPaidPack, i));
            item.setEmailInvited(fakeString(emailInvited, i));
            item.setDateSentInvitation(fakeLocalDateTime(dateSentInvitation, i));
            item.setDateAcceptInvitation(fakeLocalDateTime(dateAcceptInvitation, i));
            item.setDatePayPack(fakeLocalDateTime(datePayPack, i));
            inviteStudentService.create(item);
        }
    }

    private void createParcours() {
        String datePublication = "datePublication";
        String dateCreation = "dateCreation";
        String description = "description";
        String code = "code";
        String libelle = "libelle";
        String numeroOrder = "numeroOrder";
        String nombreCours = "nombreCours";
        for (int i = 1; i < 100; i++) {
            Parcours item = new Parcours();
            item.setDatePublication(fakeLocalDateTime(datePublication, i));
            item.setDateCreation(fakeLocalDateTime(dateCreation, i));
            item.setDescription(fakeString(description, i));
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            item.setNumeroOrder(fakeInteger(numeroOrder, i));
            item.setNombreCours(fakeInteger(nombreCours, i));
            parcoursService.create(item);
        }
    }

    private void createDictionary() {
        String word = "word";
        String definition = "definition";
        String learned = "learned";
        String createdOn = "createdOn";
        for (int i = 1; i < 100; i++) {
            Dictionary item = new Dictionary();
            item.setWord(fakeString(word, i));
            item.setDefinition(fakeString(definition, i));
            item.setLearned(fakeBoolean(learned, i));
            item.setCreatedOn(fakeLocalDateTime(createdOn, i));
            dictionaryService.create(item);
        }
    }

    private void createClassAverageBonus() {
        String code = "code";
        String nombreSession = "nombreSession";
        String prix = "prix";
        for (int i = 1; i < 100; i++) {
            ClassAverageBonus item = new ClassAverageBonus();
            item.setCode(fakeString(code, i));
            item.setNombreSession(fakeInteger(nombreSession, i));
            item.setPrix(fakeBigDecimal(prix, i));
            classAverageBonusService.create(item);
        }
    }

    private void createFreeTrialTeacherWhatsTemplate() {
        String object = "object";
        String corps = "corps";
        String source = "source";
        for (int i = 1; i < 100; i++) {
            FreeTrialTeacherWhatsTemplate item = new FreeTrialTeacherWhatsTemplate();
            item.setObject(fakeString(object, i));
            item.setCorps(fakeString(corps, i));
            item.setSource(fakeString(source, i));
            freeTrialTeacherWhatsTemplateService.create(item);
        }
    }

    private void createStatutFreeTrial() {
        String libelle = "libelle";
        String code = "code";
        String style = "style";
        for (int i = 1; i < 100; i++) {
            StatutFreeTrial item = new StatutFreeTrial();
            item.setLibelle(fakeString(libelle, i));
            item.setCode(fakeString(code, i));
            item.setStyle(fakeString(style, i));
            statutFreeTrialService.create(item);
        }
    }

    private void createWorkloadBonus() {
        String code = "code";
        String nombreSession = "nombreSession";
        String prix = "prix";
        for (int i = 1; i < 100; i++) {
            WorkloadBonus item = new WorkloadBonus();
            item.setCode(fakeString(code, i));
            item.setNombreSession(fakeInteger(nombreSession, i));
            item.setPrix(fakeBigDecimal(prix, i));
            workloadBonusService.create(item);
        }
    }

    private void createTeacherLocality() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            TeacherLocality item = new TeacherLocality();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            teacherLocalityService.create(item);
        }
    }

    private void createServices() {
        String code = "code";
        String libelle = "libelle";
        String description = "description";
        for (int i = 1; i < 100; i++) {
            Services item = new Services();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            item.setDescription(fakeString(description, i));
            servicesService.create(item);
        }
    }

    private void createHomeWorkQuestion() {
        String ref = "ref";
        String libelle = "libelle";
        String numero = "numero";
        String pointReponseJuste = "pointReponseJuste";
        String pointReponsefausse = "pointReponsefausse";
        for (int i = 1; i < 100; i++) {
            HomeWorkQuestion item = new HomeWorkQuestion();
            item.setRef(fakeString(ref, i));
            item.setLibelle(fakeString(libelle, i));
            item.setNumero(fakeInteger(numero, i));
            item.setPointReponseJuste(fakeBigDecimal(pointReponseJuste, i));
            item.setPointReponsefausse(fakeBigDecimal(pointReponsefausse, i));
            homeWorkQuestionService.create(item);
        }
    }

    private void createSalary() {
        String code = "code";
        String mois = "mois";
        String annee = "annee";
        String nbrSessionMensuel = "nbrSessionMensuel";
        String payer = "payer";
        String totalPayment = "totalPayment";
        String totalBonusClassAverage = "totalBonusClassAverage";
        String totalBonusWorkload = "totalBonusWorkload";
        for (int i = 1; i < 100; i++) {
            Salary item = new Salary();
            item.setCode(fakeString(code, i));
            item.setMois(fakeInteger(mois, i));
            item.setAnnee(fakeInteger(annee, i));
            item.setNbrSessionMensuel(fakeBigDecimal(nbrSessionMensuel, i));
            item.setPayer(fakeBoolean(payer, i));
            item.setTotalPayment(fakeBigDecimal(totalPayment, i));
            item.setTotalBonusClassAverage(fakeBigDecimal(totalBonusClassAverage, i));
            item.setTotalBonusWorkload(fakeBigDecimal(totalBonusWorkload, i));
            salaryService.create(item);
        }
    }

    private void createTypeReclamationEtudiant() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            TypeReclamationEtudiant item = new TypeReclamationEtudiant();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            typeReclamationEtudiantService.create(item);
        }
    }

    private void createGroupeEtat() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            GroupeEtat item = new GroupeEtat();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            groupeEtatService.create(item);
        }
    }

    private void createReponseEtudiant() {
        String ref = "ref";
        String answer = "answer";
        String note = "note";
        for (int i = 1; i < 100; i++) {
            ReponseEtudiant item = new ReponseEtudiant();
            item.setRef(fakeString(ref, i));
            item.setAnswer(fakeString(answer, i));
            item.setNote(fakeBigDecimal(note, i));
            reponseEtudiantService.create(item);
        }
    }

    private void createHoweWorkQSTReponse() {
        String ref = "ref";
        String lib = "lib";
        String etatReponse = "etatReponse";
        String numero = "numero";
        for (int i = 1; i < 100; i++) {
            HoweWorkQSTReponse item = new HoweWorkQSTReponse();
            item.setRef(fakeString(ref, i));
            item.setLib(fakeString(lib, i));
            item.setEtatReponse(fakeString(etatReponse, i));
            item.setNumero(fakeInteger(numero, i));
            howeWorkQSTReponseService.create(item);
        }
    }

    private void createSection() {
        String code = "code";
        String libelle = "libelle";
        String description = "description";
        for (int i = 1; i < 100; i++) {
            Section item = new Section();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            item.setDescription(fakeString(description, i));
            sectionService.create(item);
        }
    }

    private void createEtudiantReview() {
        String review = "review";
        String comment = "comment";
        String dateReview = "dateReview";
        for (int i = 1; i < 100; i++) {
            EtudiantReview item = new EtudiantReview();
            item.setReview(fakeInteger(review, i));
            item.setComment(fakeString(comment, i));
            item.setDateReview(fakeLocalDateTime(dateReview, i));
            etudiantReviewService.create(item);
        }
    }

    private void createQuestion() {
        String ref = "ref";
        String libelle = "libelle";
        String urlImg = "urlImg";
        String urlVideo = "urlVideo";
        String numero = "numero";
        String pointReponseJuste = "pointReponseJuste";
        String pointReponsefausse = "pointReponsefausse";
        for (int i = 1; i < 100; i++) {
            Question item = new Question();
            item.setRef(fakeString(ref, i));
            item.setLibelle(fakeString(libelle, i));
            item.setUrlImg(fakeString(urlImg, i));
            item.setUrlVideo(fakeString(urlVideo, i));
            item.setNumero(fakeLong(numero, i));
            item.setPointReponseJuste(fakeBigDecimal(pointReponseJuste, i));
            item.setPointReponsefausse(fakeBigDecimal(pointReponsefausse, i));
            questionService.create(item);
        }
    }

    private void createCategorieProf() {
        String code = "code";
        String level = "level";
        String lessonRate = "lessonRate";
        for (int i = 1; i < 100; i++) {
            CategorieProf item = new CategorieProf();
            item.setCode(fakeString(code, i));
            item.setLevel(fakeString(level, i));
            item.setLessonRate(fakeBigDecimal(lessonRate, i));
            categorieProfService.create(item);
        }
    }

    private void createRecommendTeacher() {
        String ref = "ref";
        String nombrevote = "nombrevote";
        String nom = "nom";
        String prenom = "prenom";
        String commentaire = "commentaire";
        String telephone = "telephone";
        String login = "login";
        String dateRecommamdation = "dateRecommamdation";
        for (int i = 1; i < 100; i++) {
            RecommendTeacher item = new RecommendTeacher();
            item.setRef(fakeString(ref, i));
            item.setNombrevote(fakeInteger(nombrevote, i));
            item.setNom(fakeString(nom, i));
            item.setPrenom(fakeString(prenom, i));
            item.setCommentaire(fakeString(commentaire, i));
            item.setTelephone(fakeString(telephone, i));
            item.setLogin(fakeString(login, i));
            item.setDateRecommamdation(fakeLocalDateTime(dateRecommamdation, i));
            recommendTeacherService.create(item);
        }
    }

    private void createInscription() {
        String numeroInscription = "numeroInscription";
        String noteQuizNiveau = "noteQuizNiveau";
        String quizFinished = "quizFinished";
        String subscriptionFinished = "subscriptionFinished";
        String dateRegistration = "dateRegistration";
        String datedebutinscription = "datedebutinscription";
        String datefininscription = "datefininscription";
        String skype = "skype";
        for (int i = 1; i < 100; i++) {
            Inscription item = new Inscription();
            item.setNumeroInscription(fakeInteger(numeroInscription, i));
            item.setNoteQuizNiveau(fakeBigDecimal(noteQuizNiveau, i));
            item.setQuizFinished(fakeBoolean(quizFinished, i));
            item.setSubscriptionFinished(fakeBoolean(subscriptionFinished, i));
            item.setDateRegistration(fakeString(dateRegistration, i));
            item.setSkype(fakeString(skype, i));
            inscriptionService.create(item);
        }
    }

    private void createFaqType() {
        String destinataire = "destinataire";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            FaqType item = new FaqType();
            item.setDestinataire(fakeString(destinataire, i));
            item.setLibelle(fakeString(libelle, i));
            faqTypeService.create(item);
        }
    }

    private void createFonction() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            Fonction item = new Fonction();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            fonctionService.create(item);
        }
    }

    private void createNiveauEtude() {
        String libelle = "libelle";
        String code = "code";
        for (int i = 1; i < 100; i++) {
            NiveauEtude item = new NiveauEtude();
            item.setLibelle(fakeString(libelle, i));
            item.setCode(fakeString(code, i));
            niveauEtudeService.create(item);
        }
    }

    private void createTypeHomeWork() {
        String code = "code";
        String lib = "lib";
        for (int i = 1; i < 100; i++) {
            TypeHomeWork item = new TypeHomeWork();
            item.setCode(fakeString(code, i));
            item.setLib(fakeString(lib, i));
            typeHomeWorkService.create(item);
        }
    }

    private void createVocabulary() {
        String ref = "ref";
        String numero = "numero";
        String word = "word";
        String libelle = "libelle";
        String result = "result";
        String explication = "explication";
        String exemple = "exemple";
        String image = "image";
        for (int i = 1; i < 100; i++) {
            Vocabulary item = new Vocabulary();
            item.setRef(fakeString(ref, i));
            item.setNumero(fakeLong(numero, i));
            item.setWord(fakeString(word, i));
            item.setLibelle(fakeString(libelle, i));
            item.setResult(fakeString(result, i));
            item.setExplication(fakeString(explication, i));
            item.setExemple(fakeString(exemple, i));
            item.setImage(fakeString(image, i));
            vocabularyService.create(item);
        }
    }

    private void createReclamationProf() {
        String reference = "reference";
        String dateReclamation = "dateReclamation";
        String message = "message";
        String traite = "traite";
        String dateTraitement = "dateTraitement";
        String dateReponse = "dateReponse";
        String postView = "postView";
        String commentaireTraiteur = "commentaireTraiteur";
        String objetReclamationProf = "objetReclamationProf";
        for (int i = 1; i < 100; i++) {
            ReclamationProf item = new ReclamationProf();
            item.setReference(fakeString(reference, i));
            item.setDateReclamation(fakeLocalDateTime(dateReclamation, i));
            item.setMessage(fakeString(message, i));
            item.setTraite(fakeBoolean(traite, i));
            item.setDateTraitement(fakeLocalDateTime(dateTraitement, i));
            item.setDateReponse(fakeLocalDateTime(dateReponse, i));
            item.setPostView(fakeBoolean(postView, i));
            item.setCommentaireTraiteur(fakeString(commentaireTraiteur, i));
            item.setObjetReclamationProf(fakeString(objetReclamationProf, i));
            reclamationProfService.create(item);
        }
    }

    private void createReponseEtudiantHomeWork() {
        String answer = "answer";
        String profNote = "profNote";
        String note = "note";
        for (int i = 1; i < 100; i++) {
            ReponseEtudiantHomeWork item = new ReponseEtudiantHomeWork();
            item.setAnswer(fakeString(answer, i));
            item.setProfNote(fakeString(profNote, i));
            item.setNote(fakeBigDecimal(note, i));
            reponseEtudiantHomeWorkService.create(item);
        }
    }

    private void createFreeTrialDetail() {
        String presence = "presence";
        String whatsUpMessageSent = "whatsUpMessageSent";
        String dateEnvoiwhatsUpMessage = "dateEnvoiwhatsUpMessage";
        String emailMessageSent = "emailMessageSent";
        String dateEnvoiEmailMessage = "dateEnvoiEmailMessage";
        String abonne = "abonne";
        for (int i = 1; i < 100; i++) {
            FreeTrialDetail item = new FreeTrialDetail();
            item.setPresence(fakeBoolean(presence, i));
            item.setWhatsUpMessageSent(fakeBoolean(whatsUpMessageSent, i));
            item.setDateEnvoiwhatsUpMessage(fakeLocalDateTime(dateEnvoiwhatsUpMessage, i));
            item.setEmailMessageSent(fakeBoolean(emailMessageSent, i));
            item.setDateEnvoiEmailMessage(fakeLocalDateTime(dateEnvoiEmailMessage, i));
            item.setAbonne(fakeBoolean(abonne, i));
            freeTrialDetailService.create(item);
        }
    }

    private void createQuizEtudiant() {
        String ref = "ref";
        String note = "note";
        String resultat = "resultat";
        String questionCurrent = "questionCurrent";
        for (int i = 1; i < 100; i++) {
            QuizEtudiant item = new QuizEtudiant();
            item.setRef(fakeString(ref, i));
            item.setNote(fakeBigDecimal(note, i));
            item.setResultat(fakeString(resultat, i));
            item.setQuestionCurrent(fakeLong(questionCurrent, i));
            quizEtudiantService.create(item);
        }
    }

    private void createGroupeType() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            GroupeType item = new GroupeType();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            groupeTypeService.create(item);
        }
    }

    private void createFreeTrialTeacherEmailTemplate() {
        String object = "object";
        String corps = "corps";
        String source = "source";
        for (int i = 1; i < 100; i++) {
            FreeTrialTeacherEmailTemplate item = new FreeTrialTeacherEmailTemplate();
            item.setObject(fakeString(object, i));
            item.setCorps(fakeString(corps, i));
            item.setSource(fakeString(source, i));
            freeTrialTeacherEmailTemplateService.create(item);
        }
    }

    private void createCours() {
        String code = "code";
        String libelle = "libelle";
        String description = "description";
        String image = "image";
        String nombreSectionFinalise = "nombreSectionFinalise";
        String nombreSectionEnCours = "nombreSectionEnCours";
        String nombreLinkEnCours = "nombreLinkEnCours";
        String nombreLinkFinalise = "nombreLinkFinalise";
        String numeroOrder = "numeroOrder";
        for (int i = 1; i < 100; i++) {
            Cours item = new Cours();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            item.setDescription(fakeString(description, i));
            item.setImage(fakeString(image, i));
            item.setNombreSectionFinalise(fakeInteger(nombreSectionFinalise, i));
            item.setNombreSectionEnCours(fakeInteger(nombreSectionEnCours, i));
            item.setNombreLinkEnCours(fakeInteger(nombreLinkEnCours, i));
            item.setNombreLinkFinalise(fakeInteger(nombreLinkFinalise, i));
            item.setNumeroOrder(fakeInteger(numeroOrder, i));
            coursService.create(item);
        }
    }

    private void createSessionCours() {
        String reference = "reference";
        String duree = "duree";
        String totalheure = "totalheure";
        String mois = "mois";
        String annee = "annee";
        String dateFin = "dateFin";
        String dateDebut = "dateDebut";
        String payer = "payer";
        String nreKeySectionFinished = "nreKeySectionFinished";
        String nreAddSectionFinished = "nreAddSectionFinished";
        String totalKeySection = "totalKeySection";
        String totalAddSection = "totalAddSection";
        String nreWords = "nreWords";
        String homeworkFinished = "homeworkFinished";
        String courseFinished = "courseFinished";
        for (int i = 1; i < 100; i++) {
            SessionCours item = new SessionCours();
            item.setReference(fakeString(reference, i));
            item.setDuree(fakeBigDecimal(duree, i));
            item.setTotalheure(fakeBigDecimal(totalheure, i));
            item.setMois(fakeBigDecimal(mois, i));
            item.setAnnee(fakeBigDecimal(annee, i));
            item.setDateFin(fakeLocalDateTime(dateFin, i));
            item.setDateDebut(fakeLocalDateTime(dateDebut, i));
            item.setPayer(fakeBoolean(payer, i));
            item.setNreKeySectionFinished(fakeLong(nreKeySectionFinished, i));
            item.setNreAddSectionFinished(fakeLong(nreAddSectionFinished, i));
            item.setTotalKeySection(fakeLong(totalKeySection, i));
            item.setTotalAddSection(fakeLong(totalAddSection, i));
            item.setNreWords(fakeLong(nreWords, i));
            item.setHomeworkFinished(fakeBoolean(homeworkFinished, i));
            item.setCourseFinished(fakeBoolean(courseFinished, i));
            sessionCoursService.create(item);
        }
    }

    private void createLevelTestConfiguration() {
        String noteMin = "noteMin";
        String noteMax = "noteMax";
        for (int i = 1; i < 100; i++) {
            LevelTestConfiguration item = new LevelTestConfiguration();
            item.setNoteMin(fakeBigDecimal(noteMin, i));
            item.setNoteMax(fakeBigDecimal(noteMax, i));
            levelTestConfigurationService.create(item);
        }
    }

    private void createPrice() {
        String price = "price";
        String oldPrice = "oldPrice";
        String lib = "lib";
        String nreCourse = "nreCourse";
        String nreHours = "nreHours";
        String nreMonth = "nreMonth";
        String forGroup = "forGroup";
        for (int i = 1; i < 100; i++) {
            Price item = new Price();
            item.setPrice(fakeBigDecimal(price, i));
            item.setOldPrice(fakeBigDecimal(oldPrice, i));
            item.setLib(fakeString(lib, i));
            item.setNreCourse(fakeBigDecimal(nreCourse, i));
            item.setNreHours(fakeBigDecimal(nreHours, i));
            item.setNreMonth(fakeBigDecimal(nreMonth, i));
            item.setForGroup(fakeBoolean(forGroup, i));
            priceService.create(item);
        }
    }

    private void createFaqProf() {
        String description = "description";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            FaqProf item = new FaqProf();
            item.setDescription(fakeString(description, i));
            item.setLibelle(fakeString(libelle, i));
            faqProfService.create(item);
        }
    }

    private void createClassAverageBonusProf() {
        String mois = "mois";
        String annee = "annee";
        for (int i = 1; i < 100; i++) {
            ClassAverageBonusProf item = new ClassAverageBonusProf();
            item.setMois(fakeInteger(mois, i));
            item.setAnnee(fakeInteger(annee, i));
            classAverageBonusProfService.create(item);
        }
    }

    private void createFreeTrialStudentWhatsTemplate() {
        String object = "object";
        String corps = "corps";
        String source = "source";
        for (int i = 1; i < 100; i++) {
            FreeTrialStudentWhatsTemplate item = new FreeTrialStudentWhatsTemplate();
            item.setObject(fakeString(object, i));
            item.setCorps(fakeString(corps, i));
            item.setSource(fakeString(source, i));
            freeTrialStudentWhatsTemplateService.create(item);
        }
    }

    private void createHomeWork() {
        String libelle = "libelle";
        String urlImage = "urlImage";
        String urlVideo = "urlVideo";
        for (int i = 1; i < 100; i++) {
            HomeWork item = new HomeWork();
            item.setLibelle(fakeString(libelle, i));
            item.setUrlImage(fakeString(urlImage, i));
            item.setUrlVideo(fakeString(urlVideo, i));
            homeWorkService.create(item);
        }
    }

    private void createReclamationEtudiant() {
        String reference = "reference";
        String dateReclamation = "dateReclamation";
        String message = "message";
        String setFrom = "setFrom";
        String img = "img";
        String traite = "traite";
        String dateTraitement = "dateTraitement";
        String dateReponse = "dateReponse";
        String postView = "postView";
        String objetReclamationEtudiant = "objetReclamationEtudiant";
        String commentaireTraiteur = "commentaireTraiteur";
        String username = "username";
        for (int i = 1; i < 100; i++) {
            ReclamationEtudiant item = new ReclamationEtudiant();
            item.setReference(fakeString(reference, i));
            item.setDateReclamation(fakeLocalDateTime(dateReclamation, i));
            item.setMessage(fakeString(message, i));
            item.setSetFrom(fakeString(setFrom, i));
            item.setImg(fakeString(img, i));
            item.setTraite(fakeBoolean(traite, i));
            item.setDateTraitement(fakeLocalDateTime(dateTraitement, i));
            item.setDateReponse(fakeLocalDateTime(dateReponse, i));
            item.setPostView(fakeBoolean(postView, i));
            item.setObjetReclamationEtudiant(fakeString(objetReclamationEtudiant, i));
            item.setCommentaireTraiteur(fakeString(commentaireTraiteur, i));
            item.setUsername(fakeString(username, i));
            reclamationEtudiantService.create(item);
        }
    }

    private void createConfirmationToken() {
        String token = "token";
        String expiresAt = "expiresAt";
        String createdAt = "createdAt";
        String confirmedAt = "confirmedAt";
        for (int i = 1; i < 100; i++) {
            ConfirmationToken item = new ConfirmationToken();
            item.setToken(fakeString(token, i));
            item.setExpiresAt(fakeLocalDateTime(expiresAt, i));
            item.setCreatedAt(fakeLocalDateTime(createdAt, i));
            item.setConfirmedAt(fakeLocalDateTime(confirmedAt, i));
            confirmationTokenService.create(item);
        }
    }

    private void createTypeTeacher() {
        String libelle = "libelle";
        String code = "code";
        for (int i = 1; i < 100; i++) {
            TypeTeacher item = new TypeTeacher();
            item.setLibelle(fakeString(libelle, i));
            item.setCode(fakeString(code, i));
            typeTeacherService.create(item);
        }
    }

    private void createTrancheHoraireProf() {
        String startHour = "startHour";
        String endHour = "endHour";
        String day = "day";
        String groupIndex = "groupIndex";
        for (int i = 1; i < 100; i++) {
            TrancheHoraireProf item = new TrancheHoraireProf();
            item.setStartHour(fakeString(startHour, i));
            item.setEndHour(fakeString(endHour, i));
            item.setDay(fakeInteger(day, i));
            item.setGroupIndex(fakeInteger(groupIndex, i));
            trancheHoraireProfService.create(item);
        }
    }

    private void createFreeTrialStudentEmailTemplate() {
        String object = "object";
        String corps = "corps";
        String source = "source";
        for (int i = 1; i < 100; i++) {
            FreeTrialStudentEmailTemplate item = new FreeTrialStudentEmailTemplate();
            item.setObject(fakeString(object, i));
            item.setCorps(fakeString(corps, i));
            item.setSource(fakeString(source, i));
            freeTrialStudentEmailTemplateService.create(item);
        }
    }

    private void createGroupeEtude() {
        String libelle = "libelle";
        String description = "description";
        String nombreEtudiant = "nombreEtudiant";
        for (int i = 1; i < 100; i++) {
            GroupeEtude item = new GroupeEtude();
            item.setLibelle(fakeString(libelle, i));
            item.setDescription(fakeString(description, i));
            item.setNombreEtudiant(fakeLong(nombreEtudiant, i));
            groupeEtudeService.create(item);
        }
    }

    private void createTypeDeQuestion() {
        String ref = "ref";
        String lib = "lib";
        for (int i = 1; i < 100; i++) {
            TypeDeQuestion item = new TypeDeQuestion();
            item.setRef(fakeString(ref, i));
            item.setLib(fakeString(lib, i));
            typeDeQuestionService.create(item);
        }
    }

    private void createFaq() {
        String description = "description";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            Faq item = new Faq();
            item.setQuestion(fakeString(description, i));
            item.setAnswer(fakeString(libelle, i));
            faqService.create(item);
        }
    }

    private void createGroupeEtudiant() {
        String libelle = "libelle";
        String type = "type";
        String dateDebut = "dateDebut";
        String dateFin = "dateFin";
        String nombrePlace = "nombrePlace";
        String nombrePlacevide = "nombrePlacevide";
        String nombrePlaceNonVide = "nombrePlaceNonVide";
        String nreCoursesComing = "nreCoursesComing";
        String nreCoursesCompleted = "nreCoursesCompleted";
        String nreCourses = "nreCourses";
        for (int i = 1; i < 100; i++) {
            GroupeEtudiant item = new GroupeEtudiant();
            item.setLibelle(fakeString(libelle, i));
            item.setType(fakeString(type, i));
            item.setDateDebut(fakeLocalDateTime(dateDebut, i));
            item.setDateFin(fakeLocalDateTime(dateFin, i));
            item.setNombrePlace(fakeLong(nombrePlace, i));
            item.setNombrePlacevide(fakeLong(nombrePlacevide, i));
            item.setNombrePlaceNonVide(fakeLong(nombrePlaceNonVide, i));
            item.setNreCoursesComing(fakeLong(nreCoursesComing, i));
            item.setNreCoursesCompleted(fakeLong(nreCoursesCompleted, i));
            item.setNreCourses(fakeLong(nreCourses, i));
            groupeEtudiantService.create(item);
        }
    }

    private void createContact() {
        String name = "name";
        String email = "email";
        String phone = "phone";
        String setFrom = "setFrom";
        String dateContact = "dateContact";
        String replied = "replied";
        String message = "message";
        for (int i = 1; i < 100; i++) {
            Contact item = new Contact();
            item.setName(fakeString(name, i));
            item.setEmail(fakeString(email, i));
            item.setPhone(fakeString(phone, i));
            item.setSetFrom(fakeString(setFrom, i));
            item.setDateContact(fakeLocalDateTime(dateContact, i));
            item.setReplied(fakeBoolean(replied, i));
            item.setMessage(fakeString(message, i));
            contactService.create(item);
        }
    }

    private void createTypeReclamationProf() {
        String code = "code";
        String libelle = "libelle";
        for (int i = 1; i < 100; i++) {
            TypeReclamationProf item = new TypeReclamationProf();
            item.setCode(fakeString(code, i));
            item.setLibelle(fakeString(libelle, i));
            typeReclamationProfService.create(item);
        }
    }

    private static String fakeString(String attributeName, int i) {
        return attributeName + i;
    }

    private static Long fakeLong(String attributeName, int i) {
        return 10L * i;
    }

    private static Integer fakeInteger(String attributeName, int i) {
        return 10 * i;
    }

    private static Double fakeDouble(String attributeName, int i) {
        return 10D * i;
    }

    private static BigDecimal fakeBigDecimal(String attributeName, int i) {
        return BigDecimal.valueOf(i * 1L * 10);
    }

    private static Boolean fakeBoolean(String attributeName, int i) {
        return i % 2 == 0 ? true : false;
    }

    private static LocalDateTime fakeLocalDateTime(String attributeName, int i) {
        return LocalDateTime.now().plusDays(i);
    }


    private static void addPermission(List<ModelPermission> modelPermissions) {
        modelPermissions.add(new ModelPermission("ContentType"));
        modelPermissions.add(new ModelPermission("Etudiant"));
        modelPermissions.add(new ModelPermission("Paiement"));
        modelPermissions.add(new ModelPermission("StatutSocial"));
        modelPermissions.add(new ModelPermission("HomeWorkEtudiant"));
        modelPermissions.add(new ModelPermission("Quiz"));
        modelPermissions.add(new ModelPermission("Reponse"));
        modelPermissions.add(new ModelPermission("ProfReview"));
        modelPermissions.add(new ModelPermission("News"));
        modelPermissions.add(new ModelPermission("Skill"));
        modelPermissions.add(new ModelPermission("InteretEtudiant"));
        modelPermissions.add(new ModelPermission("Langue"));
        modelPermissions.add(new ModelPermission("WorkloadBonusProf"));
        modelPermissions.add(new ModelPermission("PackStudent"));
        modelPermissions.add(new ModelPermission("SectionItem"));
        modelPermissions.add(new ModelPermission("EtatInscription"));
        modelPermissions.add(new ModelPermission("ScheduleProf"));
        modelPermissions.add(new ModelPermission("Exercice"));
        modelPermissions.add(new ModelPermission("FreeTrialConfiguration"));
        modelPermissions.add(new ModelPermission("FreeTrialformule"));
        modelPermissions.add(new ModelPermission("FaqEtudiant"));
        modelPermissions.add(new ModelPermission("Prof"));
        modelPermissions.add(new ModelPermission("FreeTrial"));
        modelPermissions.add(new ModelPermission("InviteStudent"));
        modelPermissions.add(new ModelPermission("Parcours"));
        modelPermissions.add(new ModelPermission("Dictionary"));
        modelPermissions.add(new ModelPermission("ClassAverageBonus"));
        modelPermissions.add(new ModelPermission("FreeTrialTeacherWhatsTemplate"));
        modelPermissions.add(new ModelPermission("StatutFreeTrial"));
        modelPermissions.add(new ModelPermission("TypeCollaborator"));
        modelPermissions.add(new ModelPermission("WorkloadBonus"));
        modelPermissions.add(new ModelPermission("TeacherLocality"));
        modelPermissions.add(new ModelPermission("Services"));
        modelPermissions.add(new ModelPermission("HomeWorkQuestion"));
        modelPermissions.add(new ModelPermission("Salary"));
        modelPermissions.add(new ModelPermission("TypeReclamationEtudiant"));
        modelPermissions.add(new ModelPermission("GroupeEtat"));
        modelPermissions.add(new ModelPermission("ReponseEtudiant"));
        modelPermissions.add(new ModelPermission("SessionCoursSection"));
        modelPermissions.add(new ModelPermission("HoweWorkQSTReponse"));
        modelPermissions.add(new ModelPermission("GroupeEtudiantDetail"));
        modelPermissions.add(new ModelPermission("Section"));
        modelPermissions.add(new ModelPermission("EtudiantReview"));
        modelPermissions.add(new ModelPermission("Question"));
        modelPermissions.add(new ModelPermission("CategorieProf"));
        modelPermissions.add(new ModelPermission("RecommendTeacher"));
        modelPermissions.add(new ModelPermission("Inscription"));
        modelPermissions.add(new ModelPermission("FaqType"));
        modelPermissions.add(new ModelPermission("Fonction"));
        modelPermissions.add(new ModelPermission("NiveauEtude"));
        modelPermissions.add(new ModelPermission("TypeHomeWork"));
        modelPermissions.add(new ModelPermission("Vocabulary"));
        modelPermissions.add(new ModelPermission("ReclamationProf"));
        modelPermissions.add(new ModelPermission("ReponseEtudiantHomeWork"));
        modelPermissions.add(new ModelPermission("FreeTrialDetail"));
        modelPermissions.add(new ModelPermission("QuizEtudiant"));
        modelPermissions.add(new ModelPermission("GroupeType"));
        modelPermissions.add(new ModelPermission("FreeTrialTeacherEmailTemplate"));
        modelPermissions.add(new ModelPermission("Cours"));
        modelPermissions.add(new ModelPermission("SessionCours"));
        modelPermissions.add(new ModelPermission("LevelTestConfiguration"));
        modelPermissions.add(new ModelPermission("Price"));
        modelPermissions.add(new ModelPermission("FaqProf"));
        modelPermissions.add(new ModelPermission("Collaborator"));
        modelPermissions.add(new ModelPermission("ClassAverageBonusProf"));
        modelPermissions.add(new ModelPermission("FreeTrialStudentWhatsTemplate"));
        modelPermissions.add(new ModelPermission("HomeWork"));
        modelPermissions.add(new ModelPermission("ReclamationEtudiant"));
        modelPermissions.add(new ModelPermission("ConfirmationToken"));
        modelPermissions.add(new ModelPermission("TypeTeacher"));
        modelPermissions.add(new ModelPermission("TrancheHoraireProf"));
        modelPermissions.add(new ModelPermission("FreeTrialStudentEmailTemplate"));
        modelPermissions.add(new ModelPermission("GroupeEtude"));
        modelPermissions.add(new ModelPermission("TypeDeQuestion"));
        modelPermissions.add(new ModelPermission("Faq"));
        modelPermissions.add(new ModelPermission("GroupeEtudiant"));
        modelPermissions.add(new ModelPermission("Contact"));
        modelPermissions.add(new ModelPermission("TypeReclamationProf"));
        modelPermissions.add(new ModelPermission("User"));
        modelPermissions.add(new ModelPermission("ModelPermission"));
        modelPermissions.add(new ModelPermission("ActionPermission"));
    }

    private static void addActionPermission(List<ActionPermission> actionPermissions) {
        actionPermissions.add(new ActionPermission("list"));
        actionPermissions.add(new ActionPermission("create"));
        actionPermissions.add(new ActionPermission("delete"));
        actionPermissions.add(new ActionPermission("edit"));
        actionPermissions.add(new ActionPermission("view"));
        actionPermissions.add(new ActionPermission("duplicate"));
    }


    @Autowired
    ContentTypeAdminService contentTypeService;
    @Autowired
    PaiementAdminService paiementService;
    @Autowired
    StatutSocialAdminService statutSocialService;
    @Autowired
    HomeWorkEtudiantAdminService homeWorkEtudiantService;
    @Autowired
    QuizAdminService quizService;
    @Autowired
    ReponseAdminService reponseService;
    @Autowired
    ProfReviewAdminService profReviewService;
    @Autowired
    NewsAdminService newsService;
    @Autowired
    SkillAdminService skillService;
    @Autowired
    InteretEtudiantAdminService interetEtudiantService;
    @Autowired
    LangueAdminService langueService;
    @Autowired
    WorkloadBonusProfAdminService workloadBonusProfService;
    @Autowired
    PackStudentAdminService packStudentService;
    @Autowired
    SectionItemAdminService sectionItemService;
    @Autowired
    EtatInscriptionAdminService etatInscriptionService;
    @Autowired
    ScheduleProfAdminService scheduleProfService;
    @Autowired
    ExerciceAdminService exerciceService;
    @Autowired
    FreeTrialConfigurationAdminService freeTrialConfigurationService;
    @Autowired
    FreeTrialformuleAdminService freeTrialformuleService;
    @Autowired
    FaqEtudiantAdminService faqEtudiantService;
    @Autowired
    FreeTrialAdminService freeTrialService;
    @Autowired
    InviteStudentAdminService inviteStudentService;
    @Autowired
    ParcoursAdminService parcoursService;
    @Autowired
    DictionaryAdminService dictionaryService;
    @Autowired
    ClassAverageBonusAdminService classAverageBonusService;
    @Autowired
    FreeTrialTeacherWhatsTemplateAdminService freeTrialTeacherWhatsTemplateService;
    @Autowired
    StatutFreeTrialAdminService statutFreeTrialService;
    @Autowired
    WorkloadBonusAdminService workloadBonusService;
    @Autowired
    TeacherLocalityAdminService teacherLocalityService;
    @Autowired
    ServicesAdminService servicesService;
    @Autowired
    HomeWorkQuestionAdminService homeWorkQuestionService;
    @Autowired
    SalaryAdminService salaryService;
    @Autowired
    TypeReclamationEtudiantAdminService typeReclamationEtudiantService;
    @Autowired
    GroupeEtatAdminService groupeEtatService;
    @Autowired
    ReponseEtudiantAdminService reponseEtudiantService;
    @Autowired
    HoweWorkQSTReponseAdminService howeWorkQSTReponseService;
    @Autowired
    SectionAdminService sectionService;
    @Autowired
    EtudiantReviewAdminService etudiantReviewService;
    @Autowired
    QuestionAdminService questionService;
    @Autowired
    CategorieProfAdminService categorieProfService;
    @Autowired
    RecommendTeacherAdminService recommendTeacherService;
    @Autowired
    InscriptionAdminService inscriptionService;
    @Autowired
    FaqTypeAdminService faqTypeService;
    @Autowired
    FonctionAdminService fonctionService;
    @Autowired
    NiveauEtudeAdminService niveauEtudeService;
    @Autowired
    TypeHomeWorkAdminService typeHomeWorkService;
    @Autowired
    VocabularyAdminService vocabularyService;
    @Autowired
    ReclamationProfAdminService reclamationProfService;
    @Autowired
    ReponseEtudiantHomeWorkAdminService reponseEtudiantHomeWorkService;
    @Autowired
    FreeTrialDetailAdminService freeTrialDetailService;
    @Autowired
    QuizEtudiantAdminService quizEtudiantService;
    @Autowired
    GroupeTypeAdminService groupeTypeService;
    @Autowired
    FreeTrialTeacherEmailTemplateAdminService freeTrialTeacherEmailTemplateService;
    @Autowired
    CoursAdminService coursService;
    @Autowired
    SessionCoursAdminService sessionCoursService;
    @Autowired
    LevelTestConfigurationAdminService levelTestConfigurationService;
    @Autowired
    PriceAdminService priceService;
    @Autowired
    FaqProfAdminService faqProfService;
    @Autowired
    ClassAverageBonusProfAdminService classAverageBonusProfService;
    @Autowired
    FreeTrialStudentWhatsTemplateAdminService freeTrialStudentWhatsTemplateService;
    @Autowired
    HomeWorkAdminService homeWorkService;
    @Autowired
    ReclamationEtudiantAdminService reclamationEtudiantService;
    @Autowired
    ConfirmationTokenAdminService confirmationTokenService;
    @Autowired
    TypeTeacherAdminService typeTeacherService;
    @Autowired
    TrancheHoraireProfAdminService trancheHoraireProfService;
    @Autowired
    FreeTrialStudentEmailTemplateAdminService freeTrialStudentEmailTemplateService;
    @Autowired
    GroupeEtudeAdminService groupeEtudeService;
    @Autowired
    TypeDeQuestionAdminService typeDeQuestionService;
    @Autowired
    FaqAdminService faqService;
    @Autowired
    GroupeEtudiantAdminService groupeEtudiantService;
    @Autowired
    ContactAdminService contactService;
    @Autowired
    TypeReclamationProfAdminService typeReclamationProfService;
}


