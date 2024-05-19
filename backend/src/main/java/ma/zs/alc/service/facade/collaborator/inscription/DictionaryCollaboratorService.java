package ma.zs.alc.service.facade.collaborator.inscription;

import java.util.List;
import ma.zs.alc.bean.core.inscription.Dictionary;
import ma.zs.alc.dao.criteria.core.inscription.DictionaryCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface DictionaryCollaboratorService extends  IService<Dictionary,DictionaryCriteria>  {

    List<Dictionary> findByEtudiantId(Long id);
    int deleteByEtudiantId(Long id);
    long countByEtudiantId(Long id);




}
