package ma.zs.zyn.service.impl.admin.inscription;


import ma.zs.zyn.bean.core.inscription.Dictionary;
import ma.zs.zyn.dao.criteria.core.inscription.DictionaryCriteria;
import ma.zs.zyn.dao.facade.core.inscription.DictionaryDao;
import ma.zs.zyn.dao.specification.core.inscription.DictionarySpecification;
import ma.zs.zyn.service.facade.admin.inscription.DictionaryAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.zyn.service.facade.admin.inscription.EtudiantAdminService ;
import ma.zs.zyn.bean.core.inscription.Etudiant ;

import java.util.List;
@Service
public class DictionaryAdminServiceImpl extends AbstractServiceImpl<Dictionary, DictionaryCriteria, DictionaryDao> implements DictionaryAdminService {






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
    public long countByEtudiantRef(String ref){
        return dao.countByEtudiantRef(ref);
    }

    public List<Dictionary> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Dictionary.class, DictionarySpecification.class);
    }


    @Autowired
    private EtudiantAdminService etudiantService ;

    public DictionaryAdminServiceImpl(DictionaryDao dao) {
        super(dao);
    }

}
