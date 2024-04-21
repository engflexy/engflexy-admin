package ma.zs.zyn.service.impl.admin.grpe;


import ma.zs.zyn.bean.core.grpe.GroupeEtat;
import ma.zs.zyn.dao.criteria.core.grpe.GroupeEtatCriteria;
import ma.zs.zyn.dao.facade.core.grpe.GroupeEtatDao;
import ma.zs.zyn.dao.specification.core.grpe.GroupeEtatSpecification;
import ma.zs.zyn.service.facade.admin.grpe.GroupeEtatAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class GroupeEtatAdminServiceImpl extends AbstractServiceImpl<GroupeEtat, GroupeEtatCriteria, GroupeEtatDao> implements GroupeEtatAdminService {






    public GroupeEtat findByReferenceEntity(GroupeEtat t){
        return  dao.findByCode(t.getCode());
    }


    public List<GroupeEtat> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(GroupeEtat.class, GroupeEtatSpecification.class);
    }



    public GroupeEtatAdminServiceImpl(GroupeEtatDao dao) {
        super(dao);
    }

}
