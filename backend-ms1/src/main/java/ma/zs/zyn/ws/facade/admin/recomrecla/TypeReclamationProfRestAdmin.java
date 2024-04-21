package  ma.zs.zyn.ws.facade.admin.recomrecla;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.zyn.bean.core.recomrecla.TypeReclamationProf;
import ma.zs.zyn.dao.criteria.core.recomrecla.TypeReclamationProfCriteria;
import ma.zs.zyn.service.facade.admin.recomrecla.TypeReclamationProfAdminService;
import ma.zs.zyn.ws.converter.recomrecla.TypeReclamationProfConverter;
import ma.zs.zyn.ws.dto.recomrecla.TypeReclamationProfDto;
import ma.zs.zyn.zynerator.controller.AbstractController;
import ma.zs.zyn.zynerator.dto.AuditEntityDto;
import ma.zs.zyn.zynerator.util.PaginatedList;


import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import ma.zs.zyn.zynerator.process.Result;


import org.springframework.web.multipart.MultipartFile;
import ma.zs.zyn.zynerator.dto.FileTempDto;

@RestController
@RequestMapping("/api/admin/typeReclamationProf/")
public class TypeReclamationProfRestAdmin  extends AbstractController<TypeReclamationProf, TypeReclamationProfDto, TypeReclamationProfCriteria, TypeReclamationProfAdminService, TypeReclamationProfConverter> {



    @Operation(summary = "upload one typeReclamationProf")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple typeReclamationProfs")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all typeReclamationProfs")
    @GetMapping("")
    public ResponseEntity<List<TypeReclamationProfDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all typeReclamationProfs")
    @GetMapping("optimized")
    public ResponseEntity<List<TypeReclamationProfDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a typeReclamationProf by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<TypeReclamationProfDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new TypeReclamationProf(libelle));
    }

    @Operation(summary = "Saves the specified  typeReclamationProf")
    @PostMapping("")
    public ResponseEntity<TypeReclamationProfDto> save(@RequestBody TypeReclamationProfDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  typeReclamationProf")
    @PutMapping("")
    public ResponseEntity<TypeReclamationProfDto> update(@RequestBody TypeReclamationProfDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of typeReclamationProf")
    @PostMapping("multiple")
    public ResponseEntity<List<TypeReclamationProfDto>> delete(@RequestBody List<TypeReclamationProfDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified typeReclamationProf")
    @DeleteMapping("")
    public ResponseEntity<TypeReclamationProfDto> delete(@RequestBody TypeReclamationProfDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified typeReclamationProf")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple typeReclamationProfs by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }



    @Operation(summary = "Finds a typeReclamationProf and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<TypeReclamationProfDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds typeReclamationProfs by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<TypeReclamationProfDto>> findByCriteria(@RequestBody TypeReclamationProfCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated typeReclamationProfs by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody TypeReclamationProfCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports typeReclamationProfs by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody TypeReclamationProfCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets typeReclamationProf data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody TypeReclamationProfCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public TypeReclamationProfRestAdmin (TypeReclamationProfAdminService service, TypeReclamationProfConverter converter) {
        super(service, converter);
    }




}
