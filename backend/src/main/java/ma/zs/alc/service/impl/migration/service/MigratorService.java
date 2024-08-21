package ma.zs.alc.service.impl.migration.service;


import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.dao.facade.core.courseref.ContentTypeDao;
import ma.zs.alc.service.facade.admin.course.SectionAdminService;
import ma.zs.alc.service.impl.migration.dto.SectionMigration;
import ma.zs.alc.ws.dto.course.SectionDto;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

@Service
public class MigratorService {
    @Autowired
    private RestTemplate restTemplate;
    @Autowired
    private ContentTypeDao contentTypeDao;

    public int lunch() {

        String utl = "http://localhost:8090/api/admin/section";
        SectionMigration[] sectionMigrations = restTemplate.getForObject(utl, SectionMigration[].class);

        List<Section> sections = constructSections(sectionMigrations);
        if (sectionMigrations != null) {
            for (int i = 0; i < sectionMigrations.length; i++) {
                Section section = sections.get(i);
                SectionMigration sectionMigration = sectionMigrations[i];
                List<Exercice> exercices = constructExercices(sectionMigration);
                section.setExercices(exercices);
                sectionService.create(section);
            }


        }


        return 1;

    }

    private List<Exercice> constructExercices(SectionMigration sectionMigration) {
        List<Exercice> exercices = new ArrayList<>();

        if (sectionMigration != null) {
            ContentType image = contentTypeDao.findByCode("image");
            ContentType video = contentTypeDao.findByCode("video");

            if (sectionMigration.getUrlImage() != null) {
                Exercice exercice = new Exercice();
                exercice.setContent(sectionMigration.getUrlImage());
                exercice.setContentType(image);
                exercices.add(exercice);
            }
            if (sectionMigration.getUrlImage2() != null) {
                Exercice exercice = new Exercice();
                exercice.setContent(sectionMigration.getUrlImage2());
                exercice.setContentType(image);
                exercices.add(exercice);
            }
            if (sectionMigration.getUrlImage3() != null) {
                Exercice exercice = new Exercice();
                exercice.setContent(sectionMigration.getUrlImage3());
                exercice.setContentType(image);
                exercices.add(exercice);

            }
            if (sectionMigration.getUrlVideo() != null) {
                Exercice exercice = new Exercice();
                exercice.setContent(sectionMigration.getUrlVideo());
                exercice.setContentType(video);
                exercices.add(exercice);

            }
        }
        return exercices;

    }

    private List<Section> constructSections(SectionMigration[] sectionDtos) {
        List<Section> sections = new ArrayList<>();
        if (sectionDtos != null) {
            for (SectionMigration sectionDto : sectionDtos) {
                Section section = new Section();
                BeanUtils.copyProperties(sectionDto, section);
                if (sectionDto.getCours() != null) {
                    BeanUtils.copyProperties(sectionDto.getCours(), section.getCours());
                }
                sections.add(section);
            }
        }
        return sections;
    }

    private SectionAdminService sectionService;
}
