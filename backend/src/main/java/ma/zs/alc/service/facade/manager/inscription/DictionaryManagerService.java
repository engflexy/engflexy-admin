package ma.zs.alc.service.facade.manager.inscription;

import ma.zs.alc.bean.core.inscription.Dictionary;
import ma.zs.alc.dao.criteria.core.inscription.DictionaryCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;



public interface DictionaryManagerService extends  IService<Dictionary,DictionaryCriteria>  {

    List<Dictionary> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantId(Long id);




}
