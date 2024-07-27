package ma.zs.alc.service.impl.manager.vocab;


import ma.zs.alc.bean.core.vocab.Vocabulary;
import ma.zs.alc.dao.criteria.core.vocab.VocabularyCriteria;
import ma.zs.alc.dao.facade.core.vocab.VocabularyDao;
import ma.zs.alc.dao.specification.core.vocab.VocabularySpecification;
import ma.zs.alc.service.facade.manager.course.SectionManagerService;
import ma.zs.alc.service.facade.manager.vocab.VocabularyManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VocabularyManagerServiceImpl extends AbstractServiceImpl<Vocabulary, VocabularyCriteria, VocabularyDao> implements VocabularyManagerService {


    public void findOrSaveAssociatedObject(Vocabulary t) {
        if (t != null) {
            t.setSection(sectionService.findOrSave(t.getSection()));
        }
    }

    public List<Vocabulary> findBySectionId(Long id) {
        return dao.findBySectionId(id);
    }

    public int deleteBySectionId(Long id) {
        return dao.deleteBySectionId(id);
    }

    public long countBySectionCode(String code) {
        return dao.countBySectionCode(code);
    }



    public void configure() {
        super.configure(Vocabulary.class, VocabularySpecification.class);
    }

    @Autowired
    private SectionManagerService sectionService;

    public VocabularyManagerServiceImpl(VocabularyDao dao) {
        super(dao);
    }

}
