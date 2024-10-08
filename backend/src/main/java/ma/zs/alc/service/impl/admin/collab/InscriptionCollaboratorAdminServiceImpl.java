package ma.zs.alc.service.impl.admin.collab;


import ma.zs.alc.bean.core.collab.InscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.InscriptionCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.InscriptionCollaboratorSpecification;
import ma.zs.alc.service.facade.admin.collab.InscriptionCollaboratorAdminService;
import ma.zs.alc.service.facade.admin.collab.CollaboratorAdminService;
import ma.zs.alc.zynerator.exception.EntityNotFoundException;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.admin.collab.InscriptionCollaboratorStateAdminService;
import ma.zs.alc.service.facade.admin.collab.PackageCollaboratorAdminService;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class InscriptionCollaboratorAdminServiceImpl extends AbstractServiceImpl<InscriptionCollaborator, InscriptionCollaboratorCriteria, InscriptionCollaboratorDao> implements InscriptionCollaboratorAdminService {

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public InscriptionCollaborator update(InscriptionCollaborator t) {
        //saveAuditData(t, ACTION_TYPE.UPDATE);
        InscriptionCollaborator loadedItem = dao.findById(t.getId()).orElse(null);
        if (loadedItem == null) {
            throw new EntityNotFoundException("errors.notFound", new String[]{itemClass.getSimpleName(), t.getId().toString()});
        } else {
            LocalDateTime startDate = t.getStartDate();
            if (startDate != null) {
                t.setEndDate(startDate.plusDays(30));
            }
            updateWithAssociatedLists(t);
            dao.save(t);
            return loadedItem;
        }
    }
    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public InscriptionCollaborator create(InscriptionCollaborator t) {
        InscriptionCollaborator loaded = findByReferenceEntity(t);
        if (loaded == null) {
            LocalDateTime startDate = t.getStartDate();
            if (startDate != null) {
                t.setEndDate(startDate.plusDays(30));
            }
            InscriptionCollaborator saved = dao.saveAndFlush(t);
            return saved;
        } else {
            return loaded;
        }
    }


    public void findOrSaveAssociatedObject(InscriptionCollaborator t) {
        if (t != null) {
            t.setPackageCollaborator(packageCollaboratorService.findOrSave(t.getPackageCollaborator()));
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
            t.setInscriptionCollaboratorState(inscriptionCollaboratorStateService.findOrSave(t.getInscriptionCollaboratorState()));
        }
    }

    public List<InscriptionCollaborator> findByPackageCollaboratorId(Long id) {
        return dao.findByPackageCollaboratorId(id);
    }

    public int deleteByPackageCollaboratorId(Long id) {
        return dao.deleteByPackageCollaboratorId(id);
    }

    public long countByPackageCollaboratorId(Long id) {
        return dao.countByPackageCollaboratorId(id);
    }

    public List<InscriptionCollaborator> findByCollaboratorId(Long id) {
        return dao.findByCollaboratorId(id);
    }

    public int deleteByCollaboratorId(Long id) {
        return dao.deleteByCollaboratorId(id);
    }

    public long countByCollaboratorId(Long id) {
        return dao.countByCollaboratorId(id);
    }

    public List<InscriptionCollaborator> findByInscriptionCollaboratorStateCode(String code) {
        return dao.findByInscriptionCollaboratorStateCode(code);
    }

    public int deleteByInscriptionCollaboratorStateCode(String code) {
        return dao.deleteByInscriptionCollaboratorStateCode(code);
    }

    public long countByInscriptionCollaboratorStateCode(String code) {
        return dao.countByInscriptionCollaboratorStateCode(code);
    }


    public void configure() {
        super.configure(InscriptionCollaborator.class, InscriptionCollaboratorSpecification.class);
    }


    @Autowired
    private CollaboratorAdminService collaboratorService;
    @Autowired
    private InscriptionCollaboratorStateAdminService inscriptionCollaboratorStateService;
    @Autowired
    private PackageCollaboratorAdminService packageCollaboratorService;

    public InscriptionCollaboratorAdminServiceImpl(InscriptionCollaboratorDao dao) {
        super(dao);
    }

}
