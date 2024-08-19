package ma.zs.alc.service.facade.collaborator.collab;

import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.bean.core.collab.InscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorCriteria;
import ma.zs.alc.zynerator.service.IService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;

import java.util.List;


public interface InscriptionCollaboratorCollaboratorService extends IService<InscriptionCollaborator, InscriptionCollaboratorCriteria> {

    List<InscriptionCollaborator> findByPackageCollaboratorId(Long id);

    int deleteByPackageCollaboratorId(Long id);

    long countByPackageCollaboratorId(Long id);

    List<InscriptionCollaborator> findByCollaboratorId(Long id);

    int deleteByCollaboratorId(Long id);

    long countByCollaboratorId(Long id);

    List<InscriptionCollaborator> findByInscriptionCollaboratorStateCode(String code);

    int deleteByInscriptionCollaboratorStateCode(String code);

    long countByInscriptionCollaboratorStateCode(String code);


    Page<InscriptionCollaborator> findByCollaboratorTypeCollaboratorIdTeacher(Pageable pageable);

    Page<InscriptionCollaborator> findByCollaboratorTypeCollaboratorIdSchool(Pageable pageable);


    InscriptionCollaborator findForCurrentCollaborator(Long id);

    void createFreeTrial(Collaborator t);
}
