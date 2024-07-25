package ma.zs.alc.service.impl.manager.inscription;


import ma.zs.alc.bean.core.inscription.Dictionary;
import ma.zs.alc.dao.criteria.core.inscription.DictionaryCriteria;
import ma.zs.alc.dao.facade.core.inscription.DictionaryDao;
import ma.zs.alc.dao.specification.core.inscription.DictionarySpecification;
import ma.zs.alc.service.facade.manager.inscription.DictionaryManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.manager.inscription.EtudiantManagerService ;

@Service
public class DictionaryManagerServiceImpl extends AbstractServiceImpl<Dictionary, DictionaryCriteria, DictionaryDao> implements DictionaryManagerService {







    public void findOrSaveAssociatedObject(Dictionary t){
        if( t != null) {
            t.setEtudiant(etudiantService.findOrSave(t.getEtudiant()));
        }
    }

    public List<Dictionary> findByEtudiantId(Long id){
        return dao.findByEtudiantId(id);
    }
    public int deleteByEtudiantId(Long id){
        return dao.deleteByEtudiantId(id);
    }
    public long countByEtudiantId(Long id){
        return dao.countByEtudiantId(id);
    }

    public List<Dictionary> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Dictionary.class, DictionarySpecification.class);
    }


    @Autowired
    private EtudiantManagerService etudiantService ;

    public DictionaryManagerServiceImpl(DictionaryDao dao) {
        super(dao);
    }

}
