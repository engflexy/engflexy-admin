package ma.zs.alc.ws.facade.admin.inscription;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.dao.criteria.core.inscription.EtudiantCriteria;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.service.facade.admin.inscription.EtudiantAdminService;
import ma.zs.alc.ws.converter.inscription.EtudiantConverter;
import ma.zs.alc.ws.dto.inscription.EtudiantDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/admin/etudiant/")
public class EtudiantRestAdmin extends AbstractController<Etudiant, EtudiantDto, EtudiantCriteria, EtudiantAdminService, EtudiantConverter> {


    @Operation(summary = "upload one etudiant")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }

    @Operation(summary = "upload multiple etudiants")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all etudiants")
    @GetMapping("")
    public ResponseEntity<List<EtudiantDto>> findAll() throws Exception {
        return super.findAll();
    }


    @Operation(summary = "Saves the specified  etudiant")
    @PostMapping("")
    public ResponseEntity<EtudiantDto> save(@RequestBody EtudiantDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Saves the specified  etudiant")
    @PostMapping("create")
    public Etudiant create(@RequestBody Etudiant dto) throws Exception {
        return service.create(dto);
    }

    @Operation(summary = "Updates the specified  etudiant")
    @PutMapping("")
    public ResponseEntity<EtudiantDto> update(@RequestBody EtudiantDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of etudiant")
    @PostMapping("multiple")
    public ResponseEntity<List<EtudiantDto>> delete(@RequestBody List<EtudiantDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }

    @Operation(summary = "Delete the specified etudiant")
    @DeleteMapping("")
    public ResponseEntity<EtudiantDto> delete(@RequestBody EtudiantDto dto) throws Exception {
        return super.delete(dto);
    }

    @Operation(summary = "Delete the specified etudiant")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "Delete multiple etudiants by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
        return super.deleteByIdIn(ids);
    }


    @Operation(summary = "find by teacherLocality id")
    @GetMapping("teacherLocality/id/{id}")
    public List<EtudiantDto> findByTeacherLocalityId(@PathVariable Long id) {
        return findDtos(service.findByTeacherLocalityId(id));
    }

    @Operation(summary = "delete by teacherLocality id")
    @DeleteMapping("teacherLocality/id/{id}")
    public int deleteByTeacherLocalityId(@PathVariable Long id) {
        return service.deleteByTeacherLocalityId(id);
    }

    @Operation(summary = "find by parcours id")
    @GetMapping("parcours/id/{id}")
    public List<EtudiantDto> findByParcoursId(@PathVariable Long id) {
        return findDtos(service.findByParcoursId(id));
    }

    @Operation(summary = "delete by parcours id")
    @DeleteMapping("parcours/id/{id}")
    public int deleteByParcoursId(@PathVariable Long id) {
        return service.deleteByParcoursId(id);
    }

    @Operation(summary = "find by groupeEtude id")
    @GetMapping("groupeEtude/id/{id}")
    public List<EtudiantDto> findByGroupeEtudeId(@PathVariable Long id) {
        return findDtos(service.findByGroupeEtudeId(id));
    }

    @Operation(summary = "delete by groupeEtude id")
    @DeleteMapping("groupeEtude/id/{id}")
    public int deleteByGroupeEtudeId(@PathVariable Long id) {
        return service.deleteByGroupeEtudeId(id);
    }

    @Operation(summary = "find by packStudent id")
    @GetMapping("packStudent/id/{id}")
    public List<EtudiantDto> findByPackStudentId(@PathVariable Long id) {
        return findDtos(service.findByPackStudentId(id));
    }

    @Operation(summary = "delete by packStudent id")
    @DeleteMapping("packStudent/id/{id}")
    public int deleteByPackStudentId(@PathVariable Long id) {
        return service.deleteByPackStudentId(id);
    }

    @Operation(summary = "find by statutSocial id")
    @GetMapping("statutSocial/id/{id}")
    public List<EtudiantDto> findByStatutSocialId(@PathVariable Long id) {
        return findDtos(service.findByStatutSocialId(id));
    }

    @Operation(summary = "delete by statutSocial id")
    @DeleteMapping("statutSocial/id/{id}")
    public int deleteByStatutSocialId(@PathVariable Long id) {
        return service.deleteByStatutSocialId(id);
    }

    @Operation(summary = "find by interetEtudiant id")
    @GetMapping("interetEtudiant/id/{id}")
    public List<EtudiantDto> findByInteretEtudiantId(@PathVariable Long id) {
        return findDtos(service.findByInteretEtudiantId(id));
    }

    @Operation(summary = "delete by interetEtudiant id")
    @DeleteMapping("interetEtudiant/id/{id}")
    public int deleteByInteretEtudiantId(@PathVariable Long id) {
        return service.deleteByInteretEtudiantId(id);
    }

    @Operation(summary = "find by niveauEtude id")
    @GetMapping("niveauEtude/id/{id}")
    public List<EtudiantDto> findByNiveauEtudeId(@PathVariable Long id) {
        return findDtos(service.findByNiveauEtudeId(id));
    }

    @Operation(summary = "delete by niveauEtude id")
    @DeleteMapping("niveauEtude/id/{id}")
    public int deleteByNiveauEtudeId(@PathVariable Long id) {
        return service.deleteByNiveauEtudeId(id);
    }

    @Operation(summary = "find by skill id")
    @GetMapping("skill/id/{id}")
    public List<EtudiantDto> findBySkillId(@PathVariable Long id) {
        return findDtos(service.findBySkillId(id));
    }

    @Operation(summary = "delete by skill id")
    @DeleteMapping("skill/id/{id}")
    public int deleteBySkillId(@PathVariable Long id) {
        return service.deleteBySkillId(id);
    }

    @Operation(summary = "find by fonction id")
    @GetMapping("fonction/id/{id}")
    public List<EtudiantDto> findByFonctionId(@PathVariable Long id) {
        return findDtos(service.findByFonctionId(id));
    }

    @Operation(summary = "delete by fonction id")
    @DeleteMapping("fonction/id/{id}")
    public int deleteByFonctionId(@PathVariable Long id) {
        return service.deleteByFonctionId(id);
    }


    @Operation(summary = "find by collaborator id")
    @GetMapping("collaborator/id/{id}")
    public List<EtudiantDto> findByCollaboratorId(@PathVariable Long id) {
        return findDtos(service.findByCollaboratorId(id));
    }

    @Operation(summary = "delete by collaborator id")
    @DeleteMapping("collaborator/id/{id}")
    public int deleteByCollaboratorId(@PathVariable Long id) {
        return service.deleteByCollaboratorId(id);
    }

    @Operation(summary = "Finds a etudiant and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<EtudiantDto> findById(@PathVariable Long id) {
        return super.findWithAssociatedLists(id);
    }

    @Operation(summary = "Finds etudiants by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<EtudiantDto>> findByCriteria(@RequestBody EtudiantCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated etudiants by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody EtudiantCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports etudiants by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody EtudiantCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets etudiant data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody EtudiantCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }

    @GetMapping("pageable/collaborator/id/{id}")
    public Page<UserPageable> findByCollaboratorId(@PathVariable Long id,
                                                   @RequestParam("page") int page,
                                                   @RequestParam("size") int size) {
        return service.findByCollaboratorId(id, PageRequest.of(page, size));
    }

    @Operation(summary = "Change password to the specified  utilisateur")
    @PutMapping("changePassword")
    public boolean changePassword(@RequestBody User dto) throws Exception {
        return service.changePassword(dto.getUsername(), dto.getPassword());
    }

    public EtudiantRestAdmin(EtudiantAdminService service, EtudiantConverter converter) {
        super(service, converter);
    }


}
