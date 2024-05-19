package ma.zs.alc.service.impl.collaborator.courseref;


import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.dao.criteria.core.courseref.ContentTypeCriteria;
import ma.zs.alc.dao.facade.core.courseref.ContentTypeDao;
import ma.zs.alc.dao.specification.core.courseref.ContentTypeSpecification;
import ma.zs.alc.service.facade.collaborator.courseref.ContentTypeCollaboratorService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class ContentTypeCollaboratorServiceImpl extends AbstractServiceImpl<ContentType, ContentTypeCriteria, ContentTypeDao> implements ContentTypeCollaboratorService {






    public ContentType findByReferenceEntity(ContentType t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<ContentType> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(ContentType.class, ContentTypeSpecification.class);
    }



    public ContentTypeCollaboratorServiceImpl(ContentTypeDao dao) {
        super(dao);
    }

}
