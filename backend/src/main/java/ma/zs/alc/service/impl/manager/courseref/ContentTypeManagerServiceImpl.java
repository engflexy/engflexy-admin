package ma.zs.alc.service.impl.manager.courseref;


import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.dao.criteria.core.courseref.ContentTypeCriteria;
import ma.zs.alc.dao.facade.core.courseref.ContentTypeDao;
import ma.zs.alc.dao.specification.core.courseref.ContentTypeSpecification;
import ma.zs.alc.service.facade.manager.courseref.ContentTypeManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;

import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ContentTypeManagerServiceImpl extends AbstractServiceImpl<ContentType, ContentTypeCriteria, ContentTypeDao> implements ContentTypeManagerService {







    public ContentType findByReferenceEntity(ContentType t){
        return t==null? null : dao.findByCode(t.getCode());
    }


    public List<ContentType> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(ContentType.class, ContentTypeSpecification.class);
    }



    public ContentTypeManagerServiceImpl(ContentTypeDao dao) {
        super(dao);
    }

}
