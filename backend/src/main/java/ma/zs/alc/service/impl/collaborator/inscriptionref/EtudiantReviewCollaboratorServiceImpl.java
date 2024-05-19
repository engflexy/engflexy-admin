package ma.zs.alc.service.impl.collaborator.inscriptionref;


import ma.zs.alc.bean.core.inscriptionref.EtudiantReview;
import ma.zs.alc.dao.criteria.core.inscriptionref.EtudiantReviewCriteria;
import ma.zs.alc.dao.facade.core.inscriptionref.EtudiantReviewDao;
import ma.zs.alc.dao.specification.core.inscriptionref.EtudiantReviewSpecification;
import ma.zs.alc.service.facade.collaborator.inscriptionref.EtudiantReviewCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.inscription.EtudiantCollaboratorService ;
import ma.zs.alc.bean.core.inscription.Etudiant ;
import ma.zs.alc.service.facade.collaborator.course.CoursCollaboratorService ;
import ma.zs.alc.bean.core.course.Cours ;
import ma.zs.alc.service.facade.collaborator.prof.ProfCollaboratorService ;
import ma.zs.alc.bean.core.prof.Prof ;

import java.util.List;
@Service
public class EtudiantReviewCollaboratorServiceImpl extends AbstractServiceImpl<EtudiantReview, EtudiantReviewCriteria, EtudiantReviewDao> implements EtudiantReviewCollaboratorService {






    public void findOrSaveAssociatedObject(EtudiantReview t){
        if( t != null) {
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
            t.setProf(profService.findOrSave(t.getProf()));
            t.setCours(coursService.findOrSave(t.getCours()));
        }
    }

    public List<EtudiantReview> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantId(Long id){
        return dao.countByEtudiantId(id);
    }
    public List<EtudiantReview> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<EtudiantReview> findByCoursId(Long id){
        return dao.findByCoursId(id);
    }
    public int deleteByCoursId(Long id){
        return dao.deleteByCoursId(id);
    }
    public long countByCoursCode(String code){
        return dao.countByCoursCode(code);
    }






    public void configure() {
        super.configure(EtudiantReview.class, EtudiantReviewSpecification.class);
    }


    @Autowired
    private EtudiantCollaboratorService etudiantService ;
    @Autowired
    private CoursCollaboratorService coursService ;
    @Autowired
    private ProfCollaboratorService profService ;

    public EtudiantReviewCollaboratorServiceImpl(EtudiantReviewDao dao) {
        super(dao);
    }

}
