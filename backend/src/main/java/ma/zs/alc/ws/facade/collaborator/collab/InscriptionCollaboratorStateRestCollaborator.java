package ma.zs.alc.ws.facade.collaborator.collab;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.collab.InscriptionCollaboratorState;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorStateCriteria;
import ma.zs.alc.service.facade.admin.collab.InscriptionCollaboratorStateAdminService;
import ma.zs.alc.ws.converter.collab.InscriptionCollaboratorStateConverter;
import ma.zs.alc.ws.dto.collab.InscriptionCollaboratorStateDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/collaborator/inscriptionCollaboratorState/")
public class InscriptionCollaboratorStateRestCollaborator extends AbstractController<InscriptionCollaboratorState, InscriptionCollaboratorStateDto, InscriptionCollaboratorStateCriteria, InscriptionCollaboratorStateAdminService, InscriptionCollaboratorStateConverter> {



    @Operation(summary = "upload one inscriptionCollaboratorState")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple inscriptionCollaboratorStates")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all inscriptionCollaboratorStates")
    @GetMapping("")
    public ResponseEntity<List<InscriptionCollaboratorStateDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all inscriptionCollaboratorStates")
    @GetMapping("optimized")
    public ResponseEntity<List<InscriptionCollaboratorStateDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a inscriptionCollaboratorState by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<InscriptionCollaboratorStateDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new InscriptionCollaboratorState(libelle));
    }

    @Operation(summary = "Saves the specified  inscriptionCollaboratorState")
    @PostMapping("")
    public ResponseEntity<InscriptionCollaboratorStateDto> save(@RequestBody InscriptionCollaboratorStateDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  inscriptionCollaboratorState")
    @PutMapping("")
    public ResponseEntity<InscriptionCollaboratorStateDto> update(@RequestBody InscriptionCollaboratorStateDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of inscriptionCollaboratorState")
    @PostMapping("multiple")
    public ResponseEntity<List<InscriptionCollaboratorStateDto>> delete(@RequestBody List<InscriptionCollaboratorStateDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified inscriptionCollaboratorState")
    @DeleteMapping("")
    public ResponseEntity<InscriptionCollaboratorStateDto> delete(@RequestBody InscriptionCollaboratorStateDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified inscriptionCollaboratorState")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }


    @Operation(summary = "Finds a inscriptionCollaboratorState and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<InscriptionCollaboratorStateDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds inscriptionCollaboratorStates by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<InscriptionCollaboratorStateDto>> findByCriteria(@RequestBody InscriptionCollaboratorStateCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated inscriptionCollaboratorStates by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody InscriptionCollaboratorStateCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports inscriptionCollaboratorStates by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody InscriptionCollaboratorStateCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets inscriptionCollaboratorState data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody InscriptionCollaboratorStateCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public InscriptionCollaboratorStateRestCollaborator(InscriptionCollaboratorStateAdminService service, InscriptionCollaboratorStateConverter converter) {
        super(service, converter);
    }




}
