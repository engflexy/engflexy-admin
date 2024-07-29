package ma.zs.alc.ws.facade.manager.recomrecla;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.recomrecla.ReclamationEtudiant;
import ma.zs.alc.dao.criteria.core.recomrecla.ReclamationEtudiantCriteria;
import ma.zs.alc.service.facade.manager.recomrecla.ReclamationEtudiantManagerService;
import ma.zs.alc.ws.converter.recomrecla.ReclamationEtudiantConverter;
import ma.zs.alc.ws.dto.recomrecla.ReclamationEtudiantDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/manager/reclamationEtudiant/")
public class ReclamationEtudiantRestManager  extends AbstractController<ReclamationEtudiant, ReclamationEtudiantDto, ReclamationEtudiantCriteria, ReclamationEtudiantManagerService, ReclamationEtudiantConverter> {



    @Operation(summary = "upload one reclamationEtudiant")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple reclamationEtudiants")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all reclamationEtudiants")
    @GetMapping("")
    public ResponseEntity<List<ReclamationEtudiantDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all reclamationEtudiants")
    @GetMapping("optimized")
    public ResponseEntity<List<ReclamationEtudiantDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a reclamationEtudiant by reference")
    @GetMapping("reference/{reference}")
    public ResponseEntity<ReclamationEtudiantDto> findByReference(@PathVariable String reference) {
        return super.findByReferenceEntity(new ReclamationEtudiant(reference));
    }

    @Operation(summary = "Saves the specified  reclamationEtudiant")
    @PostMapping("")
    public ResponseEntity<ReclamationEtudiantDto> save(@RequestBody ReclamationEtudiantDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  reclamationEtudiant")
    @PutMapping("")
    public ResponseEntity<ReclamationEtudiantDto> update(@RequestBody ReclamationEtudiantDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of reclamationEtudiant")
    @PostMapping("multiple")
    public ResponseEntity<List<ReclamationEtudiantDto>> delete(@RequestBody List<ReclamationEtudiantDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified reclamationEtudiant")
    @DeleteMapping("")
    public ResponseEntity<ReclamationEtudiantDto> delete(@RequestBody ReclamationEtudiantDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified reclamationEtudiant")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "find by typeReclamationEtudiant id")
    @GetMapping("typeReclamationEtudiant/id/{id}")
    public List<ReclamationEtudiantDto> findByTypeReclamationEtudiantId(@PathVariable Long id){
        return findDtos(service.findByTypeReclamationEtudiantId(id));
    }
    @Operation(summary = "delete by typeReclamationEtudiant id")
    @DeleteMapping("typeReclamationEtudiant/id/{id}")
    public int deleteByTypeReclamationEtudiantId(@PathVariable Long id){
        return service.deleteByTypeReclamationEtudiantId(id);
    }

    @Operation(summary = "Finds a reclamationEtudiant and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<ReclamationEtudiantDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds reclamationEtudiants by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<ReclamationEtudiantDto>> findByCriteria(@RequestBody ReclamationEtudiantCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated reclamationEtudiants by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody ReclamationEtudiantCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports reclamationEtudiants by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody ReclamationEtudiantCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets reclamationEtudiant data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody ReclamationEtudiantCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public ReclamationEtudiantRestManager (ReclamationEtudiantManagerService service, ReclamationEtudiantConverter converter) {
        super(service, converter);
    }




}
