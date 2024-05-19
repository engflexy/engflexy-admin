package ma.zs.alc.service.impl.collaborator.course;


import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.dao.criteria.core.course.ExerciceCriteria;
import ma.zs.alc.dao.facade.core.course.ExerciceDao;
import ma.zs.alc.dao.specification.core.course.ExerciceSpecification;
import ma.zs.alc.service.facade.collaborator.course.ExerciceCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.courseref.ContentTypeCollaboratorService ;
import ma.zs.alc.bean.core.courseref.ContentType ;
import ma.zs.alc.service.facade.collaborator.course.SectionCollaboratorService ;
import ma.zs.alc.bean.core.course.Section ;

import java.util.List;
@Service
public class ExerciceCollaboratorServiceImpl extends AbstractServiceImpl<Exercice, ExerciceCriteria, ExerciceDao> implements ExerciceCollaboratorService {






    public void findOrSaveAssociatedObject(Exercice t){
        if( t != null) {
            t.setContentType(contentTypeService.findOrSave(t.getContentType()));
            t.setSection(sectionService.findOrSave(t.getSection()));
        }
    }

    public List<Exercice> findByContentTypeId(Long id){
        return dao.findByContentTypeId(id);
    }
    public int deleteByContentTypeId(Long id){
        return dao.deleteByContentTypeId(id);
    }
    public long countByContentTypeCode(String code){
        return dao.countByContentTypeCode(code);
    }
    public List<Exercice> findBySectionId(Long id){
        return dao.findBySectionId(id);
    }
    public int deleteBySectionId(Long id){
        return dao.deleteBySectionId(id);
    }
    public long countBySectionCode(String code){
        return dao.countBySectionCode(code);
    }

    public List<Exercice> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Exercice.class, ExerciceSpecification.class);
    }


    @Autowired
    private ContentTypeCollaboratorService contentTypeService ;
    @Autowired
    private SectionCollaboratorService sectionService ;

    public ExerciceCollaboratorServiceImpl(ExerciceDao dao) {
        super(dao);
    }

}
