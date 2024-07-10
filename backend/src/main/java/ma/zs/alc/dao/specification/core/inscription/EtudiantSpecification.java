package ma.zs.alc.dao.specification.core.inscription;

import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.dao.criteria.core.inscription.EtudiantCriteria;
import ma.zs.alc.zynerator.specification.AbstractSpecification;


public class EtudiantSpecification extends AbstractSpecification<EtudiantCriteria, Etudiant> {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("groupOption", criteria.getGroupOption(), criteria.getGroupOptionLike());
        addPredicateBool("subscribe", criteria.getSubscribe());
        addPredicateBool("credentialsNonExpired", criteria.getCredentialsNonExpired());
        addPredicateBool("enabled", criteria.getEnabled());
        addPredicate("email", criteria.getEmail(), criteria.getEmailLike());
        addPredicateBool("accountNonExpired", criteria.getAccountNonExpired());
        addPredicateBool("accountNonLocked", criteria.getAccountNonLocked());
        addPredicate("username", criteria.getUsername(), criteria.getUsernameLike());
        addPredicate("fullName", criteria.getFullName(), criteria.getFullNameLike());
        addPredicate("phone", criteria.getPhone(), criteria.getPhoneLike());
        addPredicate("password", criteria.getPassword(), criteria.getPasswordLike());
        addPredicateBool("passwordChanged", criteria.getPasswordChanged());
        addPredicateFk("teacherLocality", "id", criteria.getTeacherLocality() == null ? null : criteria.getTeacherLocality().getId());
        addPredicateFk("teacherLocality", "id", criteria.getTeacherLocalitys());
        addPredicateFk("teacherLocality", "code", criteria.getTeacherLocality() == null ? null : criteria.getTeacherLocality().getCode());
        addPredicateFk("parcours", "id", criteria.getParcours() == null ? null : criteria.getParcours().getId());
        addPredicateFk("parcours", "id", criteria.getParcourss());
        addPredicateFk("parcours", "code", criteria.getParcours() == null ? null : criteria.getParcours().getCode());
        addPredicateFk("groupeEtude", "id", criteria.getGroupeEtude() == null ? null : criteria.getGroupeEtude().getId());
        addPredicateFk("groupeEtude", "id", criteria.getGroupeEtudes());
        addPredicateFk("packStudent", "id", criteria.getPackStudent() == null ? null : criteria.getPackStudent().getId());
        addPredicateFk("packStudent", "id", criteria.getPackStudents());
        addPredicateFk("packStudent", "code", criteria.getPackStudent() == null ? null : criteria.getPackStudent().getCode());
        addPredicateFk("statutSocial", "id", criteria.getStatutSocial() == null ? null : criteria.getStatutSocial().getId());
        addPredicateFk("statutSocial", "id", criteria.getStatutSocials());
        addPredicateFk("statutSocial", "code", criteria.getStatutSocial() == null ? null : criteria.getStatutSocial().getCode());
        addPredicateFk("interetEtudiant", "id", criteria.getInteretEtudiant() == null ? null : criteria.getInteretEtudiant().getId());
        addPredicateFk("interetEtudiant", "id", criteria.getInteretEtudiants());
        addPredicateFk("interetEtudiant", "code", criteria.getInteretEtudiant() == null ? null : criteria.getInteretEtudiant().getCode());
        addPredicateFk("niveauEtude", "id", criteria.getNiveauEtude() == null ? null : criteria.getNiveauEtude().getId());
        addPredicateFk("niveauEtude", "id", criteria.getNiveauEtudes());
        addPredicateFk("niveauEtude", "code", criteria.getNiveauEtude() == null ? null : criteria.getNiveauEtude().getCode());
        addPredicateFk("skill", "id", criteria.getSkill() == null ? null : criteria.getSkill().getId());
        addPredicateFk("skill", "id", criteria.getSkills());
        addPredicateFk("skill", "code", criteria.getSkill() == null ? null : criteria.getSkill().getCode());
        addPredicateFk("fonction", "id", criteria.getFonction() == null ? null : criteria.getFonction().getId());
        addPredicateFk("fonction", "id", criteria.getFonctions());
        addPredicateFk("fonction", "code", criteria.getFonction() == null ? null : criteria.getFonction().getCode());
        addPredicateFk("langue", "id", criteria.getLangue() == null ? null : criteria.getLangue().getId());
        addPredicateFk("langue", "id", criteria.getLangues());
        addPredicateFk("langue", "ref", criteria.getLangue() == null ? null : criteria.getLangue().getRef());
        addPredicateFk("collaborator", "id", criteria.getCollaborator() == null ? null : criteria.getCollaborator().getId());
        addPredicateFk("collaborator", "id", criteria.getCollaborators());
    }

    public EtudiantSpecification(EtudiantCriteria criteria) {
        super(criteria);
    }

    public EtudiantSpecification(EtudiantCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
