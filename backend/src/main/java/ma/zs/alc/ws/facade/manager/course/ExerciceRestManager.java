package ma.zs.alc.ws.facade.manager.course;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.dao.criteria.core.course.ExerciceCriteria;
import ma.zs.alc.service.facade.manager.course.ExerciceManagerService;
import ma.zs.alc.ws.converter.course.ExerciceConverter;
import ma.zs.alc.ws.dto.course.ExerciceDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/manager/exercice/")
public class ExerciceRestManager  extends AbstractController<Exercice, ExerciceDto, ExerciceCriteria, ExerciceManagerService, ExerciceConverter> {



    @Operation(summary = "upload one exercice")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple exercices")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all exercices")
    @GetMapping("")
    public ResponseEntity<List<ExerciceDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all exercices")
    @GetMapping("optimized")
    public ResponseEntity<List<ExerciceDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a exercice by libelle")
    @GetMapping("libelle/{libelle}")
    public ResponseEntity<ExerciceDto> findByLibelle(@PathVariable String libelle) {
        return super.findByReferenceEntity(new Exercice(libelle));
    }

    @Operation(summary = "Saves the specified  exercice")
    @PostMapping("")
    public ResponseEntity<ExerciceDto> save(@RequestBody ExerciceDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  exercice")
    @PutMapping("")
    public ResponseEntity<ExerciceDto> update(@RequestBody ExerciceDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of exercice")
    @PostMapping("multiple")
    public ResponseEntity<List<ExerciceDto>> delete(@RequestBody List<ExerciceDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified exercice")
    @DeleteMapping("")
    public ResponseEntity<ExerciceDto> delete(@RequestBody ExerciceDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified exercice")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "find by contentType id")
    @GetMapping("contentType/id/{id}")
    public List<ExerciceDto> findByContentTypeId(@PathVariable Long id){
        return findDtos(service.findByContentTypeId(id));
    }
    @Operation(summary = "delete by contentType id")
    @DeleteMapping("contentType/id/{id}")
    public int deleteByContentTypeId(@PathVariable Long id){
        return service.deleteByContentTypeId(id);
    }
    @Operation(summary = "find by section id")
    @GetMapping("section/id/{id}")
    public List<ExerciceDto> findBySectionId(@PathVariable Long id){
        return findDtos(service.findBySectionId(id));
    }
    @Operation(summary = "delete by section id")
    @DeleteMapping("section/id/{id}")
    public int deleteBySectionId(@PathVariable Long id){
        return service.deleteBySectionId(id);
    }

    @Operation(summary = "Finds a exercice and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<ExerciceDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds exercices by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<ExerciceDto>> findByCriteria(@RequestBody ExerciceCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated exercices by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody ExerciceCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports exercices by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody ExerciceCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets exercice data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody ExerciceCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public ExerciceRestManager (ExerciceManagerService service, ExerciceConverter converter) {
        super(service, converter);
    }




}
