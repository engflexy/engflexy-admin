package ma.zs.alc.service.facade.admin.vocab;

import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.dao.criteria.core.vocab.CollaboratorCriteria;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;


public interface CollaboratorAdminService extends IService<Collaborator, CollaboratorCriteria> {
    Collaborator findByUsername(String username);

    boolean changePassword(String username, String newPassword);

    List<Collaborator> findByTypeCollaboratorId(Long id);

    int deleteByTypeCollaboratorId(Long id);

    long countByTypeCollaboratorCode(String code);

    Page<UserPageable> findAllByCriteria(Pageable pageable);
}
