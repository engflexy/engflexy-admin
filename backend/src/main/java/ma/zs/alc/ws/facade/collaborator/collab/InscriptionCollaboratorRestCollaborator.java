package ma.zs.alc.ws.facade.collaborator.collab;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.alc.bean.core.collab.InscriptionCollaborator;
import ma.zs.alc.dao.criteria.core.collab.InscriptionCollaboratorCriteria;
import ma.zs.alc.service.facade.collaborator.collab.InscriptionCollaboratorCollaboratorService;
import ma.zs.alc.ws.converter.collab.InscriptionCollaboratorConverter;
import ma.zs.alc.ws.dto.collab.InscriptionCollaboratorDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.AuditEntityDto;
import ma.zs.alc.zynerator.util.PaginatedList;


import org.springframework.core.io.InputStreamResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import ma.zs.alc.zynerator.process.Result;


import org.springframework.web.multipart.MultipartFile;
import ma.zs.alc.zynerator.dto.FileTempDto;

@RestController
@RequestMapping("/api/collaborator/inscriptionCollaborator/")
public class InscriptionCollaboratorRestCollaborator  extends AbstractController<InscriptionCollaborator, InscriptionCollaboratorDto, InscriptionCollaboratorCriteria, InscriptionCollaboratorCollaboratorService, InscriptionCollaboratorConverter> {



    @Operation(summary = "upload one inscriptionCollaborator")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple inscriptionCollaborators")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all inscriptionCollaborators")
    @GetMapping("")
    public ResponseEntity<List<InscriptionCollaboratorDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds a list of all CollaboratorSchool")
    @GetMapping("school")
    public Page<InscriptionCollaborator> findByCollaboratorTypeCollaboratorIdSchool(@RequestParam("size") int size, @RequestParam("page") int page) throws Exception {
        return service.findByCollaboratorTypeCollaboratorIdSchool(PageRequest.of(page,size));
    }

    @Operation(summary = "Finds a list of all CollaboratorTeacher")
    @GetMapping("teacher")
    public Page<InscriptionCollaborator> findByCollaboratorTypeCollaboratorIdTeacher(@RequestParam("size") int size, @RequestParam("page") int page) throws Exception {
        return service.findByCollaboratorTypeCollaboratorIdTeacher(PageRequest.of(page,size));
    }


    @Operation(summary = "Saves the specified  inscriptionCollaborator")
    @PostMapping("")
    public ResponseEntity<InscriptionCollaboratorDto> save(@RequestBody InscriptionCollaboratorDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  inscriptionCollaborator")
    @PutMapping("")
    public ResponseEntity<InscriptionCollaboratorDto> update(@RequestBody InscriptionCollaboratorDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of inscriptionCollaborator")
    @PostMapping("multiple")
    public ResponseEntity<List<InscriptionCollaboratorDto>> delete(@RequestBody List<InscriptionCollaboratorDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified inscriptionCollaborator")
    @DeleteMapping("")
    public ResponseEntity<InscriptionCollaboratorDto> delete(@RequestBody InscriptionCollaboratorDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified inscriptionCollaborator")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "find by packageCollaborator id")
    @GetMapping("packageCollaborator/id/{id}")
    public List<InscriptionCollaboratorDto> findByPackageCollaboratorId(@PathVariable Long id){
        return findDtos(service.findByPackageCollaboratorId(id));
    }
    @Operation(summary = "delete by packageCollaborator id")
    @DeleteMapping("packageCollaborator/id/{id}")
    public int deleteByPackageCollaboratorId(@PathVariable Long id){
        return service.deleteByPackageCollaboratorId(id);
    }
    @Operation(summary = "find by collaborator id")
    @GetMapping("collaborator/id/{id}")
    public List<InscriptionCollaboratorDto> findByCollaboratorId(@PathVariable Long id){
        return findDtos(service.findByCollaboratorId(id));
    }
    @Operation(summary = "delete by collaborator id")
    @DeleteMapping("collaborator/id/{id}")
    public int deleteByCollaboratorId(@PathVariable Long id){
        return service.deleteByCollaboratorId(id);
    }
    @Operation(summary = "find by inscriptionCollaboratorState code")
    @GetMapping("inscriptionCollaboratorState/code/{code}")
    public List<InscriptionCollaboratorDto> findByInscriptionCollaboratorStateCode(@PathVariable String code){
        return findDtos(service.findByInscriptionCollaboratorStateCode(code));
    }
    @Operation(summary = "delete by inscriptionCollaboratorState code")
    @DeleteMapping("inscriptionCollaboratorState/code/{code}")
    public int deleteByInscriptionCollaboratorStateCode(@PathVariable String code){
        return service.deleteByInscriptionCollaboratorStateCode(code);
    }

    @Operation(summary = "Finds a inscriptionCollaborator and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<InscriptionCollaboratorDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds inscriptionCollaborators by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<InscriptionCollaboratorDto>> findByCriteria(@RequestBody InscriptionCollaboratorCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated inscriptionCollaborators by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody InscriptionCollaboratorCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports inscriptionCollaborators by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody InscriptionCollaboratorCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets inscriptionCollaborator data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody InscriptionCollaboratorCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public InscriptionCollaboratorRestCollaborator (InscriptionCollaboratorCollaboratorService service, InscriptionCollaboratorConverter converter) {
        super(service, converter);
    }




}
