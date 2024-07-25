package ma.zs.alc.service.impl.manager.learning;


import ma.zs.alc.bean.core.learning.SessionCoursSection;
import ma.zs.alc.dao.criteria.core.learning.SessionCoursSectionCriteria;
import ma.zs.alc.dao.facade.core.learning.SessionCoursSectionDao;
import ma.zs.alc.dao.specification.core.learning.SessionCoursSectionSpecification;
import ma.zs.alc.service.facade.manager.learning.SessionCoursSectionManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.learning.SessionCoursManagerService ;
import ma.zs.alc.service.facade.manager.course.SectionManagerService ;

@Service
public class SessionCoursSectionManagerServiceImpl extends AbstractServiceImpl<SessionCoursSection, SessionCoursSectionCriteria, SessionCoursSectionDao> implements SessionCoursSectionManagerService {







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
    private SessionCoursManagerService sessionCoursService ;
    @Autowired
    private SectionManagerService sectionService ;

    public SessionCoursSectionManagerServiceImpl(SessionCoursSectionDao dao) {
        super(dao);
    }

}
