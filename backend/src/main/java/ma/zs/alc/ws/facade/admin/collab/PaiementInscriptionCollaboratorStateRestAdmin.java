package ma.zs.alc.ws.facade.admin.collab;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaboratorState;
import ma.zs.alc.dao.criteria.core.collab.PaiementInscriptionCollaboratorStateCriteria;
import ma.zs.alc.service.facade.admin.collab.PaiementInscriptionCollaboratorStateAdminService;
import ma.zs.alc.ws.converter.collab.PaiementInscriptionCollaboratorStateConverter;
import ma.zs.alc.ws.dto.collab.PaiementInscriptionCollaboratorStateDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.AuditEntityDto;
import ma.zs.alc.zynerator.util.PaginatedList;


import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import ma.zs.alc.zynerator.process.Result;


import org.springframework.web.multipart.MultipartFile;
import ma.zs.alc.zynerator.dto.FileTempDto;

@RestController
@RequestMapping("/api/admin/paiementInscriptionCollaboratorState/")
public class PaiementInscriptionCollaboratorStateRestAdmin  extends AbstractController<PaiementInscriptionCollaboratorState, PaiementInscriptionCollaboratorStateDto, PaiementInscriptionCollaboratorStateCriteria, PaiementInscriptionCollaboratorStateAdminService, PaiementInscriptionCollaboratorStateConverter> {



    @Operation(summary = "upload one paiementInscriptionCollaboratorState")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple paiementInscriptionCollaboratorStates")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all paiementInscriptionCollaboratorStates")
    @GetMapping("")
    public ResponseEntity<List<PaiementInscriptionCollaboratorStateDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all paiementInscriptionCollaboratorStates")
    @GetMapping("optimized")
    public ResponseEntity<List<PaiementInscriptionCollaboratorStateDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a paiementInscriptionCollaboratorState by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<PaiementInscriptionCollaboratorStateDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new PaiementInscriptionCollaboratorState(libelle));
    }

    @Operation(summary = "Saves the specified  paiementInscriptionCollaboratorState")
    @PostMapping("")
    public ResponseEntity<PaiementInscriptionCollaboratorStateDto> save(@RequestBody PaiementInscriptionCollaboratorStateDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  paiementInscriptionCollaboratorState")
    @PutMapping("")
    public ResponseEntity<PaiementInscriptionCollaboratorStateDto> update(@RequestBody PaiementInscriptionCollaboratorStateDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of paiementInscriptionCollaboratorState")
    @PostMapping("multiple")
    public ResponseEntity<List<PaiementInscriptionCollaboratorStateDto>> delete(@RequestBody List<PaiementInscriptionCollaboratorStateDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified paiementInscriptionCollaboratorState")
    @DeleteMapping("")
    public ResponseEntity<PaiementInscriptionCollaboratorStateDto> delete(@RequestBody PaiementInscriptionCollaboratorStateDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified paiementInscriptionCollaboratorState")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }


    @Operation(summary = "Finds a paiementInscriptionCollaboratorState and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<PaiementInscriptionCollaboratorStateDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds paiementInscriptionCollaboratorStates by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<PaiementInscriptionCollaboratorStateDto>> findByCriteria(@RequestBody PaiementInscriptionCollaboratorStateCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated paiementInscriptionCollaboratorStates by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody PaiementInscriptionCollaboratorStateCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports paiementInscriptionCollaboratorStates by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody PaiementInscriptionCollaboratorStateCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets paiementInscriptionCollaboratorState data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody PaiementInscriptionCollaboratorStateCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public PaiementInscriptionCollaboratorStateRestAdmin (PaiementInscriptionCollaboratorStateAdminService service, PaiementInscriptionCollaboratorStateConverter converter) {
        super(service, converter);
    }




}
