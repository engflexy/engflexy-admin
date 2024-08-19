package ma.zs.alc.emails;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import ma.zs.alc.bean.core.grpe.GroupeEtudiant;
import ma.zs.alc.bean.core.prof.ScheduleProf;
import ma.zs.alc.zynerator.util.DateUtil;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.messaging.MessagingException;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import java.io.IOException;
import java.util.*;

@Service
public class EmailSenderService {
    private final Configuration configuration;
    List<String> to;
    private final JavaMailSender mailSender;

    public EmailSenderService(Configuration configuration, JavaMailSender mailSender) {
        this.configuration = configuration;
        this.mailSender = mailSender;
    }

    @Async
    public void sentJavaMail(MailComponent mailComponent, String templateName) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("noreply@engflexy.com");
        message.setTo(mailComponent.getTo());
        message.setSubject(mailComponent.getSubject());
        message.setText(mailComponent.getContent());
        mailSender.send(message);
    }


    @Async
    public void sent(MailComponent mailComponent) throws MessagingException, IOException, TemplateException {
        this.to = new ArrayList<>();
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.titan.email");
        mailSender.setPort(465);
        mailSender.setUsername("noreply@engflexy.com");
        mailSender.setPassword("noreply@27021985");
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");
        props.put("mail.smtp.ssl.enable", true);
        mailSender.setJavaMailProperties(props);

        try {
//            send(mailSender, mailComponent, null);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

//    private void send(JavaMailSenderImpl mailSender, MailComponent mailComponent, String templateName) throws Exception {
//        to = new ArrayList<>();
//        MimeMessage message = mailSender.createMimeMessage();
//        MimeMessageHelper helper = new MimeMessageHelper(message, true);
//
//        helper.setFrom("EngFlexy <noreply@engflexy.com>");
//        helper.setSubject(mailComponent.getSubject());
//        if (templateName != null) {
//            Template template = null;
//            try {
//                template = getTemplateByName(templateName);
//            } catch (IOException e) {
//                throw new RuntimeException(e);
//            }
//            String emailContent;
//            emailContent = fillMailContent(mailComponent, template);
//            helper.setText(emailContent);
//        } else {
//            helper.setText(mailComponent.getContent());
//        }
//
//        if (mailComponent.getTo() != null) {
//            to.add(mailComponent.getTo());
//            helper.setTo(mailComponent.getTo());
//        }
//        if (mailComponent.getToAddresses() != null && mailComponent.getToAddresses().length > 0) {
//            to.addAll(Arrays.asList(mailComponent.getToAddresses()));
//            helper.setTo(mailComponent.getToAddresses());
//        }
//        System.out.println("I AM IN SEND NOW ===> " + to);
//        try {
//            mailSender.send(message);
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }

    public Template getTemplateByName(String templateName) throws IOException {
        return configuration.getTemplate(templateName);
    }

    public String fillMailContent(MailComponent mailComponent, Template template) throws IOException, TemplateException {
        Map<String, Object> model = new HashMap<>();

        assert mailComponent.getUsername() != null;
        model.put("username", mailComponent.getUsername());

        assert mailComponent.getName() != null;
        model.put("name", mailComponent.getName());

        assert mailComponent.getPassword() != null;
        model.put("password", mailComponent.getPassword());

        assert mailComponent.getFrom() != null;
        model.put("from", mailComponent.getFrom());

        assert mailComponent.getTeacher() != null;
        model.put("teacher", mailComponent.getTeacher());

        assert mailComponent.getLessonFormat() != null;
        model.put("lessonFormat", mailComponent.getLessonFormat());

        assert mailComponent.getLessonDate() != null;
        model.put("lessonDate", mailComponent.getLessonDate());

        assert mailComponent.getLink() != null;
        model.put("link", mailComponent.getLink());

        assert mailComponent.getTo() != null;
        model.put("to", mailComponent.getTo());

        assert mailComponent.getMeetLink() != null;
        model.put("meet", mailComponent.getMeetLink());

        assert mailComponent.getPack() != null;
        model.put("pack", mailComponent.getPack());

        assert mailComponent.getNumberCourses() != null;
        model.put("numberCourses", mailComponent.getNumberCourses());

        assert mailComponent.getTitle() != null;
        model.put("title", mailComponent.getTitle());

        assert mailComponent.getContent() != null;
        model.put("content", mailComponent.getContent());

        String html = FreeMarkerTemplateUtils.processTemplateIntoString(template, model);

        StringBuffer content = new StringBuffer(html);

        return content.toString();
    }

    public void notify_admins(String reason, Object object) {
        if (reason.equals("GROUP_CREATED")) {
            GroupeEtudiant g = (GroupeEtudiant) object;
            MailComponent mailComponent = new MailComponent();
            mailComponent.setSubject("EngFlexy: New group created at " + DateUtil.getCurrentDateTime());
            mailComponent.setTo(null);
            mailComponent.setToAddresses(new String[]{"kh.zouani@engflexy.com", "ka.zouani@engflexy.com", "y.elmoudene@engflexy.com"});
            mailComponent.setContent("New group created at " + DateUtil.getCurrentDateTime() + "<ul>" +

                    "<li>" + "Group name: " + "<strong>" + g.getLibelle() + "</strong>" + "</li>" +

                    "<li>" + "Group Level: " + "<strong>" + g.getParcours().getLibelle() + "</strong>" + "</li>" +

                    "<li>" + "Group teacher: " + "<strong>" + g.getProf().getFullName() + "</strong>" + "</li>" +

                    "<li>" + "number of students: " + "<strong>" + g.getNombrePlaceNonVide() + "</strong>" + "</li>" +

                    "<li>" + "Date created: " + "<strong>" + DateUtil.getCurrentDateTime() + "</strong>" + "</li>" +

                    "</ul>");
            try {
                sent(mailComponent);
            } catch (MessagingException | IOException | TemplateException e) {
                e.printStackTrace();
            }

        } else if (reason.equals("GROUP_UPDATED")) {
            GroupeEtudiant g = (GroupeEtudiant) object;
            MailComponent mailComponent = new MailComponent();
            mailComponent.setSubject("EngFlexy: New Updates about  group " + g.getLibelle());
            mailComponent.setTo(null);
            mailComponent.setToAddresses(new String[]{"kh.zouani@engflexy.com", "ka.zouani@engflexy.com", "y.elmoudene@engflexy.com"});
            mailComponent.setContent(g.getNombrePlaceNonVide() + " students  joined the group " + g.getLibelle() + "<ul>" +

                    "<li>" + "Group name: " + "<strong>" + g.getLibelle() + "</strong>" + "</li>" +

                    "<li>" + "Group Level: " + "<strong>" + g.getParcours().getLibelle() + "</strong>" + "</li>" +

                    "<li>" + "Group teacher: " + "<strong>" + g.getProf().getFullName() + "</strong>" + "</li>" +

                    "<li>" + "number of students: " + "<strong>" + g.getNombrePlaceNonVide() + "</strong>" + "</li>" +

                    "<li>" + "Date created: " + "<strong>" + DateUtil.getCurrentDateTime() + "</strong>" + "</li>" +

                    "</ul>");
            try {
                sent(mailComponent);
            } catch (MessagingException | IOException | TemplateException e) {
                e.printStackTrace();
            }
        }

    }

//    public void notify_teacher(String email, Classe classe) {
//        GroupeEtudiant g = classe.getScheduleProf().getGroupeEtudiant();
//        MailComponent mailComponent = new MailComponent();
//        mailComponent.setSubject("EngFlexy: New student joined your class  " + classe.getScheduleProf().getSubject());
//        mailComponent.setToAddresses(null);
//        mailComponent.setTo(email);
//        mailComponent.setContent(g.getNombrePlaceNonVide() + " students  joined the class " + classe.getScheduleProf().getSubject() + "<ul>" +
//
//                "<li>" + "Class name: " + "<strong>" + classe.getScheduleProf().getSubject() + "</strong>" + "</li>" +
//
//                "<li>" + "Group name: " + "<strong>" + g.getLibelle() + "</strong>" + "</li>" +
//
//                "<li>" + "Group Level: " + "<strong>" + g.getParcours().getLibelle() + "</strong>" + "</li>" +
//
//                "<li>" + "Group teacher: " + "<strong>" + g.getProf().getNom() + "</strong>" + "</li>" +
//
//                "<li>" + "number of students: " + "<strong>" + g.getNombrePlaceNonVide() + "</strong>" + "</li>" +
//
//                "</ul>");
//        try {
//            sent(mailComponent);
//        } catch (MessagingException | IOException | TemplateException e) {
//            e.printStackTrace();
//        }
//    }

    public void notify_student_for_next_lessons(String[] students, ScheduleProf scheduleProf) {
        MailComponent mailComponent = new MailComponent();
        mailComponent.setUsername(" ");
        mailComponent.setTeacher(scheduleProf.getProf().getFullName());
        mailComponent.setSubject(scheduleProf.getSubject());
        String lessonDate = DateUtil.dateToString(scheduleProf.getStartTime());
        mailComponent.setLessonDate(lessonDate);
        mailComponent.setTo(null);
        mailComponent.setToAddresses(students);
        if (scheduleProf.getGroupeEtudiant().getGroupeEtude().getNombreEtudiant() == 1L) {
            mailComponent.setLessonFormat("حصة فردية (60 دقيقة)");
        } else {
            mailComponent.setLessonFormat("حصة في مجموعة (60 دقيقة)");
        }
        mailComponent.setSubject(" تذكير لإعلامك بأن درسك سيبدأ يوم " + lessonDate + " - EngFlexy");
        System.out.println("SUBJECT ====>   " + mailComponent.getSubject());
        sentJavaMail(mailComponent, ConstantFileNames.STUDENT_DAILY_REMINDER_TEMPLATE);
    }
}
