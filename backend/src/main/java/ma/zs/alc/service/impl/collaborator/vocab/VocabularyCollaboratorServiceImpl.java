package ma.zs.alc.service.impl.collaborator.vocab;


import ma.zs.alc.bean.core.vocab.Vocabulary;
import ma.zs.alc.dao.criteria.core.vocab.VocabularyCriteria;
import ma.zs.alc.dao.facade.core.vocab.VocabularyDao;
import ma.zs.alc.dao.specification.core.vocab.VocabularySpecification;
import ma.zs.alc.service.facade.collaborator.vocab.VocabularyCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.course.SectionCollaboratorService ;
import ma.zs.alc.bean.core.course.Section ;

import java.util.List;
@Service
public class VocabularyCollaboratorServiceImpl extends AbstractServiceImpl<Vocabulary, VocabularyCriteria, VocabularyDao> implements VocabularyCollaboratorService {






    public void findOrSaveAssociatedObject(Vocabulary t){
        if( t != null) {
            t.setSection(sectionService.findOrSave(t.getSection()));
        }
    }

    public List<Vocabulary> findBySectionId(Long id){
        return dao.findBySectionId(id);
    }
    public int deleteBySectionId(Long id){
        return dao.deleteBySectionId(id);
    }
    public long countBySectionCode(String code){
        return dao.countBySectionCode(code);
    }






    public void configure() {
        super.configure(Vocabulary.class, VocabularySpecification.class);
    }


    @Autowired
    private SectionCollaboratorService sectionService ;

    public VocabularyCollaboratorServiceImpl(VocabularyDao dao) {
        super(dao);
    }

}
