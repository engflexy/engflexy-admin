package ma.zs.alc.ws.facade.admin.collab;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.dao.criteria.core.collab.PackageCollaboratorCriteria;
import ma.zs.alc.service.facade.admin.collab.PackageCollaboratorAdminService;
import ma.zs.alc.ws.converter.collab.PackageCollaboratorConverter;
import ma.zs.alc.ws.dto.collab.PackageCollaboratorDto;
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
@RequestMapping("/api/admin/packageCollaborator/")
public class PackageCollaboratorRestAdmin  extends AbstractController<PackageCollaborator, PackageCollaboratorDto, PackageCollaboratorCriteria, PackageCollaboratorAdminService, PackageCollaboratorConverter> {



    @Operation(summary = "upload one packageCollaborator")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple packageCollaborators")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all packageCollaborators")
    @GetMapping("")
    public ResponseEntity<List<PackageCollaboratorDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all packageCollaborators")
    @GetMapping("optimized")
    public ResponseEntity<List<PackageCollaboratorDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a packageCollaborator by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<PackageCollaboratorDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new PackageCollaborator(libelle));
    }

    @Operation(summary = "Saves the specified  packageCollaborator")
    @PostMapping("")
    public ResponseEntity<PackageCollaboratorDto> save(@RequestBody PackageCollaboratorDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  packageCollaborator")
    @PutMapping("")
    public ResponseEntity<PackageCollaboratorDto> update(@RequestBody PackageCollaboratorDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of packageCollaborator")
    @PostMapping("multiple")
    public ResponseEntity<List<PackageCollaboratorDto>> delete(@RequestBody List<PackageCollaboratorDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified packageCollaborator")
    @DeleteMapping("")
    public ResponseEntity<PackageCollaboratorDto> delete(@RequestBody PackageCollaboratorDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified packageCollaborator")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }


    @Operation(summary = "Finds a packageCollaborator and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<PackageCollaboratorDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds packageCollaborators by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<PackageCollaboratorDto>> findByCriteria(@RequestBody PackageCollaboratorCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated packageCollaborators by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody PackageCollaboratorCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports packageCollaborators by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody PackageCollaboratorCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets packageCollaborator data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody PackageCollaboratorCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public PackageCollaboratorRestAdmin (PackageCollaboratorAdminService service, PackageCollaboratorConverter converter) {
        super(service, converter);
    }




}
