package ma.zs.alc.service.facade.collaborator.price;

import java.util.List;
import ma.zs.alc.bean.core.price.Price;
import ma.zs.alc.dao.criteria.core.price.PriceCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface PriceCollaboratorService extends  IService<Price,PriceCriteria>  {

    List<Price> findByCollaboratorId(Long id);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);




}
