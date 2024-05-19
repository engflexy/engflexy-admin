package ma.zs.alc.unit.dao.facade.core.courseref;

import ma.zs.alc.bean.core.courseref.ContentType;
import ma.zs.alc.dao.facade.core.courseref.ContentTypeDao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.math.BigDecimal;
import java.util.List;

import java.util.stream.Collectors;
import java.util.stream.LongStream;
import java.util.stream.IntStream;
import java.time.LocalDateTime;


import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@SpringBootTest
public class ContentTypeDaoTest {

@Autowired
    private ContentTypeDao underTest;

    @Test
    void shouldFindByCode(){
        String code = "code-1";
        ContentType entity = new ContentType();
        entity.setCode(code);
        underTest.save(entity);
        ContentType loaded = underTest.findByCode(code);
        assertThat(loaded.getCode()).isEqualTo(code);
    }

    @Test
    void shouldDeleteByCode() {
        String code = "code-1";
        ContentType entity = new ContentType();
        entity.setCode(code);
        underTest.save(entity);

        int result = underTest.deleteByCode(code);

        ContentType loaded = underTest.findByCode(code);
        assertThat(loaded).isNull();
        assertThat(result).isEqualTo(1);
    }

    @Test
    void shouldFindById(){
        Long id = 1L;
        ContentType entity = new ContentType();
        entity.setId(id);
        underTest.save(entity);
        ContentType loaded = underTest.findById(id).get();
        assertThat(loaded.getId()).isEqualTo(id);
    }

    @Test
    void shoulDeleteById() {
        Long id = 1L;
        ContentType entity = new ContentType();
        entity.setId(id);
        underTest.save(entity);

        underTest.deleteById(id);

        ContentType loaded = underTest.findById(id).get();
        assertThat(loaded).isNull();
    }


    @Test
    void shouldFindAll() {
        // Given
        List<ContentType> items = IntStream.rangeClosed(1, 10).mapToObj(i->constructSample(i)).collect(Collectors.toList());

        // Init
        items.forEach(underTest::save);

        // When
        List<ContentType> loadedItems = underTest.findAll();

        // Then
        assertThat(loadedItems).isNotNull();
        assertThat(loadedItems.size()).isEqualTo(10);
    }
    @Test
    void shouldSave(){
        ContentType given = constructSample(1);
        ContentType saved = underTest.save(given);
        assertThat(saved.getId()).isNotNull();
    }

    private ContentType constructSample(int i) {
		ContentType given = new ContentType();
        given.setCode("code-"+i);
        given.setLibelle("libelle-"+i);
        return given;
    }

}
