package ma.zs.zyn.service.impl.admin.vocab;


import ma.zs.zyn.bean.core.vocab.Vocabulary;
import ma.zs.zyn.dao.criteria.core.vocab.VocabularyCriteria;
import ma.zs.zyn.dao.facade.core.vocab.VocabularyDao;
import ma.zs.zyn.dao.specification.core.vocab.VocabularySpecification;
import ma.zs.zyn.service.facade.admin.vocab.VocabularyAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.vocab.VocabularyQuizAdminService ;
import ma.zs.zyn.bean.core.vocab.VocabularyQuiz ;
import ma.zs.zyn.service.facade.admin.course.SectionAdminService ;
import ma.zs.zyn.bean.core.course.Section ;

import java.util.List;
@Service
public class VocabularyAdminServiceImpl extends AbstractServiceImpl<Vocabulary, VocabularyCriteria, VocabularyDao> implements VocabularyAdminService {






    public void findOrSaveAssociatedObject(Vocabulary t){
        if( t != null) {
            t.setSection(sectionService.findOrSave(t.getSection()));
            t.setVocabularyQuiz(vocabularyQuizService.findOrSave(t.getVocabularyQuiz()));
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
    public List<Vocabulary> findByVocabularyQuizId(Long id){
        return dao.findByVocabularyQuizId(id);
    }
    public int deleteByVocabularyQuizId(Long id){
        return dao.deleteByVocabularyQuizId(id);
    }
    public long countByVocabularyQuizId(Long id){
        return dao.countByVocabularyQuizId(id);
    }






    public void configure() {
        super.configure(Vocabulary.class, VocabularySpecification.class);
    }


    @Autowired
    private VocabularyQuizAdminService vocabularyQuizService ;
    @Autowired
    private SectionAdminService sectionService ;

    public VocabularyAdminServiceImpl(VocabularyDao dao) {
        super(dao);
    }

}
