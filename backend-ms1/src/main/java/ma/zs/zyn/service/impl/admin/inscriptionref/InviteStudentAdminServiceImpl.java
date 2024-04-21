package ma.zs.zyn.service.impl.admin.inscriptionref;


import ma.zs.zyn.bean.core.inscriptionref.InviteStudent;
import ma.zs.zyn.dao.criteria.core.inscriptionref.InviteStudentCriteria;
import ma.zs.zyn.dao.facade.core.inscriptionref.InviteStudentDao;
import ma.zs.zyn.dao.specification.core.inscriptionref.InviteStudentSpecification;
import ma.zs.zyn.service.facade.admin.inscriptionref.InviteStudentAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.inscription.EtudiantAdminService ;
import ma.zs.zyn.bean.core.inscription.Etudiant ;

import java.util.List;
@Service
public class InviteStudentAdminServiceImpl extends AbstractServiceImpl<InviteStudent, InviteStudentCriteria, InviteStudentDao> implements InviteStudentAdminService {






    public InviteStudent findByReferenceEntity(InviteStudent t){
        return  dao.findByCode(t.getCode());
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
    public long countByEtudiantRef(String ref){
        return dao.countByEtudiantRef(ref);
    }

    public List<InviteStudent> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(InviteStudent.class, InviteStudentSpecification.class);
    }


    @Autowired
    private EtudiantAdminService etudiantService ;

    public InviteStudentAdminServiceImpl(InviteStudentDao dao) {
        super(dao);
    }

}
