package ma.zs.alc.service.facade.manager.common;

import ma.zs.alc.bean.core.common.News;
import ma.zs.alc.dao.criteria.core.common.NewsCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;



public interface NewsManagerService extends  IService<News,NewsCriteria>  {

    List<News> findByCollaboratorId(Long id);
    int deleteByCollaboratorId(Long id);
    long countByCollaboratorId(Long id);




}
