package  ma.zs.alc.ws.facade.admin.prof;

import io.swagger.v3.oas.annotations.Operation;

import ma.zs.alc.bean.core.common.TypeCollaborator;
import ma.zs.alc.dao.criteria.core.prof.TypeCollaboratorCriteria;
import ma.zs.alc.service.facade.admin.prof.TypeCollaboratorAdminService;
import ma.zs.alc.ws.converter.prof.TypeCollaboratorConverter;
import ma.zs.alc.ws.dto.prof.TypeCollaboratorDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.util.PaginatedList;


import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;


import org.springframework.web.multipart.MultipartFile;
import ma.zs.alc.zynerator.dto.FileTempDto;

@RestController
@RequestMapping("/api/admin/typeCollaborator/")
public class TypeCollaboratorRestAdmin  extends AbstractController<TypeCollaborator, TypeCollaboratorDto, TypeCollaboratorCriteria, TypeCollaboratorAdminService, TypeCollaboratorConverter> {



    @Operation(summary = "upload one typeCollaborator")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple typeCollaborators")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all typeCollaborators")
    @GetMapping("")
    public ResponseEntity<List<TypeCollaboratorDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all typeCollaborators")
    @GetMapping("optimized")
    public ResponseEntity<List<TypeCollaboratorDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a typeCollaborator by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<TypeCollaboratorDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new TypeCollaborator(libelle));
    }

    @Operation(summary = "Saves the specified  typeCollaborator")
    @PostMapping("")
    public ResponseEntity<TypeCollaboratorDto> save(@RequestBody TypeCollaboratorDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  typeCollaborator")
    @PutMapping("")
    public ResponseEntity<TypeCollaboratorDto> update(@RequestBody TypeCollaboratorDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of typeCollaborator")
    @PostMapping("multiple")
    public ResponseEntity<List<TypeCollaboratorDto>> delete(@RequestBody List<TypeCollaboratorDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified typeCollaborator")
    @DeleteMapping("")
    public ResponseEntity<TypeCollaboratorDto> delete(@RequestBody TypeCollaboratorDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified typeCollaborator")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple typeCollaborators by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }



    @Operation(summary = "Finds a typeCollaborator and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<TypeCollaboratorDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds typeCollaborators by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<TypeCollaboratorDto>> findByCriteria(@RequestBody TypeCollaboratorCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated typeCollaborators by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody TypeCollaboratorCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports typeCollaborators by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody TypeCollaboratorCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets typeCollaborator data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody TypeCollaboratorCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public TypeCollaboratorRestAdmin (TypeCollaboratorAdminService service, TypeCollaboratorConverter converter) {
        super(service, converter);
    }




}
