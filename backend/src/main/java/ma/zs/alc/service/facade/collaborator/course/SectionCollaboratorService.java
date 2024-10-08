package ma.zs.alc.service.facade.collaborator.course;

import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.dao.criteria.core.course.SectionCriteria;
import ma.zs.alc.zynerator.service.IService;

import java.util.List;


public interface SectionCollaboratorService extends IService<Section, SectionCriteria> {

    List<Section> findByCoursId(Long id);

    int deleteByCoursId(Long id);

    long countByCoursCode(String code);

    public Section updateField(Section section);


}
