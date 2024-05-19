package  ma.zs.alc.ws.facade.collaborator.course;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.dao.criteria.core.course.ParcoursCriteria;
import ma.zs.alc.service.facade.collaborator.course.ParcoursCollaboratorService;
import ma.zs.alc.ws.converter.course.ParcoursConverter;
import ma.zs.alc.ws.dto.course.ParcoursDto;
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
@RequestMapping("/api/collaborator/parcours/")
public class ParcoursRestCollaborator  extends AbstractController<Parcours, ParcoursDto, ParcoursCriteria, ParcoursCollaboratorService, ParcoursConverter> {



    @Operation(summary = "upload one parcours")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple parcourss")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all parcourss")
    @GetMapping("")
    public ResponseEntity<List<ParcoursDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all parcourss")
    @GetMapping("optimized")
    public ResponseEntity<List<ParcoursDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a parcours by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<ParcoursDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new Parcours(libelle));
    }

    @Operation(summary = "Saves the specified  parcours")
    @PostMapping("")
    public ResponseEntity<ParcoursDto> save(@RequestBody ParcoursDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  parcours")
    @PutMapping("")
    public ResponseEntity<ParcoursDto> update(@RequestBody ParcoursDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of parcours")
    @PostMapping("multiple")
    public ResponseEntity<List<ParcoursDto>> delete(@RequestBody List<ParcoursDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified parcours")
    @DeleteMapping("")
    public ResponseEntity<ParcoursDto> delete(@RequestBody ParcoursDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified parcours")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple parcourss by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }


    @Operation(summary = "find by collaborator id")
    @GetMapping("collaborator/id/{id}")
    public List<ParcoursDto> findByCollaboratorId(@PathVariable Long id){
        return findDtos(service.findByCollaboratorId(id));
    }
    @Operation(summary = "delete by collaborator id")
    @DeleteMapping("collaborator/id/{id}")
    public int deleteByCollaboratorId(@PathVariable Long id){
        return service.deleteByCollaboratorId(id);
    }

    @Operation(summary = "Finds a parcours and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<ParcoursDto> findById(@PathVariable Long id) {
        return super.findWithAssociatedLists(id);
    }

    @Operation(summary = "Finds parcourss by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<ParcoursDto>> findByCriteria(@RequestBody ParcoursCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated parcourss by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody ParcoursCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports parcourss by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody ParcoursCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets parcours data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody ParcoursCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public ParcoursRestCollaborator (ParcoursCollaboratorService service, ParcoursConverter converter) {
        super(service, converter);
    }




}
