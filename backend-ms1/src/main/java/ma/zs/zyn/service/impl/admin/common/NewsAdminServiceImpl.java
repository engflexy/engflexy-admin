package ma.zs.zyn.service.impl.admin.common;


import ma.zs.zyn.bean.core.common.News;
import ma.zs.zyn.dao.criteria.core.common.NewsCriteria;
import ma.zs.zyn.dao.facade.core.common.NewsDao;
import ma.zs.zyn.dao.specification.core.common.NewsSpecification;
import ma.zs.zyn.service.facade.admin.common.NewsAdminService;
import ma.zs.zyn.zynerator.service.AbstractServiceImpl;
import ma.zs.zyn.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;





import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;
@Service
public class NewsAdminServiceImpl extends AbstractServiceImpl<News, NewsCriteria, NewsDao> implements NewsAdminService {






    public News findByReferenceEntity(News t){
        return  dao.findByRef(t.getRef());
    }


    public List<News> findAllOptimized() {
        return dao.findAllOptimized();
    }





    public void configure() {
        super.configure(News.class, NewsSpecification.class);
    }



    public NewsAdminServiceImpl(NewsDao dao) {
        super(dao);
    }

}
