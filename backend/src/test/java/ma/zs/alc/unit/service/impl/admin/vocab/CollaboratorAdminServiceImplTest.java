package ma.zs.alc.unit.service.impl.admin.vocab;

import ma.zs.alc.bean.core.vocab.Collaborator;
import ma.zs.alc.dao.facade.core.vocab.CollaboratorDao;
import ma.zs.alc.service.impl.admin.vocab.CollaboratorAdminServiceImpl;

import ma.zs.alc.bean.core.vocab.Collaborator ;
import ma.zs.alc.bean.core.course.Parcours ;
import ma.zs.alc.bean.core.prof.TypeCollaborator ;
import java.util.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import java.time.LocalDateTime;



import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;


@SpringBootTest
class CollaboratorAdminServiceImplTest {

    @Mock
    private CollaboratorDao repository;
    private AutoCloseable autoCloseable;
    private CollaboratorAdminServiceImpl underTest;



    @BeforeEach
    void setUp() {
        autoCloseable = MockitoAnnotations.openMocks(this);
        underTest = new CollaboratorAdminServiceImpl(repository);
    }

    @AfterEach
    void tearDown() throws Exception {
        autoCloseable.close();
    }

    @Test
    void canGetAllCollaborator() {
         //when
        underTest.findAll();
        verify(repository).findAll();
    }

    @Test
    void itShouldSaveCollaborator() {
        // Given
        Collaborator toSave = constructSample(1);
        when(repository.save(toSave)).thenReturn(toSave);

        // When
        underTest.create(toSave);

        // Then
        verify(repository).save(toSave);
    }

    @Test
    void itShouldDeleteCollaborator() {
        // Given
        Long idToDelete = 1L;
        when(repository.existsById(idToDelete)).thenReturn(true);

        // When
        underTest.deleteById(idToDelete);

        // Then
        verify(repository).deleteById(idToDelete);
    }
    @Test
    void itShouldGetCollaboratorById() {
        // Given
        Long idToRetrieve = 1L; // Example Collaborator ID to retrieve
        Collaborator expected = new Collaborator(); // You need to replace Collaborator with your actual class
        expected.setId(idToRetrieve);
        when(repository.findById(idToRetrieve)).thenReturn(java.util.Optional.of(expected));

        // When
        Collaborator result = underTest.findById(idToRetrieve);

        // Then
        assertEquals(expected, result);
    }
	
	private Collaborator constructSample(int i) {
		Collaborator given = new Collaborator();
        given.setLibelle("libelle-"+i);
        given.setDescription("description-"+i);
        given.setTypeCollaborator(new TypeCollaborator(1L));
        List<Parcours> parcourss = IntStream.rangeClosed(1, 3)
                                             .mapToObj(id -> {
                                                Parcours element = new Parcours();
                                                element.setId((long)id);
                                                element.setDatePublication(LocalDateTime.now());
                                                element.setDateCreation(LocalDateTime.now());
                                                element.setDescription("description"+id);
                                                element.setCode("code"+id);
                                                element.setLibelle("libelle"+id);
                                                element.setNumeroOrder(6);
                                                element.setNombreCours(7);
                                                element.setCollaborator(new Collaborator(Long.valueOf(9)));
                                                return element;
                                             })
                                             .collect(Collectors.toList());
        given.setParcourss(parcourss);
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
