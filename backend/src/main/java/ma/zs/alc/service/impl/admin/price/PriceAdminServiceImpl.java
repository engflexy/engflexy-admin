package ma.zs.alc.service.impl.admin.price;


import ma.zs.alc.bean.core.price.Price;
import ma.zs.alc.dao.criteria.core.price.PriceCriteria;
import ma.zs.alc.dao.facade.core.price.PriceDao;
import ma.zs.alc.dao.specification.core.price.PriceSpecification;
import ma.zs.alc.service.facade.admin.price.PriceAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.admin.collab.CollaboratorAdminService;

@Service
public class PriceAdminServiceImpl extends AbstractServiceImpl<Price, PriceCriteria, PriceDao> implements PriceAdminService {






    public void findOrSaveAssociatedObject(Price t){
        if( t != null) {
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<Price> findByCollaboratorId(Long id){
        return dao.findByCollaboratorId(id);
    }
    public int deleteByCollaboratorId(Long id){
        return dao.deleteByCollaboratorId(id);
    }
    public long countByCollaboratorId(Long id){
        return dao.countByCollaboratorId(id);
    }

    public List<Price> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(Price.class, PriceSpecification.class);
    }


    @Autowired
    private CollaboratorAdminService collaboratorService ;

    public PriceAdminServiceImpl(PriceDao dao) {
        super(dao);
    }

}
