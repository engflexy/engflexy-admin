package ma.zs.alc.service.facade.collaborator.collab;

import java.util.List;
import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.dao.criteria.core.collab.CollaboratorCriteria;
import ma.zs.alc.zynerator.dto.AccountValidationDto;
import ma.zs.alc.zynerator.security.payload.response.JwtResponse;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.http.ResponseEntity;


public interface CollaboratorCollaboratorService extends  IService<Collaborator,CollaboratorCriteria>  {
    Collaborator register(Collaborator t);

    Collaborator findByUsername(String username);
    boolean changePassword(String username, String newPassword);

    List<Collaborator> findByTypeCollaboratorId(Long id);
    int deleteByTypeCollaboratorId(Long id);
    long countByTypeCollaboratorCode(String code);

    boolean updateAccountLockStatus(Long id, boolean accountNonLocked);
    boolean updateAccountNonExpiredStatus(Long id, boolean accountNonExpired);
    boolean updateAccountStatus(Long id, boolean enabled);
    boolean updatePasswordChangedStatus(Long id, boolean passwordChanged);
    boolean updateCredentialsNonExpiredStatus(Long id, boolean credentialsNonExpired);


    boolean findByUsernameAndValidationCode(String username, String validationCode);

    ResponseEntity<JwtResponse> validateUser(AccountValidationDto accountValidationDto);
}
