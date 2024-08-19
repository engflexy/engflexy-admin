package ma.zs.alc.emails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class CallConfiguration {

    @Autowired
    private Environment env;

    public String getConfigurationByName(String configName) {

        return env.getProperty(configName);
    }

    @Bean
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        Properties props = mailSender.getJavaMailProperties();
        mailSender.setHost(host);
        mailSender.setPort(port);
        mailSender.setUsername(mail);
        mailSender.setPassword(password);
        props.put("mail.transport.protocol", protocol);
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.starttls.required", true);
        props.put("mail.debug", true);
        props.put("mail.smtp.debug", true);
        mailSender.setJavaMailProperties(props);
        return mailSender;
    }

    @Value("${spring.mail.protocol}")
    String protocol;

    @Value("${spring.mail.password}")
    String password;

    @Value("${spring.mail.username}")
    String mail;

    @Value("${spring.mail.host}")
    String host;

    @Value("${spring.mail.port}")
    int port;


}
