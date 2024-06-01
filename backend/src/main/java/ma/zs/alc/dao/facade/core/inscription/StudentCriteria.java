package ma.zs.alc.dao.facade.core.inscription;

import ma.zs.alc.bean.core.inscription.Etudiant;

public class StudentCriteria {
    public Long id;
    public String email;
    public String avatar;
    public String fullName;
    public String phone;
    public boolean enabled;

    public StudentCriteria(Etudiant etd) {
        this.id = etd.getId();
        this.email = etd.getEmail();
        this.avatar = etd.getAvatar();
        this.fullName = etd.getFullName();
        this.phone = etd.getPhone();
        this.enabled = etd.isEnabled();
    }
}
