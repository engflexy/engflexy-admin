package ma.zs.zyn.service.facade.admin.courseref;

import java.util.List;
import ma.zs.zyn.bean.core.courseref.CategorieSection;
import ma.zs.zyn.dao.criteria.core.courseref.CategorieSectionCriteria;
import ma.zs.zyn.zynerator.service.IService;



public interface CategorieSectionAdminService extends  IService<CategorieSection,CategorieSectionCriteria>  {

    List<CategorieSection> findBySuperCategorieSectionId(Long id);
    int deleteBySuperCategorieSectionId(Long id);
    long countBySuperCategorieSectionCode(String code);




}
