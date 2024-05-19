function fn() {

    
    var config = {};
    
   
    const rootUrlDev = 'http://localhost:8036/';
    const adminCredentialsDev = {"username": "admin","password": "123"};
    const urlDev = 'jdbc:mysql://localhost:3306/zyn';

    const usernameDev = 'root';
    const passwordDev = '';
    const driverDev = 'com.mysql.cj.jdbc.Driver';


    const rootUrlInit = 'https://stage-host/';
    const adminCredentialsInit = {"username": "admin","password": "123"};
    const urlInit = 'jdbc:mysql://localhost:8036/peps-order';
    const usernameInit = 'root';
    const passwordInit = '';
    const driverInit = 'com.mysql.cj.jdbc.Driver';
    
    
    const rootUrlE2e = 'https://e2e-host/';
    const adminCredentialsE2e = {"username": "admin","password": "123"};
    const urlE2e = 'jdbc:mysql://localhost:8036/peps-order';
    const usernameE2e = 'root';
    const passwordE2e = '';
    const driverE2e = 'com.mysql.cj.jdbc.Driver';
    
    var env = karate.env; // get java system property 'karate.env'
    if (!env || env=='dev') {
        env = 'dev';
        config.rootUrl = rootUrlDev;
        config.adminCredentials = adminCredentialsDev;
        config.datasource = { username: usernameDev, password: passwordDev, url: urlDev, driverClassName: driverDev }
    }
    if (env == 'int') {
        // over-ride only those that need to be
        config.rootUrl = rootUrlInit;
        config.adminCredentials = adminCredentialsInit;
        config.datasource = { username: usernameInit, password: passwordInit, url: urlInit, driverClassName: driverInit }
    } else if (env == 'e2e') {
        config.rootUrl = rootUrlE2e;
        config.adminCredentials = adminCredentialsE2e;
        config.datasource = { username: usernameE2e, password: passwordE2e, url: urlE2e, driverClassName: driverE2e }
    }

    config.actuatorUri = config.rootUrl + 'actuator/';
    config.adminUri = config.rootUrl + 'api/admin/';

    config.contentTypeUrl = config.adminUri + 'contentType/';
    config.etudiantUrl = config.adminUri + 'etudiant/';
    config.paiementUrl = config.adminUri + 'paiement/';
    config.statutSocialUrl = config.adminUri + 'statutSocial/';
    config.homeWorkEtudiantUrl = config.adminUri + 'homeWorkEtudiant/';
    config.quizUrl = config.adminUri + 'quiz/';
    config.reponseUrl = config.adminUri + 'reponse/';
    config.profReviewUrl = config.adminUri + 'profReview/';
    config.newsUrl = config.adminUri + 'news/';
    config.skillUrl = config.adminUri + 'skill/';
    config.interetEtudiantUrl = config.adminUri + 'interetEtudiant/';
    config.langueUrl = config.adminUri + 'langue/';
    config.workloadBonusProfUrl = config.adminUri + 'workloadBonusProf/';
    config.packStudentUrl = config.adminUri + 'packStudent/';
    config.sectionItemUrl = config.adminUri + 'sectionItem/';
    config.etatInscriptionUrl = config.adminUri + 'etatInscription/';
    config.scheduleProfUrl = config.adminUri + 'scheduleProf/';
    config.exerciceUrl = config.adminUri + 'exercice/';
    config.freeTrialConfigurationUrl = config.adminUri + 'freeTrialConfiguration/';
    config.freeTrialformuleUrl = config.adminUri + 'freeTrialformule/';
    config.faqEtudiantUrl = config.adminUri + 'faqEtudiant/';
    config.profUrl = config.adminUri + 'prof/';
    config.freeTrialUrl = config.adminUri + 'freeTrial/';
    config.inviteStudentUrl = config.adminUri + 'inviteStudent/';
    config.parcoursUrl = config.adminUri + 'parcours/';
    config.dictionaryUrl = config.adminUri + 'dictionary/';
    config.classAverageBonusUrl = config.adminUri + 'classAverageBonus/';
    config.freeTrialTeacherWhatsTemplateUrl = config.adminUri + 'freeTrialTeacherWhatsTemplate/';
    config.statutFreeTrialUrl = config.adminUri + 'statutFreeTrial/';
    config.typeCollaboratorUrl = config.adminUri + 'typeCollaborator/';
    config.workloadBonusUrl = config.adminUri + 'workloadBonus/';
    config.teacherLocalityUrl = config.adminUri + 'teacherLocality/';
    config.servicesUrl = config.adminUri + 'services/';
    config.homeWorkQuestionUrl = config.adminUri + 'homeWorkQuestion/';
    config.salaryUrl = config.adminUri + 'salary/';
    config.typeReclamationEtudiantUrl = config.adminUri + 'typeReclamationEtudiant/';
    config.groupeEtatUrl = config.adminUri + 'groupeEtat/';
    config.reponseEtudiantUrl = config.adminUri + 'reponseEtudiant/';
    config.sessionCoursSectionUrl = config.adminUri + 'sessionCoursSection/';
    config.howeWorkQSTReponseUrl = config.adminUri + 'howeWorkQSTReponse/';
    config.groupeEtudiantDetailUrl = config.adminUri + 'groupeEtudiantDetail/';
    config.sectionUrl = config.adminUri + 'section/';
    config.etudiantReviewUrl = config.adminUri + 'etudiantReview/';
    config.questionUrl = config.adminUri + 'question/';
    config.categorieProfUrl = config.adminUri + 'categorieProf/';
    config.recommendTeacherUrl = config.adminUri + 'recommendTeacher/';
    config.inscriptionUrl = config.adminUri + 'inscription/';
    config.faqTypeUrl = config.adminUri + 'faqType/';
    config.fonctionUrl = config.adminUri + 'fonction/';
    config.niveauEtudeUrl = config.adminUri + 'niveauEtude/';
    config.typeHomeWorkUrl = config.adminUri + 'typeHomeWork/';
    config.vocabularyUrl = config.adminUri + 'vocabulary/';
    config.reclamationProfUrl = config.adminUri + 'reclamationProf/';
    config.reponseEtudiantHomeWorkUrl = config.adminUri + 'reponseEtudiantHomeWork/';
    config.freeTrialDetailUrl = config.adminUri + 'freeTrialDetail/';
    config.quizEtudiantUrl = config.adminUri + 'quizEtudiant/';
    config.groupeTypeUrl = config.adminUri + 'groupeType/';
    config.freeTrialTeacherEmailTemplateUrl = config.adminUri + 'freeTrialTeacherEmailTemplate/';
    config.coursUrl = config.adminUri + 'cours/';
    config.sessionCoursUrl = config.adminUri + 'sessionCours/';
    config.levelTestConfigurationUrl = config.adminUri + 'levelTestConfiguration/';
    config.priceUrl = config.adminUri + 'price/';
    config.faqProfUrl = config.adminUri + 'faqProf/';
    config.collaboratorUrl = config.adminUri + 'collaborator/';
    config.classAverageBonusProfUrl = config.adminUri + 'classAverageBonusProf/';
    config.freeTrialStudentWhatsTemplateUrl = config.adminUri + 'freeTrialStudentWhatsTemplate/';
    config.homeWorkUrl = config.adminUri + 'homeWork/';
    config.reclamationEtudiantUrl = config.adminUri + 'reclamationEtudiant/';
    config.confirmationTokenUrl = config.adminUri + 'confirmationToken/';
    config.typeTeacherUrl = config.adminUri + 'typeTeacher/';
    config.trancheHoraireProfUrl = config.adminUri + 'trancheHoraireProf/';
    config.freeTrialStudentEmailTemplateUrl = config.adminUri + 'freeTrialStudentEmailTemplate/';
    config.groupeEtudeUrl = config.adminUri + 'groupeEtude/';
    config.typeDeQuestionUrl = config.adminUri + 'typeDeQuestion/';
    config.faqUrl = config.adminUri + 'faq/';
    config.groupeEtudiantUrl = config.adminUri + 'groupeEtudiant/';
    config.contactUrl = config.adminUri + 'contact/';
    config.typeReclamationProfUrl = config.adminUri + 'typeReclamationProf/';

    common = karate.callSingle('classpath:common.feature', config);
    config.uniqueId = common.uniqueId
    config.db = common.db
    config.adminToken = common.adminToken
    config.env = env;

    karate.log('karate.env =', karate.env);
    karate.log('config =', config);
    // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    return config;
}
