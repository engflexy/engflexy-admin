package ma.zs.alc.service.impl.admin.course;


import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.dao.criteria.core.course.ExerciceCriteria;
import ma.zs.alc.dao.facade.core.course.ExerciceDao;
import ma.zs.alc.dao.facade.core.quiz.QuizDao;
import ma.zs.alc.dao.specification.core.course.ExerciceSpecification;
import ma.zs.alc.service.facade.admin.course.ExerciceAdminService;
import ma.zs.alc.service.facade.admin.course.SectionAdminService;
import ma.zs.alc.service.facade.admin.courseref.ContentTypeAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExerciceAdminServiceImpl extends AbstractServiceImpl<Exercice, ExerciceCriteria, ExerciceDao> implements ExerciceAdminService {


    @Override
    public Exercice create(Exercice exercice) {
        ContentType type = contentTypeService.findByReferenceEntity(exercice.getContentType());
        Section section = sectionService.findById(exercice.getSection().getId());
        exercice.setContentType(type);
        exercice.setSection(section);
        if (exercice.getQuiz() != null) {
            exercice.setQuiz(quizDao.findById(exercice.getQuiz().getId()).orElse(null));
        } else {
            exercice.setQuiz(null);
        }
        return dao.save(exercice);
    }

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
        return dao.findBySectionId(id);
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
    private ContentTypeAdminService contentTypeService;
    @Autowired
    private SectionAdminService sectionService;
    @Autowired
    private QuizDao quizDao;

    public ExerciceAdminServiceImpl(ExerciceDao dao) {
        super(dao);
    }

}
