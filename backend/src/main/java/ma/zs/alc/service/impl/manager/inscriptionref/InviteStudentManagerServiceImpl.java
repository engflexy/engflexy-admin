package ma.zs.alc.service.impl.manager.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.InviteStudent;
import ma.zs.alc.dao.criteria.core.inscriptionref.InviteStudentCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.InviteStudentDao;
import ma.zs.alc.dao.specification.core.inscriptionref.InviteStudentSpecification;
import ma.zs.alc.service.facade.manager.inscriptionref.InviteStudentManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.inscription.EtudiantManagerService ;

@Service
public class InviteStudentManagerServiceImpl extends AbstractServiceImpl<InviteStudent, InviteStudentCriteria, InviteStudentDao> implements InviteStudentManagerService {







    public InviteStudent findByReferenceEntity(InviteStudent t){
        return t==null? null : dao.findByCode(t.getCode());
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
    private EtudiantManagerService etudiantService ;

    public InviteStudentManagerServiceImpl(InviteStudentDao dao) {
        super(dao);
    }

}