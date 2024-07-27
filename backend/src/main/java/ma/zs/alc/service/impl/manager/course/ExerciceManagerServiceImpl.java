package ma.zs.alc.service.impl.manager.course;


import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.dao.criteria.core.course.ExerciceCriteria;
import ma.zs.alc.dao.facade.core.course.ExerciceDao;
import ma.zs.alc.dao.specification.core.course.ExerciceSpecification;
import ma.zs.alc.service.facade.manager.course.ExerciceManagerService;
import ma.zs.alc.service.facade.manager.course.SectionManagerService;
import ma.zs.alc.service.facade.manager.courseref.ContentTypeManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExerciceManagerServiceImpl extends AbstractServiceImpl<Exercice, ExerciceCriteria, ExerciceDao> implements ExerciceManagerService {


    public void findOrSaveAssociatedObject(Exercice t) {
        if (t != null) {
            t.setContentType(contentTypeService.findOrSave(t.getContentType()));
            t.setSection(sectionService.findOrSave(t.getSection()));
        }
    }

    public List<Exercice> findByContentTypeId(Long id) {
        return dao.findByContentTypeId(id);
    }

    public int deleteByContentTypeId(Long id) {
        return dao.deleteByContentTypeId(id);
    }

    public long countByContentTypeCode(String code) {
        return dao.countByContentTypeCode(code);
    }

    public List<Exercice> findBySectionId(Long id) {
        return dao.findBySectionIdOrderByNumeroAsc(id);
    }

    public int deleteBySectionId(Long id) {
        return dao.deleteBySectionId(id);
    }

    public long countBySectionCode(String code) {
        return dao.countBySectionCode(code);
    }

    public List<Exercice> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(Exercice.class, ExerciceSpecification.class);
    }


    @Autowired
    private ContentTypeManagerService contentTypeService;
    @Autowired
    private SectionManagerService sectionService;

    public ExerciceManagerServiceImpl(ExerciceDao dao) {
        super(dao);
    }

}
