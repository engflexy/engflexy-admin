package ma.zs.alc.ws.facade.manager.prof;

import io.swagger.v3.oas.annotations.Operation;
import ma.zs.alc.bean.core.prof.ClassAverageBonusProf;
import ma.zs.alc.dao.criteria.core.prof.ClassAverageBonusProfCriteria;
import ma.zs.alc.service.facade.manager.prof.ClassAverageBonusProfManagerService;
import ma.zs.alc.ws.converter.prof.ClassAverageBonusProfConverter;
import ma.zs.alc.ws.dto.prof.ClassAverageBonusProfDto;
import ma.zs.alc.zynerator.controller.AbstractController;
import ma.zs.alc.zynerator.dto.FileTempDto;
import ma.zs.alc.zynerator.util.PaginatedList;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/api/manager/classAverageBonusProf/")
public class ClassAverageBonusProfRestManager  extends AbstractController<ClassAverageBonusProf, ClassAverageBonusProfDto, ClassAverageBonusProfCriteria, ClassAverageBonusProfManagerService, ClassAverageBonusProfConverter> {



    @Operation(summary = "upload one classAverageBonusProf")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple classAverageBonusProfs")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all classAverageBonusProfs")
    @GetMapping("")
    public ResponseEntity<List<ClassAverageBonusProfDto>> findAll() throws Exception {
        return super.findAll();
    }



    @Operation(summary = "Saves the specified  classAverageBonusProf")
    @PostMapping("")
    public ResponseEntity<ClassAverageBonusProfDto> save(@RequestBody ClassAverageBonusProfDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  classAverageBonusProf")
    @PutMapping("")
    public ResponseEntity<ClassAverageBonusProfDto> update(@RequestBody ClassAverageBonusProfDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of classAverageBonusProf")
    @PostMapping("multiple")
    public ResponseEntity<List<ClassAverageBonusProfDto>> delete(@RequestBody List<ClassAverageBonusProfDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified classAverageBonusProf")
    @DeleteMapping("")
    public ResponseEntity<ClassAverageBonusProfDto> delete(@RequestBody ClassAverageBonusProfDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified classAverageBonusProf")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }

    @Operation(summary = "find by prof id")
    @GetMapping("prof/id/{id}")
    public List<ClassAverageBonusProfDto> findByProfId(@PathVariable Long id){
        return findDtos(service.findByProfId(id));
    }
    @Operation(summary = "delete by prof id")
    @DeleteMapping("prof/id/{id}")
    public int deleteByProfId(@PathVariable Long id){
        return service.deleteByProfId(id);
    }
    @Operation(summary = "find by salary id")
    @GetMapping("salary/id/{id}")
    public List<ClassAverageBonusProfDto> findBySalaryId(@PathVariable Long id){
        return findDtos(service.findBySalaryId(id));
    }
    @Operation(summary = "delete by salary id")
    @DeleteMapping("salary/id/{id}")
    public int deleteBySalaryId(@PathVariable Long id){
        return service.deleteBySalaryId(id);
    }

    @Operation(summary = "Finds a classAverageBonusProf and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<ClassAverageBonusProfDto> findById(@PathVariable Long id) {
        return super.findById(id);
    }

    @Operation(summary = "Finds classAverageBonusProfs by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<ClassAverageBonusProfDto>> findByCriteria(@RequestBody ClassAverageBonusProfCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated classAverageBonusProfs by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody ClassAverageBonusProfCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports classAverageBonusProfs by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody ClassAverageBonusProfCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets classAverageBonusProf data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody ClassAverageBonusProfCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public ClassAverageBonusProfRestManager (ClassAverageBonusProfManagerService service, ClassAverageBonusProfConverter converter) {
        super(service, converter);
    }




}
