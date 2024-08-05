package ma.zs.alc.zynerator.transverse.emailling;


public class EmailRequest {
    private String subject;
    private String body;
    private String from;
    private String to;
    private String cc;
    private String bcc;

    public EmailRequest(String subject, String body, String to) {
        this.subject = subject;
        this.body = body;
        this.to = to;
        this.bcc = to;
        this.cc = to;
        this.from = "kokooooo";
    }

    public EmailRequest() {
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getCc() {
        return cc;
    }

    public void setCc(String cc) {
        this.cc = cc;
    }

    public String getBcc() {
        return bcc;
    }

    public void setBcc(String bcc) {
        this.bcc = bcc;
    }


}