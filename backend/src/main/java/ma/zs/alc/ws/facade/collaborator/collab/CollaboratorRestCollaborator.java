package ma.zs.alc.ws.facade.collaborator.collab;

import io.swagger.v3.oas.annotations.Operation;

import ma.zs.alc.bean.core.collab.Collaborator;
import ma.zs.alc.bean.core.inscription.Etudiant;
import ma.zs.alc.dao.criteria.core.collab.CollaboratorCriteria;
import ma.zs.alc.service.facade.collaborator.collab.CollaboratorCollaboratorService;
import ma.zs.alc.ws.converter.collab.CollaboratorConverter;
import ma.zs.alc.ws.dto.collab.CollaboratorDto;
import ma.zs.alc.ws.dto.collab.TypeCollaboratorDto;
import ma.zs.alc.ws.dto.inscription.EtudiantDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.util.PaginatedList;


import ma.zs.alc.zynerator.security.bean.User;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import java.util.Map;


import org.springframework.web.multipart.MultipartFile;
import ma.zs.alc.zynerator.dto.FileTempDto;

@RestController
@RequestMapping("/api/collaborator/collaborator/")
public class CollaboratorRestCollaborator  extends AbstractController<Collaborator, CollaboratorDto, CollaboratorCriteria, CollaboratorCollaboratorService, CollaboratorConverter> {

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
    @PatchMapping("update-password-changed/{id}")
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
    @PatchMapping("communicationEnabled/{id}")
    public ResponseEntity<Boolean> onCommunicationEnabled(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean communicationEnabled = status.get("communicationEnabled");
        if (communicationEnabled == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.onCommunicationEnabled(id, communicationEnabled);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("securityEnabled/{id}")
    public ResponseEntity<Boolean> onSecurityEnabled(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean securityEnabled = status.get("securityEnabled");
        if (securityEnabled == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.onSecurityEnabled(id, securityEnabled);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("lessonReminderEnabled/{id}")
    public ResponseEntity<Boolean> onLessonReminderEnabled(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean lessonReminderEnabled = status.get("lessonReminderEnabled");
        if (lessonReminderEnabled == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.onLessonReminderEnabled(id, lessonReminderEnabled);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("classroomEnabled/{id}")
    public ResponseEntity<Boolean> onClassroomEnabled(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean classroomEnabled = status.get("classroomEnabled");
        if (classroomEnabled == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.onClassroomEnabled(id, classroomEnabled);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("passwordChangedNotificationEnabled/{id}")
    public ResponseEntity<Boolean> onPasswordChangedNotificationEnabled(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean passwordChangedNotificationEnabled = status.get("passwordChangedNotificationEnabled");
        if (passwordChangedNotificationEnabled == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.onPasswordChangedNotificationEnabled(id, passwordChangedNotificationEnabled);
        return ResponseEntity.ok(updated);
    }
    @PatchMapping("contactNotificationEnabled/{id}")
    public ResponseEntity<Boolean> onContactNotificationEnabled(@PathVariable Long id, @RequestBody Map<String, Boolean> status) {
        Boolean contactNotificationEnabled = status.get("contactNotificationEnabled");
        if (contactNotificationEnabled == null) {
            return ResponseEntity.badRequest().body(false);
        }
        boolean updated = service.onContactNotificationEnabled(id, contactNotificationEnabled);
        return ResponseEntity.ok(updated);
    }


    @Operation(summary = "upload one collaborator")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple collaborators")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all collaborators")
    @GetMapping("")
    public ResponseEntity<List<CollaboratorDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all collaborators")
    @GetMapping("optimized")
    public ResponseEntity<List<CollaboratorDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }



    @Operation(summary = "Saves the specified  collaborator")
    @PostMapping("")
    public ResponseEntity<CollaboratorDto> save(@RequestBody CollaboratorDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  collaborator")
    @PutMapping("")
    public ResponseEntity<CollaboratorDto> update(@RequestBody CollaboratorDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of collaborator")
    @PostMapping("multiple")
    public ResponseEntity<List<CollaboratorDto>> delete(@RequestBody List<CollaboratorDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified collaborator")
    @DeleteMapping("")
    public ResponseEntity<CollaboratorDto> delete(@RequestBody CollaboratorDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified collaborator")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple collaborators by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }


    @Operation(summary = "find by typeCollaborator id")
    @GetMapping("typeCollaborator/id/{id}")
    public List<CollaboratorDto> findByTypeCollaboratorId(@PathVariable Long id){
        return findDtos(service.findByTypeCollaboratorId(id));
    }
    @Operation(summary = "delete by typeCollaborator id")
    @DeleteMapping("typeCollaborator/id/{id}")
    public int deleteByTypeCollaboratorId(@PathVariable Long id){
        return service.deleteByTypeCollaboratorId(id);
    }

    @Operation(summary = "Finds a collaborator and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<CollaboratorDto> findById(@PathVariable Long id) {
        return super.findWithAssociatedLists(id);
    }
    @Operation(summary = "Finds a collab and associated list by id")
    @GetMapping("/username/{email}")
    public ResponseEntity<CollaboratorDto> findByUsername(@PathVariable String email) {
        Collaborator t = service.findByUsername(email);
        if (t != null) {
            converter.initObject(true);
            converter.initList(false);
            CollaboratorDto dto = converter.toDto(t);

            return ResponseEntity.ok(dto);
        } else {
            return ResponseEntity.notFound().build();
        }
    }


    @Operation(summary = "Finds collaborators by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<CollaboratorDto>> findByCriteria(@RequestBody CollaboratorCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated collaborators by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody CollaboratorCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports collaborators by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody CollaboratorCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets collaborator data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody CollaboratorCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    @Operation(summary = "Change password to the specified  utilisateur")
    @PutMapping("changePassword")
    public boolean changePassword(@RequestBody User dto) throws Exception {
        return service.changePassword(dto.getUsername(),dto.getPassword());
    }
    public CollaboratorRestCollaborator (CollaboratorCollaboratorService service, CollaboratorConverter converter) {
        super(service, converter);
    }




}
