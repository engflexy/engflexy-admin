package ma.zs.zyn.service.impl.admin.learning;


import ma.zs.zyn.bean.core.learning.SessionCours;
import ma.zs.zyn.dao.criteria.core.learning.SessionCoursCriteria;
import ma.zs.zyn.dao.facade.core.learning.SessionCoursDao;
import ma.zs.zyn.dao.specification.core.learning.SessionCoursSpecification;
import ma.zs.zyn.service.facade.admin.learning.SessionCoursAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import ma.zs.zyn.service.facade.admin.salary.SalaryAdminService ;
import ma.zs.zyn.bean.core.salary.Salary ;
import ma.zs.zyn.service.facade.admin.grpe.GroupeEtudiantAdminService ;
import ma.zs.zyn.bean.core.grpe.GroupeEtudiant ;
import ma.zs.zyn.service.facade.admin.learning.SessionCoursSectionAdminService ;
import ma.zs.zyn.bean.core.learning.SessionCoursSection ;
import ma.zs.zyn.service.facade.admin.course.CoursAdminService ;
import ma.zs.zyn.bean.core.course.Cours ;
import ma.zs.zyn.service.facade.admin.prof.ProfAdminService ;
import ma.zs.zyn.bean.core.prof.Prof ;

import java.util.List;
@Service
public class SessionCoursAdminServiceImpl extends AbstractServiceImpl<SessionCours, SessionCoursCriteria, SessionCoursDao> implements SessionCoursAdminService {


    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class, readOnly = false)
    public SessionCours create(SessionCours t) {
        SessionCours saved= super.create(t);
        if (saved != null && t.getSessionCoursSections() != null) {
                t.getSessionCoursSections().forEach(element-> {
                element.setSessionCours(saved);
                sessionCoursSectionService.create(element);
            });
        }
        return saved;

    }

    public SessionCours findWithAssociatedLists(Long id){
        SessionCours result = dao.findById(id).orElse(null);
        if(result!=null && result.getId() != null) {
            result.setSessionCoursSections(sessionCoursSectionService.findBySessionCoursId(id));
        }
        return result;
    }
    @Transactional
    public void deleteAssociatedLists(Long id) {
        sessionCoursSectionService.deleteBySessionCoursId(id);
    }


    public void updateWithAssociatedLists(SessionCours sessionCours){
    if(sessionCours !=null && sessionCours.getId() != null){
            List<List<SessionCoursSection>> resultSessionCoursSections= sessionCoursSectionService.getToBeSavedAndToBeDeleted(sessionCoursSectionService.findBySessionCoursId(sessionCours.getId()),sessionCours.getSessionCoursSections());
            sessionCoursSectionService.delete(resultSessionCoursSections.get(1));
            ListUtil.emptyIfNull(resultSessionCoursSections.get(0)).forEach(e -> e.setSessionCours(sessionCours));
            sessionCoursSectionService.update(resultSessionCoursSections.get(0),true);
        }
    }




    public SessionCours findByReferenceEntity(SessionCours t){
        return  dao.findByReference(t.getReference());
    }
    public void findOrSaveAssociatedObject(SessionCours t){
        if( t != null) {
            t.setProf(profService.findOrSave(t.getProf()));
            t.setCours(coursService.findOrSave(t.getCours()));
            t.setGroupeEtudiant(groupeEtudiantService.findOrSave(t.getGroupeEtudiant()));
            t.setSalary(salaryService.findOrSave(t.getSalary()));
        }
    }

    public List<SessionCours> findByProfId(Long id){
        return dao.findByProfId(id);
    }
    public int deleteByProfId(Long id){
        return dao.deleteByProfId(id);
    }
    public long countByProfRef(String ref){
        return dao.countByProfRef(ref);
    }
    public List<SessionCours> findByCoursId(Long id){
        return dao.findByCoursId(id);
    }
    public int deleteByCoursId(Long id){
        return dao.deleteByCoursId(id);
    }
    public long countByCoursCode(String code){
        return dao.countByCoursCode(code);
    }
    public List<SessionCours> findByGroupeEtudiantId(Long id){
        return dao.findByGroupeEtudiantId(id);
    }
    public int deleteByGroupeEtudiantId(Long id){
        return dao.deleteByGroupeEtudiantId(id);
    }
    public long countByGroupeEtudiantId(Long id){
        return dao.countByGroupeEtudiantId(id);
    }
    public List<SessionCours> findBySalaryId(Long id){
        return dao.findBySalaryId(id);
    }
    public int deleteBySalaryId(Long id){
        return dao.deleteBySalaryId(id);
    }
    public long countBySalaryCode(String code){
        return dao.countBySalaryCode(code);
    }

    public List<SessionCours> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(SessionCours.class, SessionCoursSpecification.class);
    }


    @Autowired
    private SalaryAdminService salaryService ;
    @Autowired
    private GroupeEtudiantAdminService groupeEtudiantService ;
    @Autowired
    private SessionCoursSectionAdminService sessionCoursSectionService ;
    @Autowired
    private CoursAdminService coursService ;
    @Autowired
    private ProfAdminService profService ;

    public SessionCoursAdminServiceImpl(SessionCoursDao dao) {
        super(dao);
    }

}
