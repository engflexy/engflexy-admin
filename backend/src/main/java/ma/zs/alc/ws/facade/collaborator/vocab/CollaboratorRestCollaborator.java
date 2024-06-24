package  ma.zs.alc.ws.facade.collaborator.vocab;

import io.swagger.v3.oas.annotations.Operation;

import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.dao.criteria.core.vocab.CollaboratorCriteria;
import ma.zs.alc.service.facade.collaborator.vocab.CollaboratorCollaboratorService;
import ma.zs.alc.ws.converter.vocab.CollaboratorConverter;
import ma.zs.alc.ws.dto.vocab.CollaboratorDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.util.PaginatedList;


import ma.zs.alc.zynerator.security.bean.User;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;


import org.springframework.web.multipart.MultipartFile;
import ma.zs.alc.zynerator.dto.FileTempDto;

@RestController
@RequestMapping("/api/collaborator/collaborator/")
public class CollaboratorRestCollaborator  extends AbstractController<Collaborator, CollaboratorDto, CollaboratorCriteria, CollaboratorCollaboratorService, CollaboratorConverter> {



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
