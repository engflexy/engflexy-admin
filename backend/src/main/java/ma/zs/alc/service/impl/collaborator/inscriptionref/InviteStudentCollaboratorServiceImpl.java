package ma.zs.alc.service.impl.collaborator.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.InviteStudent;
import ma.zs.alc.dao.criteria.core.inscriptionref.InviteStudentCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.InviteStudentDao;
import ma.zs.alc.dao.specification.core.inscriptionref.InviteStudentSpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.InviteStudentCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.inscription.EtudiantCollaboratorService ;
import ma.zs.alc.bean.core.inscription.Etudiant ;

import java.util.List;
@Service
public class InviteStudentCollaboratorServiceImpl extends AbstractServiceImpl<InviteStudent, InviteStudentCriteria, InviteStudentDao> implements InviteStudentCollaboratorService {






    public InviteStudent findByReferenceEntity(InviteStudent t){
        return t.getId() == null ? null : dao.findById(t.getId()).orElse(null);
    }
    public void findOrSaveAssociatedObject(InviteStudent t){
        if( t != null) {
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
        }
    }

    public List<InviteStudent> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantId(Long id){
        return dao.countByEtudiantId(id);
    }

    public List<InviteStudent> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(InviteStudent.class, InviteStudentSpecification.class);
    }


    @Autowired
    private EtudiantCollaboratorService etudiantService ;

    public InviteStudentCollaboratorServiceImpl(InviteStudentDao dao) {
        super(dao);
    }

}
