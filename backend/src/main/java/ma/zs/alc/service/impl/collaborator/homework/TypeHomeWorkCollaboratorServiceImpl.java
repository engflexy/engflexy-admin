package ma.zs.alc.service.impl.collaborator.homework;


import ma.zs.alc.bean.core.homework.TypeHomeWork;
import ma.zs.alc.dao.criteria.core.homework.TypeHomeWorkCriteria;
import ma.zs.alc.dao.facade.core.homework.TypeHomeWorkDao;
import ma.zs.alc.dao.specification.core.homework.TypeHomeWorkSpecification;
import ma.zs.alc.service.facade.collaborator.homework.TypeHomeWorkCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class TypeHomeWorkCollaboratorServiceImpl extends AbstractServiceImpl<TypeHomeWork, TypeHomeWorkCriteria, TypeHomeWorkDao> implements TypeHomeWorkCollaboratorService {






    public TypeHomeWork findByReferenceEntity(TypeHomeWork t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<TypeHomeWork> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(TypeHomeWork.class, TypeHomeWorkSpecification.class);
    }



    public TypeHomeWorkCollaboratorServiceImpl(TypeHomeWorkDao dao) {
        super(dao);
    }

}
