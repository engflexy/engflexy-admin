package ma.zs.alc.dao.facade.core.collab;

import ma.zs.alc.zynerator.repository.AbstractRepository;
import ma.zs.alc.bean.core.collab.InscriptionCollaborator;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface InscriptionCollaboratorDao extends AbstractRepository<InscriptionCollaborator, Long> {

    List<InscriptionCollaborator> findByPackageCollaboratorId(Long id);

    int deleteByPackageCollaboratorId(Long id);

    long countByPackageCollaboratorId(Long id);

    List<InscriptionCollaborator> findByCollaboratorId(Long id);

    int deleteByCollaboratorId(Long id);

    long countByCollaboratorId(Long id);

    List<InscriptionCollaborator> findByInscriptionCollaboratorStateCode(String code);

    public int deleteByInscriptionCollaboratorStateCode(String code);

    long countByInscriptionCollaboratorStateCode(String code);

    Page<InscriptionCollaborator> findByCollaboratorTypeCollaboratorId(Long id, Pageable pageable);

}
