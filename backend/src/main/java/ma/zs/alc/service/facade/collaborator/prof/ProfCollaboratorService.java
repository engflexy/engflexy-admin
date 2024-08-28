package ma.zs.alc.service.facade.collaborator.prof;

import java.util.List;

import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.bean.core.prof.Prof;
import ma.zs.alc.dao.criteria.core.prof.ProfCriteria;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


public interface ProfCollaboratorService extends  IService<Prof,ProfCriteria>  {
    Prof findByUsername(String username);
    boolean changePassword(String username, String newPassword);

    List<Prof> findByParcoursId(Long id);
    List<Etudiant> findAssociatedEtudiant(String email);
    int deleteByParcoursId(Long id);
    long countByParcoursCode(String code);
    List<Prof> findByCategorieProfId(Long id);
    int deleteByCategorieProfId(Long id);
    long countByCategorieProfCode(String code);
    List<Prof> findByTypeTeacherId(Long id);
    int deleteByTypeTeacherId(Long id);
    long countByTypeTeacherCode(String code);
    List<Prof> findByCollaboratorId(Long id);
    Page<UserPageable> findByCollaboratorId(Long id, Pageable pageable);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);
    boolean updateAccountLockStatus(Long id, boolean accountNonLocked);
    boolean updateAccountNonExpiredStatus(Long id, boolean accountNonExpired);
    boolean updateAccountStatus(Long id, boolean enabled);
    boolean updatePasswordChangedStatus(Long id, boolean passwordChanged);
    boolean updateCredentialsNonExpiredStatus(Long id, boolean credentialsNonExpired);
}
