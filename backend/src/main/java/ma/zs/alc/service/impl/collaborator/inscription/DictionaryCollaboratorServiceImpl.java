package ma.zs.alc.service.impl.collaborator.inscription;


import ma.zs.alc.bean.core.inscription.Dictionary;
import ma.zs.alc.dao.criteria.core.inscription.DictionaryCriteria;
import ma.zs.alc.dao.facade.core.inscription.DictionaryDao;
import ma.zs.alc.dao.specification.core.inscription.DictionarySpecification;
import ma.zs.alc.service.facade.collaborator.inscription.DictionaryCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.inscription.EtudiantCollaboratorService ;
import ma.zs.alc.bean.core.inscription.Etudiant ;

import java.util.List;
@Service
public class DictionaryCollaboratorServiceImpl extends AbstractServiceImpl<Dictionary, DictionaryCriteria, DictionaryDao> implements DictionaryCollaboratorService {






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
    private EtudiantCollaboratorService etudiantService ;

    public DictionaryCollaboratorServiceImpl(DictionaryDao dao) {
        super(dao);
    }

}
