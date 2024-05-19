package ma.zs.alc.service.impl.collaborator.learning;


import ma.zs.alc.bean.core.learning.SessionCoursSection;
import ma.zs.alc.dao.criteria.core.learning.SessionCoursSectionCriteria;
import ma.zs.alc.dao.facade.core.learning.SessionCoursSectionDao;
import ma.zs.alc.dao.specification.core.learning.SessionCoursSectionSpecification;
import ma.zs.alc.service.facade.collaborator.learning.SessionCoursSectionCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.learning.SessionCoursCollaboratorService ;
import ma.zs.alc.bean.core.learning.SessionCours ;
import ma.zs.alc.service.facade.collaborator.course.SectionCollaboratorService ;
import ma.zs.alc.bean.core.course.Section ;

import java.util.List;
@Service
public class SessionCoursSectionCollaboratorServiceImpl extends AbstractServiceImpl<SessionCoursSection, SessionCoursSectionCriteria, SessionCoursSectionDao> implements SessionCoursSectionCollaboratorService {






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
    private SessionCoursCollaboratorService sessionCoursService ;
    @Autowired
    private SectionCollaboratorService sectionService ;

    public SessionCoursSectionCollaboratorServiceImpl(SessionCoursSectionDao dao) {
        super(dao);
    }

}
