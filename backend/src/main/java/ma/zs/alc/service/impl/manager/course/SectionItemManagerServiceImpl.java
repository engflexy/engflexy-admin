package ma.zs.alc.service.impl.manager.course;


import ma.zs.alc.bean.core.course.SectionItem;
import ma.zs.alc.dao.criteria.core.course.SectionItemCriteria;
import ma.zs.alc.dao.facade.core.course.SectionItemDao;
import ma.zs.alc.dao.specification.core.course.SectionItemSpecification;
import ma.zs.alc.service.facade.manager.course.SectionItemManagerService;
import ma.zs.alc.service.facade.manager.course.SectionManagerService;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SectionItemManagerServiceImpl extends AbstractServiceImpl<SectionItem, SectionItemCriteria, SectionItemDao> implements SectionItemManagerService {







    public void findOrSaveAssociatedObject(SectionItem t){
        if( t != null) {
            t.setSection(sectionService.findOrSave(t.getSection()));
        }
    }

    public List<SectionItem> findBySectionId(Long id){
        return dao.findBySectionId(id);
    }
    public int deleteBySectionId(Long id){
        return dao.deleteBySectionId(id);
    }
    public long countBySectionCode(String code){
        return dao.countBySectionCode(code);
    }






    public void configure() {
        super.configure(SectionItem.class, SectionItemSpecification.class);
    }


    @Autowired
    private SectionManagerService sectionService ;

    public SectionItemManagerServiceImpl(SectionItemDao dao) {
        super(dao);
    }

}
