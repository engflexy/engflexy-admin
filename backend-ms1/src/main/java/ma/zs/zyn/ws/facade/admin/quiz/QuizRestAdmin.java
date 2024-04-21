package  ma.zs.zyn.ws.facade.admin.quiz;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import ma.zs.zyn.bean.core.quiz.Quiz;
import ma.zs.zyn.dao.criteria.core.quiz.QuizCriteria;
import ma.zs.zyn.service.facade.admin.quiz.QuizAdminService;
import ma.zs.zyn.ws.converter.quiz.QuizConverter;
import ma.zs.zyn.ws.dto.quiz.QuizDto;
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
@RequestMapping("/api/admin/quiz/")
public class QuizRestAdmin  extends AbstractController<Quiz, QuizDto, QuizCriteria, QuizAdminService, QuizConverter> {



    @Operation(summary = "upload one quiz")
    @RequestMapping(value = "upload", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<FileTempDto> uploadFileAndGetChecksum(@RequestBody MultipartFile file) throws Exception {
        return super.uploadFileAndGetChecksum(file);
    }
    @Operation(summary = "upload multiple quizs")
    @RequestMapping(value = "upload-multiple", method = RequestMethod.POST, consumes = "multipart/form-data")
    public ResponseEntity<List<FileTempDto>> uploadMultipleFileAndGetChecksum(@RequestBody MultipartFile[] files) throws Exception {
        return super.uploadMultipleFileAndGetChecksum(files);
    }

    @Operation(summary = "Finds a list of all quizs")
    @GetMapping("")
    public ResponseEntity<List<QuizDto>> findAll() throws Exception {
        return super.findAll();
    }

    @Operation(summary = "Finds an optimized list of all quizs")
    @GetMapping("optimized")
    public ResponseEntity<List<QuizDto>> findAllOptimized() throws Exception {
        return super.findAllOptimized();
    }

    @Operation(summary = "Finds a quiz by lib")
    @GetMapping("lib/{lib}")
    public ResponseEntity<QuizDto> findByLib(@PathVariable String lib) {
        return super.findByReferenceEntity(new Quiz(lib));
    }

    @Operation(summary = "Saves the specified  quiz")
    @PostMapping("")
    public ResponseEntity<QuizDto> save(@RequestBody QuizDto dto) throws Exception {
        return super.save(dto);
    }

    @Operation(summary = "Updates the specified  quiz")
    @PutMapping("")
    public ResponseEntity<QuizDto> update(@RequestBody QuizDto dto) throws Exception {
        return super.update(dto);
    }

    @Operation(summary = "Delete list of quiz")
    @PostMapping("multiple")
    public ResponseEntity<List<QuizDto>> delete(@RequestBody List<QuizDto> listToDelete) throws Exception {
        return super.delete(listToDelete);
    }
    @Operation(summary = "Delete the specified quiz")
    @DeleteMapping("")
    public ResponseEntity<QuizDto> delete(@RequestBody QuizDto dto) throws Exception {
            return super.delete(dto);
    }

    @Operation(summary = "Delete the specified quiz")
    @DeleteMapping("id/{id}")
    public ResponseEntity<Long> deleteById(@PathVariable Long id) throws Exception {
        return super.deleteById(id);
    }
    @Operation(summary = "Delete multiple quizs by ids")
    @DeleteMapping("multiple/id")
    public ResponseEntity<List<Long>> deleteByIdIn(@RequestBody List<Long> ids) throws Exception {
            return super.deleteByIdIn(ids);
     }


    @Operation(summary = "find by section id")
    @GetMapping("section/id/{id}")
    public List<QuizDto> findBySectionId(@PathVariable Long id){
        return findDtos(service.findBySectionId(id));
    }
    @Operation(summary = "delete by section id")
    @DeleteMapping("section/id/{id}")
    public int deleteBySectionId(@PathVariable Long id){
        return service.deleteBySectionId(id);
    }

    @Operation(summary = "Finds a quiz and associated list by id")
    @GetMapping("id/{id}")
    public ResponseEntity<QuizDto> findById(@PathVariable Long id) {
        return super.findWithAssociatedLists(id);
    }

    @Operation(summary = "Finds quizs by criteria")
    @PostMapping("find-by-criteria")
    public ResponseEntity<List<QuizDto>> findByCriteria(@RequestBody QuizCriteria criteria) throws Exception {
        return super.findByCriteria(criteria);
    }

    @Operation(summary = "Finds paginated quizs by criteria")
    @PostMapping("find-paginated-by-criteria")
    public ResponseEntity<PaginatedList> findPaginatedByCriteria(@RequestBody QuizCriteria criteria) throws Exception {
        return super.findPaginatedByCriteria(criteria);
    }

    @Operation(summary = "Exports quizs by criteria")
    @PostMapping("export")
    public ResponseEntity<InputStreamResource> export(@RequestBody QuizCriteria criteria) throws Exception {
        return super.export(criteria);
    }

    @Operation(summary = "Gets quiz data size by criteria")
    @PostMapping("data-size-by-criteria")
    public ResponseEntity<Integer> getDataSize(@RequestBody QuizCriteria criteria) throws Exception {
        return super.getDataSize(criteria);
    }



    public QuizRestAdmin (QuizAdminService service, QuizConverter converter) {
        super(service, converter);
    }




}
