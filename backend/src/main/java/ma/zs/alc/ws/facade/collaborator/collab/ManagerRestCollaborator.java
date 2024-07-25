package ma.zs.alc.ws.facade.collaborator.collab;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.collab.Manager;
import ma.zs.alc.dao.criteria.core.collab.ManagerCriteria;
import ma.zs.alc.service.facade.collaborator.collab.ManagerCollaboratorService;
import ma.zs.alc.ws.converter.collab.ManagerConverter;
import ma.zs.alc.ws.dto.collab.ManagerDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.security.bean.User;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/collaborator/manager/")
public class ManagerRestCollaborator extends AbstractController<Manager, ManagerDto, ManagerCriteria, ManagerCollaboratorService, ManagerConverter> {



    @Operation(summary = "upload one manager")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple managers")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all managers")
    @GetMapping("")
    public ResponseEntity<List<ManagerDto>> findAll() throws Exception {
        return super.findAll();
    }



    @Operation(summary = "Saves the specified  manager")
    @PostMapping("")
    public ResponseEntity<ManagerDto> save(@RequestBody ManagerDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  manager")
    @PutMapping("")
    public ResponseEntity<ManagerDto> update(@RequestBody ManagerDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of manager")
    @PostMapping("multiple")
    public ResponseEntity<List<ManagerDto>> delete(@RequestBody List<ManagerDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified manager")
    @DeleteMapping("")
    public ResponseEntity<ManagerDto> delete(@RequestBody ManagerDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified manager")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "find by collaborator id")
    @GetMapping("collaborator/id/{id}")
    public List<ManagerDto> findByCollaboratorId(@PathVariable Long id){
        return findDtos(service.findByCollaboratorId(id));
    }
    @Operation(summary = "delete by collaborator id")
    @DeleteMapping("collaborator/id/{id}")
    public int deleteByCollaboratorId(@PathVariable Long id){
        return service.deleteByCollaboratorId(id);
    }

    @Operation(summary = "Finds a manager and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<ManagerDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds managers by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<ManagerDto>> findByCriteria(@RequestBody ManagerCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated managers by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody ManagerCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports managers by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody ManagerCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets manager data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody ManagerCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    @Operation(summary = "Change password to the specified  utilisateur")
    @PutMapping("changePassword")
    public boolean changePassword(@RequestBody User dto) throws Exception {
        return service.changePassword(dto.getUsername(),dto.getPassword());
    }
    public ManagerRestCollaborator(ManagerCollaboratorService service, ManagerConverter converter) {
        super(service, converter);
    }




}
