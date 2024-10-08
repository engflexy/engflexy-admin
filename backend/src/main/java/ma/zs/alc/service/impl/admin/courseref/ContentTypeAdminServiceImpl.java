package ma.zs.alc.service.impl.admin.courseref;


import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.dao.criteria.core.courseref.ContentTypeCriteria;
import ma.zs.alc.dao.facade.core.courseref.ContentTypeDao;
import ma.zs.alc.dao.specification.core.courseref.ContentTypeSpecification;
import ma.zs.alc.service.facade.admin.courseref.ContentTypeAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContentTypeAdminServiceImpl extends AbstractServiceImpl<ContentType, ContentTypeCriteria, ContentTypeDao> implements ContentTypeAdminService {

    @Override
    public ContentType findByCode(String code) {
        return dao.findByCode(code);
    }


    @Override
    public ContentType findOrSave(ContentType contentType) {
        ContentType loadedContentType = dao.findByCode(contentType.getCode());
        if (loadedContentType != null) {
            return loadedContentType;
        }
        return dao.save(contentType);
    }


    public ContentType findByReferenceEntity(ContentType t) {
        return (t != null && t.getCode() != null) ? dao.findByCode(t.getCode()) : null;
    }


    public List<ContentType> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(ContentType.class, ContentTypeSpecification.class);
    }


    public ContentTypeAdminServiceImpl(ContentTypeDao dao) {
        super(dao);
    }

}
