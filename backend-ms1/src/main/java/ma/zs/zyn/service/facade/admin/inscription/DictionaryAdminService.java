package ma.zs.zyn.service.facade.admin.inscription;

import java.util.List;
import ma.zs.zyn.bean.core.inscription.Dictionary;
import ma.zs.zyn.dao.criteria.core.inscription.DictionaryCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface DictionaryAdminService extends  IService<Dictionary,DictionaryCriteria>  {

    List<Dictionary> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantRef(String ref);




}
