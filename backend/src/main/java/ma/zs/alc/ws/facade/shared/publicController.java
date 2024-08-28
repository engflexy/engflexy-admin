package ma.zs.alc.ws.facade.shared;

import ma.zs.alc.bean.core.collab.TypeCollaborator;
import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.bean.core.grpe.GroupeEtude;
import ma.zs.alc.bean.core.inscriptionref.*;
import ma.zs.alc.bean.core.pack.PackStudent;
import ma.zs.alc.bean.core.prof.TypeTeacher;
import ma.zs.alc.dao.facade.core.collab.TypeCollaboratorDao;
import ma.zs.alc.dao.facade.core.course.ParcoursDao;
import ma.zs.alc.dao.facade.core.grpe.GroupeEtudeDao;
import ma.zs.alc.dao.facade.core.inscriptionref.*;
import ma.zs.alc.dao.facade.core.pack.PackStudentDao;
import ma.zs.alc.dao.facade.core.prof.TypeTeacherDao;
import ma.zs.alc.util.ImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import static ma.zs.alc.util.UtilConstant.FORWARD_SLASH;
import static ma.zs.alc.util.UtilConstant.IMAGE_FOLDER;
import static org.springframework.http.MediaType.IMAGE_JPEG_VALUE;


@RestController
@RequestMapping("/app/images")
public class publicController {

    @PostMapping(value = "/generate-image-url/{fileName}",
            consumes = {"multipart/form-data", MediaType.APPLICATION_JSON_VALUE})
    public String generate_img_url(@PathVariable String fileName,
                                   @RequestParam(value = "img") MultipartFile img) throws IOException {
        return ImageUtil.generate_img_url(fileName, img);
    }

    @GetMapping(path = "{entity}/{imageName}", produces = IMAGE_JPEG_VALUE)
    public byte[] getProfileImage(@PathVariable("entity") String entity,
                                  @PathVariable("imageName") String image) throws IOException {
        return Files.readAllBytes(Paths.get(IMAGE_FOLDER + entity + FORWARD_SLASH + image));
    }


    @GetMapping("optimized/fonction")
    public List<Fonction> findAllFonction() {
        return fonctionDao.findAllOptimized();
    }

    @GetMapping("optimized/teacher-locality")
    public List<TeacherLocality> findTeacherLocality() {
        return teacherLocalityDao.findAllOptimized();
    }

    @GetMapping("optimized/skill")
    public List<Skill> findAllSkill() {
        return skillDao.findAllOptimized();
    }

    @GetMapping("optimized/niveau")
    public List<NiveauEtude> findAllNiveau() {
        return niveauEtudeDao.findAllOptimized();
    }


    @GetMapping("optimized/interets")
    public List<InteretEtudiant> findAllInterets() {
        return interetEtudiantDao.findAllOptimized();
    }


    @GetMapping("optimized/status")
    public List<StatutSocial> findAllStatus() {
        return statutSocialDao.findAllOptimized();
    }

    @GetMapping("optimized/group-student")
    public List<GroupeEtude> findAllGroupeEtude() {
        return groupeEtudeDao.findAllOptimized();
    }


    @GetMapping("optimized/levels")
    public List<Parcours> findAllParcours() {
        return parcoursDao.findAllOptimized();
    }

    @GetMapping("optimized/packs")
    public List<PackStudent> findAllPacks() {
        return packStudentDao.findAllOptimized();
    }

    @GetMapping("optimized/languages")
    public List<Langue> findAllLanguages() {
        return langueDao.findAllOptimized();
    }
    @GetMapping("optimized/types")
    public List<TypeCollaborator> findAllTypes() {
        return typeCollaboratorDao.findAllOptimized();
    }


    @Autowired
    private ParcoursDao parcoursDao;

    @Autowired
    private TypeTeacherDao typeTeacherDao;

    @Autowired
    private GroupeEtudeDao groupeEtudeDao;

    @Autowired
    private PackStudentDao packStudentDao;

    @Autowired
    private StatutSocialDao statutSocialDao;

    @Autowired
    private InteretEtudiantDao interetEtudiantDao;

    @Autowired
    private NiveauEtudeDao niveauEtudeDao;

    @Autowired
    private SkillDao skillDao;

    @Autowired
    private FonctionDao fonctionDao;

    @Autowired
    private LangueDao langueDao;
    @Autowired
    private TypeCollaboratorDao typeCollaboratorDao;

    @Autowired
    private TeacherLocalityDao teacherLocalityDao;
}
