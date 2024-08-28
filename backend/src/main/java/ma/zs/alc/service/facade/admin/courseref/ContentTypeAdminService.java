package ma.zs.alc.service.facade.admin.courseref;

import java.util.List;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.dao.criteria.core.courseref.ContentTypeCriteria;
import ma.zs.alc.zynerator.service.IService;



public interface ContentTypeAdminService extends  IService<ContentType,ContentTypeCriteria>  {


    ContentType findByCode(String code);
}
