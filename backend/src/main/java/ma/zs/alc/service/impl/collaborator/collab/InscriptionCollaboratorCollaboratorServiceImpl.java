package ma.zs.alc.service.impl.collaborator.collab;


import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.bean.core.collab.InscriptionCollaborator;
import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorCriteria;
import ma.zs.alc.dao.facade.core.collab.InscriptionCollaboratorDao;
import ma.zs.alc.dao.specification.core.collab.InscriptionCollaboratorSpecification;
import ma.zs.alc.service.facade.collaborator.collab.InscriptionCollaboratorCollaboratorService;
import ma.zs.alc.service.facade.collaborator.collab.CollaboratorCollaboratorService;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.collab.InscriptionCollaboratorStateCollaboratorService ;
import ma.zs.alc.service.facade.collaborator.collab.PackageCollaboratorCollaboratorService ;

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


    public InscriptionCollaborator findForCurrentCollaborator(Long id) {
        List<InscriptionCollaborator> inscriptionCollaborators = dao.findByCollaboratorId(id);
        if (inscriptionCollaborators != null && !inscriptionCollaborators.isEmpty())
            return inscriptionCollaborators.get(0);
        return null;

    }

    @Override
    public void createFreeTrial(Collaborator t) {
        InscriptionCollaborator inscriptionCollaborator = new InscriptionCollaborator();
        inscriptionCollaborator.setCollaborator(t);
        String libelle = t.getTypeCollaborator().getLibelle();
        boolean school = "school".equals(libelle);
        inscriptionCollaborator.setPackageCollaborator(packageCollaboratorService.findByLibelleAndSchool("free", school));
        inscriptionCollaborator.setInscriptionCollaboratorState(inscriptionCollaboratorStateService.findByLibelle("free"));
        inscriptionCollaborator.setStartDate(LocalDateTime.now());
        inscriptionCollaborator.setEndDate(inscriptionCollaborator.getStartDate().plusDays(7));
        dao.save(inscriptionCollaborator);

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




    @Override
    public Page<InscriptionCollaborator> findByCollaboratorTypeCollaboratorIdTeacher(Pageable pageable){
        return dao.findByCollaboratorTypeCollaboratorId(2L, pageable);
    }

    @Override
    public Page<InscriptionCollaborator> findByCollaboratorTypeCollaboratorIdSchool(Pageable pageable){
        return dao.findByCollaboratorTypeCollaboratorId(1L,pageable);
    }




    private Page<InscriptionCollaborator> findByCollaboratorTypeCollaboratorId(Long id,Pageable pageable){

        return dao.findByCollaboratorTypeCollaboratorId(id,pageable);
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
