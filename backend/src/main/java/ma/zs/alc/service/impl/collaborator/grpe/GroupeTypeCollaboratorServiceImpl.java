package ma.zs.alc.service.impl.collaborator.grpe;


import ma.zs.alc.bean.core.grpe.GroupeType;
import ma.zs.alc.dao.criteria.core.grpe.GroupeTypeCriteria;
import ma.zs.alc.dao.facade.core.grpe.GroupeTypeDao;
import ma.zs.alc.dao.specification.core.grpe.GroupeTypeSpecification;
import ma.zs.alc.service.facade.collaborator.grpe.GroupeTypeCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class GroupeTypeCollaboratorServiceImpl extends AbstractServiceImpl<GroupeType, GroupeTypeCriteria, GroupeTypeDao> implements GroupeTypeCollaboratorService {






    public GroupeType findByReferenceEntity(GroupeType t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<GroupeType> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(GroupeType.class, GroupeTypeSpecification.class);
    }



    public GroupeTypeCollaboratorServiceImpl(GroupeTypeDao dao) {
        super(dao);
    }

}
