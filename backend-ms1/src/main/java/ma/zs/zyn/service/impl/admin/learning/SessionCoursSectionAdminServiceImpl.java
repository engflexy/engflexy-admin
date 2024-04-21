package ma.zs.zyn.service.impl.admin.learning;


import ma.zs.zyn.bean.core.learning.SessionCoursSection;
import ma.zs.zyn.dao.criteria.core.learning.SessionCoursSectionCriteria;
import ma.zs.zyn.dao.facade.core.learning.SessionCoursSectionDao;
import ma.zs.zyn.dao.specification.core.learning.SessionCoursSectionSpecification;
import ma.zs.zyn.service.facade.admin.learning.SessionCoursSectionAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.learning.SessionCoursAdminService ;
import ma.zs.zyn.bean.core.learning.SessionCours ;
import ma.zs.zyn.service.facade.admin.course.SectionAdminService ;
import ma.zs.zyn.bean.core.course.Section ;

import java.util.List;
@Service
public class SessionCoursSectionAdminServiceImpl extends AbstractServiceImpl<SessionCoursSection, SessionCoursSectionCriteria, SessionCoursSectionDao> implements SessionCoursSectionAdminService {






    public void findOrSaveAssociatedObject(SessionCoursSection t){
        if( t != null) {
            t.setSessionCours(sessionCoursService.findOrSave(t.getSessionCours()));
            t.setSection(sectionService.findOrSave(t.getSection()));
        }
    }

    public List<SessionCoursSection> findBySessionCoursId(Long id){
        return dao.findBySessionCoursId(id);
    }
    public int deleteBySessionCoursId(Long id){
        return dao.deleteBySessionCoursId(id);
    }
    public long countBySessionCoursReference(String reference){
        return dao.countBySessionCoursReference(reference);
    }
    public List<SessionCoursSection> findBySectionId(Long id){
        return dao.findBySectionId(id);
    }
    public int deleteBySectionId(Long id){
        return dao.deleteBySectionId(id);
    }
    public long countBySectionCode(String code){
        return dao.countBySectionCode(code);
    }






    public void configure() {
        super.configure(SessionCoursSection.class, SessionCoursSectionSpecification.class);
    }


    @Autowired
    private SessionCoursAdminService sessionCoursService ;
    @Autowired
    private SectionAdminService sectionService ;

    public SessionCoursSectionAdminServiceImpl(SessionCoursSectionDao dao) {
        super(dao);
    }

}
