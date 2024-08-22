package ma.zs.alc.service.impl.migration.ws;

import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.service.impl.migration.dto.ParcoursMigration;
import ma.zs.alc.service.impl.migration.service.MigratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/migrator")
public class MigrationWs {
    @Autowired
    private MigratorService migratorService;

    @GetMapping("/parcours/")
    public int lunchParcours() {
        int result = migratorService.lunchParcours();
        return result;
    }
}
