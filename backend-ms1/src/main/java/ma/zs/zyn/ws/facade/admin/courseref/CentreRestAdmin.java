package  ma.zs.zyn.ws.facade.admin.courseref;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.zyn.bean.core.courseref.Centre;
import ma.zs.zyn.dao.criteria.core.courseref.CentreCriteria;
import ma.zs.zyn.service.facade.admin.courseref.CentreAdminService;
import ma.zs.zyn.ws.converter.courseref.CentreConverter;
import ma.zs.zyn.ws.dto.courseref.CentreDto;
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
@RequestMapping("/api/admin/centre/")
public class CentreRestAdmin  extends AbstractController<Centre, CentreDto, CentreCriteria, CentreAdminService, CentreConverter> {



    @Operation(summary = "upload one centre")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple centres")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all centres")
    @GetMapping("")
    public ResponseEntity<List<CentreDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all centres")
    @GetMapping("optimized")
    public ResponseEntity<List<CentreDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a centre by ref")
    @GetMapping("ref/{ref}")
    public ResponseEntity<CentreDto> findByRef(@PathVariable String ref) {
        return super.findByReferenceEntity(new Centre(ref));
    }

    @Operation(summary = "Saves the specified  centre")
    @PostMapping("")
    public ResponseEntity<CentreDto> save(@RequestBody CentreDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  centre")
    @PutMapping("")
    public ResponseEntity<CentreDto> update(@RequestBody CentreDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of centre")
    @PostMapping("multiple")
    public ResponseEntity<List<CentreDto>> delete(@RequestBody List<CentreDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified centre")
    @DeleteMapping("")
    public ResponseEntity<CentreDto> delete(@RequestBody CentreDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified centre")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple centres by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }



    @Operation(summary = "Finds a centre and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<CentreDto> findById(@PathVariable Long id) {
        return super.findWithAssociatedLists(id);
    }

    @Operation(summary = "Finds centres by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<CentreDto>> findByCriteria(@RequestBody CentreCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated centres by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody CentreCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports centres by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody CentreCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets centre data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody CentreCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public CentreRestAdmin (CentreAdminService service, CentreConverter converter) {
        super(service, converter);
    }




}
