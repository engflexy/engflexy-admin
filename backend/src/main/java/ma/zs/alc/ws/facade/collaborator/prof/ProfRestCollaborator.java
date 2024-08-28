package ma.zs.alc.ws.facade.collaborator.prof;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.bean.core.prof.Prof;
import ma.zs.alc.dao.criteria.core.prof.ProfCriteria;
import ma.zs.alc.dao.facade.core.inscription.UserPageable;
import ma.zs.alc.service.facade.collaborator.prof.ProfCollaboratorService;
import ma.zs.alc.ws.converter.inscription.EtudiantConverter;
import ma.zs.alc.ws.converter.prof.ProfConverter;
import ma.zs.alc.ws.dto.inscription.EtudiantDto;
import ma.zs.alc.ws.dto.prof.ProfDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/collaborator/prof/")
public class ProfRestCollaborator extends AbstractController<Prof, ProfDto, ProfCriteria, ProfCollaboratorService, ProfConverter> {
    @Operation(summary = "Change password to the specified  utilisateur")
    @PutMapping("/change-password")
    public ResponseEntity<Boolean> changePassword(@RequestBody Map<String, String> request) {
        String username = request.get("username");
        String newPassword = request.get("newPassword");
        if (username == null || newPassword == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.changePassword(username, newPassword);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("update-teacher-password-changed/{id}")
    public ResponseEntity<Boolean> updatePasswordChangedStatus(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean passwordChanged = status.get("passwordChanged");
        if (passwordChanged == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.updatePasswordChangedStatus(id, passwordChanged);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("update-lock-status/{id}")
    public ResponseEntity<Boolean> updateAccountLockStatus(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean accountNonLocked = status.get("accountNonLocked");
        if (accountNonLocked == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.updateAccountLockStatus(id, accountNonLocked);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("update-credentials-non-expired/{id}")
    public ResponseEntity<Boolean> updateCredentialsNonExpiredStatus(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean credentialsNonExpired = status.get("credentialsNonExpired");
        if (credentialsNonExpired == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.updateCredentialsNonExpiredStatus(id, credentialsNonExpired);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("update-status/{id}")
    public ResponseEntity<Boolean> updateAccountStatus(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean enabled = status.get("enabled");
        if (enabled == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.updateAccountStatus(id, enabled);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("update-account-non-expired/{id}")
    public ResponseEntity<Boolean> updateAccountNonExpiredStatus(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean accountNonExpired = status.get("accountNonExpired");
        if (accountNonExpired == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.updateAccountNonExpiredStatus(id, accountNonExpired);
        return ResponseEntity.ok(updated);
    }
    @Operation(summary = "upload one prof")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }

    @Operation(summary = "upload multiple profs")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all profs")
    @GetMapping("")
    public ResponseEntity<List<ProfDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all profs")
    @GetMapping("optimized")
    public ResponseEntity<List<ProfDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a prof by ref")
    @GetMapping("ref/{ref}")
    public ResponseEntity<ProfDto> findByRef(@PathVariable String ref) {
        return super.findByReferenceEntity(new Prof(ref));
    }

    @Operation(summary = "Saves the specified  prof")
    @PostMapping("")
    public Prof save(@RequestBody Prof dto) throws Exception {
        return service.create(dto);
    }
    @PostMapping("create")
    public Prof create(@RequestBody Prof dto) throws Exception {
        return service.create(dto);
    }
    @Operation(summary = "Updates the specified  prof")
    @PutMapping("")
    public ResponseEntity<Prof> update(@RequestBody Prof dto) throws Exception {

        try {
            Prof updatedProf = service.update(dto);
            return ResponseEntity.ok(updatedProf);
        } catch (Exception e) {
            // Log the exception and return a meaningful error response
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(null);
        }

    }
    @Operation(summary = "Delete list of prof")
    @PostMapping("multiple")
    public ResponseEntity<List<ProfDto>> delete(@RequestBody List<ProfDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }

    @Operation(summary = "Delete the specified prof")
    @DeleteMapping("")
    public ResponseEntity<ProfDto> delete(@RequestBody ProfDto dto) throws Exception {
        return super.delete(dto);
    }

    @Operation(summary = "Delete the specified prof")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "Delete multiple profs by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
        return super.deleteByIdIn(ids);
    }


    @Operation(summary = "find by parcours id")
    @GetMapping("parcours/id/{id}")
    public List<ProfDto> findByParcoursId(@PathVariable Long id) {
        return findDtos(service.findByParcoursId(id));
    }

    @Operation(summary = "delete by parcours id")
    @DeleteMapping("parcours/id/{id}")
    public int deleteByParcoursId(@PathVariable Long id) {
        return service.deleteByParcoursId(id);
    }

    @Operation(summary = "find by categorieProf id")
    @GetMapping("categorieProf/id/{id}")
    public List<ProfDto> findByCategorieProfId(@PathVariable Long id) {
        return findDtos(service.findByCategorieProfId(id));
    }

    @Operation(summary = "delete by categorieProf id")
    @DeleteMapping("categorieProf/id/{id}")
    public int deleteByCategorieProfId(@PathVariable Long id) {
        return service.deleteByCategorieProfId(id);
    }

    @Operation(summary = "find by typeTeacher id")
    @GetMapping("typeTeacher/id/{id}")
    public List<ProfDto> findByTypeTeacherId(@PathVariable Long id) {
        return findDtos(service.findByTypeTeacherId(id));
    }

    @Operation(summary = "delete by typeTeacher id")
    @DeleteMapping("typeTeacher/id/{id}")
    public int deleteByTypeTeacherId(@PathVariable Long id) {
        return service.deleteByTypeTeacherId(id);
    }

    @Operation(summary = "find by collaborator id")
    @GetMapping("collaborator/id/{id}")
    public List<ProfDto> findByCollaboratorId(@PathVariable Long id) {
        return findDtos(service.findByCollaboratorId(id));
    }

    @GetMapping("pageable/collaborator/id/{id}")
    public Page<UserPageable> findByCollaboratorId(@PathVariable Long id, @RequestParam("page") int page, @RequestParam("size") int size) {
        return service.findByCollaboratorId(id, PageRequest.of(page, size));
    }
    @GetMapping("username/{email}")
    public List<EtudiantDto> findAssociatedEtudiant(@PathVariable String email) {
        List<Etudiant> associatedEtudiant = service.findAssociatedEtudiant(email);
        etudiantConverter.init(false);

        List<EtudiantDto> dto = etudiantConverter.toDto(associatedEtudiant);
        return dto;
    }

    @Operation(summary = "delete by collaborator id")
    @DeleteMapping("collaborator/id/{id}")
    public int deleteByCollaboratorId(@PathVariable Long id) {
        return service.deleteByCollaboratorId(id);
    }

    @Operation(summary = "Finds a prof and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<ProfDto> findById(@PathVariable Long id) {
        return super.findWithAssociatedLists(id);
    }

    @Operation(summary = "Finds profs by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<ProfDto>> findByCriteria(@RequestBody ProfCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated profs by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody ProfCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports profs by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody ProfCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets prof data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody ProfCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }

    @Autowired
    EtudiantConverter etudiantConverter;


    public ProfRestCollaborator(ProfCollaboratorService service, ProfConverter converter) {
        super(service, converter);
    }


}
