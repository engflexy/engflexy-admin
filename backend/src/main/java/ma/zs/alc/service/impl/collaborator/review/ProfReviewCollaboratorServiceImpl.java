package ma.zs.alc.service.impl.collaborator.review;


import ma.zs.alc.bean.core.review.ProfReview;
import ma.zs.alc.dao.criteria.core.review.ProfReviewCriteria;
import ma.zs.alc.dao.facade.core.review.ProfReviewDao;
import ma.zs.alc.dao.specification.core.review.ProfReviewSpecification;
import ma.zs.alc.service.facade.collaborator.review.ProfReviewCollaboratorService;
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
public class ProfReviewCollaboratorServiceImpl extends AbstractServiceImpl<ProfReview, ProfReviewCriteria, ProfReviewDao> implements ProfReviewCollaboratorService {






    public void findOrSaveAssociatedObject(ProfReview t){
        if( t != null) {
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
            t.setProf(profService.findOrSave(t.getProf()));
            t.setCours(coursService.findOrSave(t.getCours()));
        }
    }

    public List<ProfReview> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantId(Long id){
        return dao.countByEtudiantId(id);
    }
    public List<ProfReview> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<ProfReview> findByCoursId(Long id){
        return dao.findByCoursId(id);
    }
    public int deleteByCoursId(Long id){
        return dao.deleteByCoursId(id);
    }
    public long countByCoursCode(String code){
        return dao.countByCoursCode(code);
    }






    public void configure() {
        super.configure(ProfReview.class, ProfReviewSpecification.class);
    }


    @Autowired
    private EtudiantCollaboratorService etudiantService ;
    @Autowired
    private CoursCollaboratorService coursService ;
    @Autowired
    private ProfCollaboratorService profService ;

    public ProfReviewCollaboratorServiceImpl(ProfReviewDao dao) {
        super(dao);
    }

}
