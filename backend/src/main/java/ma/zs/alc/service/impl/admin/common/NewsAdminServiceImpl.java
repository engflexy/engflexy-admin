package ma.zs.alc.service.impl.admin.common;


import ma.zs.alc.bean.core.common.News;
import ma.zs.alc.dao.criteria.core.common.NewsCriteria;
import ma.zs.alc.dao.facade.core.common.NewsDao;
import ma.zs.alc.dao.specification.core.common.NewsSpecification;
import ma.zs.alc.service.facade.admin.common.NewsAdminService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.stereotype.Service;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.admin.vocab.CollaboratorAdminService ;

@Service
public class NewsAdminServiceImpl extends AbstractServiceImpl<News, NewsCriteria, NewsDao> implements NewsAdminService {






    public News findByReferenceEntity(News t){
        return t==null? null : dao.findByRef(t.getRef());
    }
    public void findOrSaveAssociatedObject(News t){
        if( t != null) {
            t.setCollaborator(collaboratorService.findOrSave(t.getCollaborator()));
        }
    }

    public List<News> findByCollaboratorId(Long id){
        return dao.findByCollaboratorId(id);
    }
    public int deleteByCollaboratorId(Long id){
        return dao.deleteByCollaboratorId(id);
    }
    public long countByCollaboratorId(Long id){
        return dao.countByCollaboratorId(id);
    }

    public List<News> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(News.class, NewsSpecification.class);
    }


    @Autowired
    private CollaboratorAdminService collaboratorService ;

    public NewsAdminServiceImpl(NewsDao dao) {
        super(dao);
    }

}
