package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.InscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.InscriptionCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.InscriptionCollaboratorSpecification;
import ma.zs.alc.service.facade.collaborator.collab.InscriptionCollaboratorCollaboratorService;
import ma.zs.alc.service.facade.collaborator.vocab.CollaboratorCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import static ma.zs.alc.zynerator.util.ListUtil.*;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;



import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.collab.InscriptionCollaboratorStateCollaboratorService ;
import ma.zs.alc.bean.core.collab.InscriptionCollaboratorState ;
import ma.zs.alc.service.facade.collaborator.collab.PackageCollaboratorCollaboratorService ;
import ma.zs.alc.bean.core.collab.PackageCollaborator ;


import java.util.List;
@Service
public class InscriptionCollaboratorCollaboratorServiceImpl extends AbstractServiceImpl<InscriptionCollaborator, InscriptionCollaboratorCriteria, InscriptionCollaboratorDao> implements InscriptionCollaboratorCollaboratorService {







    public void findOrSaveAssociatedObject(InscriptionCollaborator t){
        if( t != null) {
            t.setPackageCollaborator(packageCollaboratorService.findOrSave(t.getPackageCollaborator()));
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
            t.setInscriptionCollaboratorState(inscriptionCollaboratorStateService.findOrSave(t.getInscriptionCollaboratorState()));
        }
    }

    public List<InscriptionCollaborator> findByPackageCollaboratorId(Long id){
        return dao.findByPackageCollaboratorId(id);
    }
    public int deleteByPackageCollaboratorId(Long id){
        return dao.deleteByPackageCollaboratorId(id);
    }
    public long countByPackageCollaboratorId(Long id){
        return dao.countByPackageCollaboratorId(id);
    }
    public List<InscriptionCollaborator> findByCollaboratorId(Long id){
        return dao.findByCollaboratorId(id);
    }
    public int deleteByCollaboratorId(Long id){
        return dao.deleteByCollaboratorId(id);
    }
    public long countByCollaboratorId(Long id){
        return dao.countByCollaboratorId(id);
    }
    public List<InscriptionCollaborator> findByInscriptionCollaboratorStateCode(String code){
        return dao.findByInscriptionCollaboratorStateCode(code);
    }
    public int deleteByInscriptionCollaboratorStateCode(String code){
        return dao.deleteByInscriptionCollaboratorStateCode(code);
    }
    public long countByInscriptionCollaboratorStateCode(String code){
        return dao.countByInscriptionCollaboratorStateCode(code);
    }






    public void configure() {
        super.configure(InscriptionCollaborator.class, InscriptionCollaboratorSpecification.class);
    }


    @Autowired
    private CollaboratorCollaboratorService collaboratorService ;
    @Autowired
    private InscriptionCollaboratorStateCollaboratorService inscriptionCollaboratorStateService ;
    @Autowired
    private PackageCollaboratorCollaboratorService packageCollaboratorService ;

    public InscriptionCollaboratorCollaboratorServiceImpl(InscriptionCollaboratorDao dao) {
        super(dao);
    }

}
