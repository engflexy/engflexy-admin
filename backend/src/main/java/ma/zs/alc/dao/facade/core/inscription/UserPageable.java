package ma.zs.alc.dao.facade.core.inscription;

import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.bean.core.prof.Prof;

public class UserPageable {
    public Long id;
    public String email;
    public String avatar;
    public String fullName;
    public String phone;
    public boolean enabled;

    public UserPageable(Etudiant etd) {
        this.id = etd.getId();
        this.email = etd.getEmail();
        this.avatar = etd.getAvatar();
        this.fullName = etd.getFullName();
        this.phone = etd.getPhone();
        this.enabled = etd.isEnabled();
    }

    public UserPageable(Prof prof) {
        this.id = prof.getId();
        this.email = prof.getEmail();
        this.avatar = prof.getAvatar();
        this.fullName = prof.getFullName();
        this.phone = prof.getPhone();
        this.enabled = prof.isEnabled();
    }
}
