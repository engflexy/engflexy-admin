package  ma.zs.zyn.ws.facade.admin.courseref;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.zyn.bean.core.courseref.EtatCours;
import ma.zs.zyn.dao.criteria.core.courseref.EtatCoursCriteria;
import ma.zs.zyn.service.facade.admin.courseref.EtatCoursAdminService;
import ma.zs.zyn.ws.converter.courseref.EtatCoursConverter;
import ma.zs.zyn.ws.dto.courseref.EtatCoursDto;
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
@RequestMapping("/api/admin/etatCours/")
public class EtatCoursRestAdmin  extends AbstractController<EtatCours, EtatCoursDto, EtatCoursCriteria, EtatCoursAdminService, EtatCoursConverter> {



    @Operation(summary = "upload one etatCours")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple etatCourss")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all etatCourss")
    @GetMapping("")
    public ResponseEntity<List<EtatCoursDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all etatCourss")
    @GetMapping("optimized")
    public ResponseEntity<List<EtatCoursDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a etatCours by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<EtatCoursDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new EtatCours(libelle));
    }

    @Operation(summary = "Saves the specified  etatCours")
    @PostMapping("")
    public ResponseEntity<EtatCoursDto> save(@RequestBody EtatCoursDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  etatCours")
    @PutMapping("")
    public ResponseEntity<EtatCoursDto> update(@RequestBody EtatCoursDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of etatCours")
    @PostMapping("multiple")
    public ResponseEntity<List<EtatCoursDto>> delete(@RequestBody List<EtatCoursDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified etatCours")
    @DeleteMapping("")
    public ResponseEntity<EtatCoursDto> delete(@RequestBody EtatCoursDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified etatCours")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple etatCourss by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }



    @Operation(summary = "Finds a etatCours and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<EtatCoursDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds etatCourss by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<EtatCoursDto>> findByCriteria(@RequestBody EtatCoursCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated etatCourss by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody EtatCoursCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports etatCourss by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody EtatCoursCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets etatCours data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody EtatCoursCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public EtatCoursRestAdmin (EtatCoursAdminService service, EtatCoursConverter converter) {
        super(service, converter);
    }




}
