package ma.zs.alc.unit.dao.facade.core.course;

import ma.zs.alc.bean.core.course.Exercice;
import ma.zs.alc.dao.facade.core.course.ExerciceDao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.math.BigDecimal;
import java.util.List;

import java.util.stream.Collectors;
import java.util.stream.LongStream;
import java.util.stream.IntStream;
import java.time.LocalDateTime;

import ma.zs.alc.bean.core.courseref.ContentType ;
import ma.zs.alc.bean.core.course.Section ;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@SpringBootTest
public class ExerciceDaoTest {

@Autowired
    private ExerciceDao underTest;


    @Test
    void shouldFindById(){
        Long id = 1L;
        Exercice entity = new Exercice();
        entity.setId(id);
        underTest.save(entity);
        Exercice loaded = underTest.findById(id).get();
        assertThat(loaded.getId()).isEqualTo(id);
    }

    @Test
    void shoulDeleteById() {
        Long id = 1L;
        Exercice entity = new Exercice();
        entity.setId(id);
        underTest.save(entity);

        underTest.deleteById(id);

        Exercice loaded = underTest.findById(id).get();
        assertThat(loaded).isNull();
    }


    @Test
    void shouldFindAll() {
        // Given
        List<Exercice> items = IntStream.rangeClosed(1, 10).mapToObj(i->constructSample(i)).collect(Collectors.toList());

        // Init
        items.forEach(underTest::save);

        // When
        List<Exercice> loadedItems = underTest.findAll();

        // Then
        assertThat(loadedItems).isNotNull();
        assertThat(loadedItems.size()).isEqualTo(10);
    }
    @Test
    void shouldSave(){
        Exercice given = constructSample(1);
        Exercice saved = underTest.save(given);
        assertThat(saved.getId()).isNotNull();
    }

    private Exercice constructSample(int i) {
		Exercice given = new Exercice();
        given.setContent("content-"+i);
        given.setDescription("description-"+i);
        given.setLibelle("libelle-"+i);
        given.setNumero(i*1L);
        given.setContentType(new ContentType(1L));
        given.setSection(new Section(1L));
        return given;
    }

}
