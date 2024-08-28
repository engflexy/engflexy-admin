package ma.zs.alc.service.impl.migration.ws;

import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.service.impl.migration.dto.ParcoursMigration;
import ma.zs.alc.service.impl.migration.service.MigratorService;
import ma.zs.alc.service.impl.migration.service.ProcessResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/migrator/")
public class MigrationWs {
    @Autowired
    private MigratorService migratorService;

    /*@GetMapping("parcours")
    public ProcessResult lunchParcours() {
        ProcessResult processResult = migratorService.lunchParcours();
        return processResult;
    }*/
    /*@GetMapping("course")
    public int lunchCours() {
        int result = migratorService.lunchCours();
        return result;
    }*/
    /*@GetMapping("section")
    public int lunchSection() {
        int result = migratorService.lunchSection();
        return result;
    }*/
    /*@GetMapping("quiz")
    public int lunchQuiz() {
        int result=migratorService.lunchExerciceFromQuiz();
        return result;
    }*/
   /* @GetMapping("question")
    public int lunchQuestion() {
        int result=migratorService.lunchQuestion();
        return result;
    }*/
    @GetMapping("")
    public  List<ProcessResult> lunchAll(){
        List<ProcessResult> processResult = migratorService.lunchAll();
        return processResult;
    }
    @GetMapping("clear")
    public  void clearData(){
        this.migratorService.cleanData();
    }
    @GetMapping("user")
    public int lunchUsers() {
        int result=migratorService.lunchUsers();
        return result;
    }
}
