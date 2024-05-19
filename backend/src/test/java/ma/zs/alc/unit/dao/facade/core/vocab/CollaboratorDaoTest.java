package ma.zs.alc.unit.dao.facade.core.vocab;

import ma.zs.alc.bean.core.vocab.Collaborator;
import ma.zs.alc.dao.facade.core.vocab.CollaboratorDao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.math.BigDecimal;
import java.util.List;

import java.util.stream.Collectors;
import java.util.stream.LongStream;
import java.util.stream.IntStream;
import java.time.LocalDateTime;

import ma.zs.alc.bean.core.prof.TypeCollaborator ;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@SpringBootTest
public class CollaboratorDaoTest {

@Autowired
    private CollaboratorDao underTest;


    @Test
    void shouldFindById(){
        Long id = 1L;
        Collaborator entity = new Collaborator();
        entity.setId(id);
        underTest.save(entity);
        Collaborator loaded = underTest.findById(id).get();
        assertThat(loaded.getId()).isEqualTo(id);
    }

    @Test
    void shoulDeleteById() {
        Long id = 1L;
        Collaborator entity = new Collaborator();
        entity.setId(id);
        underTest.save(entity);

        underTest.deleteById(id);

        Collaborator loaded = underTest.findById(id).get();
        assertThat(loaded).isNull();
    }


    @Test
    void shouldFindAll() {
        // Given
        List<Collaborator> items = IntStream.rangeClosed(1, 10).mapToObj(i->constructSample(i)).collect(Collectors.toList());

        // Init
        items.forEach(underTest::save);

        // When
        List<Collaborator> loadedItems = underTest.findAll();

        // Then
        assertThat(loadedItems).isNotNull();
        assertThat(loadedItems.size()).isEqualTo(10);
    }
    @Test
    void shouldSave(){
        Collaborator given = constructSample(1);
        Collaborator saved = underTest.save(given);
        assertThat(saved.getId()).isNotNull();
    }

    private Collaborator constructSample(int i) {
		Collaborator given = new Collaborator();
        given.setLibelle("libelle-"+i);
        given.setDescription("description-"+i);
        given.setTypeCollaborator(new TypeCollaborator(1L));
        given.setCredentialsNonExpired(false);
        given.setEnabled(false);
        given.setAccountNonExpired(false);
        given.setAccountNonLocked(false);
        given.setPasswordChanged(false);
        given.setUsername("username-"+i);
        given.setPassword("password-"+i);
        return given;
    }

}
