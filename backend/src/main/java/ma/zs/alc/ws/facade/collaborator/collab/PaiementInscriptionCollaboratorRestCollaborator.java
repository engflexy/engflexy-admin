package ma.zs.alc.ws.facade.collaborator.collab;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.alc.bean.core.collab.PaiementInscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PaiementInscriptionCollaboratorCriteria;
import ma.zs.alc.service.facade.collaborator.collab.PaiementInscriptionCollaboratorCollaboratorService;
import ma.zs.alc.ws.converter.collab.PaiementInscriptionCollaboratorConverter;
import ma.zs.alc.ws.dto.collab.PaiementInscriptionCollaboratorDto;
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
@RequestMapping("/api/collaborator/paiementInscriptionCollaborator/")
public class PaiementInscriptionCollaboratorRestCollaborator  extends AbstractController<PaiementInscriptionCollaborator, PaiementInscriptionCollaboratorDto, PaiementInscriptionCollaboratorCriteria, PaiementInscriptionCollaboratorCollaboratorService, PaiementInscriptionCollaboratorConverter> {



    @Operation(summary = "upload one paiementInscriptionCollaborator")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple paiementInscriptionCollaborators")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all paiementInscriptionCollaborators")
    @GetMapping("")
    public ResponseEntity<List<PaiementInscriptionCollaboratorDto>> findAll() throws Exception {
        return super.findAll();
    }



    @Operation(summary = "Saves the specified  paiementInscriptionCollaborator")
    @PostMapping("")
    public ResponseEntity<PaiementInscriptionCollaboratorDto> save(@RequestBody PaiementInscriptionCollaboratorDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  paiementInscriptionCollaborator")
    @PutMapping("")
    public ResponseEntity<PaiementInscriptionCollaboratorDto> update(@RequestBody PaiementInscriptionCollaboratorDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of paiementInscriptionCollaborator")
    @PostMapping("multiple")
    public ResponseEntity<List<PaiementInscriptionCollaboratorDto>> delete(@RequestBody List<PaiementInscriptionCollaboratorDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified paiementInscriptionCollaborator")
    @DeleteMapping("")
    public ResponseEntity<PaiementInscriptionCollaboratorDto> delete(@RequestBody PaiementInscriptionCollaboratorDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified paiementInscriptionCollaborator")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "find by inscriptionCollaborator id")
    @GetMapping("inscriptionCollaborator/id/{id}")
    public List<PaiementInscriptionCollaboratorDto> findByInscriptionCollaboratorId(@PathVariable Long id){
        return findDtos(service.findByInscriptionCollaboratorId(id));
    }
    @Operation(summary = "delete by inscriptionCollaborator id")
    @DeleteMapping("inscriptionCollaborator/id/{id}")
    public int deleteByInscriptionCollaboratorId(@PathVariable Long id){
        return service.deleteByInscriptionCollaboratorId(id);
    }
    @Operation(summary = "find by paiementInscriptionCollaboratorState code")
    @GetMapping("paiementInscriptionCollaboratorState/code/{code}")
    public List<PaiementInscriptionCollaboratorDto> findByPaiementInscriptionCollaboratorStateCode(@PathVariable String code){
        return findDtos(service.findByPaiementInscriptionCollaboratorStateCode(code));
    }
    @Operation(summary = "delete by paiementInscriptionCollaboratorState code")
    @DeleteMapping("paiementInscriptionCollaboratorState/code/{code}")
    public int deleteByPaiementInscriptionCollaboratorStateCode(@PathVariable String code){
        return service.deleteByPaiementInscriptionCollaboratorStateCode(code);
    }

    @Operation(summary = "Finds a paiementInscriptionCollaborator and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<PaiementInscriptionCollaboratorDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds paiementInscriptionCollaborators by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<PaiementInscriptionCollaboratorDto>> findByCriteria(@RequestBody PaiementInscriptionCollaboratorCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated paiementInscriptionCollaborators by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody PaiementInscriptionCollaboratorCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports paiementInscriptionCollaborators by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody PaiementInscriptionCollaboratorCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets paiementInscriptionCollaborator data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody PaiementInscriptionCollaboratorCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public PaiementInscriptionCollaboratorRestCollaborator (PaiementInscriptionCollaboratorCollaboratorService service, PaiementInscriptionCollaboratorConverter converter) {
        super(service, converter);
    }




}
