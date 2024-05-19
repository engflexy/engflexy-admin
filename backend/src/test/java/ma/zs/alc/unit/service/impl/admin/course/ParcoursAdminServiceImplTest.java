package ma.zs.alc.unit.service.impl.admin.course;

import ma.zs.alc.bean.core.course.Parcours;
import ma.zs.alc.dao.facade.core.course.ParcoursDao;
import ma.zs.alc.service.impl.admin.course.ParcoursAdminServiceImpl;

import ma.zs.alc.bean.core.vocab.Collaborator ;
import ma.zs.alc.bean.core.course.Parcours ;
import ma.zs.alc.bean.core.course.Cours ;
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
class ParcoursAdminServiceImplTest {

    @Mock
    private ParcoursDao repository;
    private AutoCloseable autoCloseable;
    private ParcoursAdminServiceImpl underTest;



    @BeforeEach
    void setUp() {
        autoCloseable = MockitoAnnotations.openMocks(this);
        underTest = new ParcoursAdminServiceImpl(repository);
    }

    @AfterEach
    void tearDown() throws Exception {
        autoCloseable.close();
    }

    @Test
    void canGetAllParcours() {
         //when
        underTest.findAll();
        verify(repository).findAll();
    }

    @Test
    void itShouldSaveParcours() {
        // Given
        Parcours toSave = constructSample(1);
        when(repository.save(toSave)).thenReturn(toSave);

        // When
        underTest.create(toSave);

        // Then
        verify(repository).save(toSave);
    }

    @Test
    void itShouldDeleteParcours() {
        // Given
        Long idToDelete = 1L;
        when(repository.existsById(idToDelete)).thenReturn(true);

        // When
        underTest.deleteById(idToDelete);

        // Then
        verify(repository).deleteById(idToDelete);
    }
    @Test
    void itShouldGetParcoursById() {
        // Given
        Long idToRetrieve = 1L; // Example Parcours ID to retrieve
        Parcours expected = new Parcours(); // You need to replace Parcours with your actual class
        expected.setId(idToRetrieve);
        when(repository.findById(idToRetrieve)).thenReturn(java.util.Optional.of(expected));

        // When
        Parcours result = underTest.findById(idToRetrieve);

        // Then
        assertEquals(expected, result);
    }
	
	private Parcours constructSample(int i) {
		Parcours given = new Parcours();
        given.setDatePublication(LocalDateTime.now());
        given.setDateCreation(LocalDateTime.now());
        given.setDescription("description-"+i);
        given.setCode("code-"+i);
        given.setLibelle("libelle-"+i);
        given.setNumeroOrder(i);
        given.setNombreCours(i);
        List<Cours> courss = IntStream.rangeClosed(1, 3)
                                             .mapToObj(id -> {
                                                Cours element = new Cours();
                                                element.setId((long)id);
                                                element.setCode("code"+id);
                                                element.setLibelle("libelle"+id);
                                                element.setDescription("description"+id);
                                                element.setImage("image"+id);
                                                element.setParcours(new Parcours(Long.valueOf(5)));
                                                element.setNombreSectionFinalise(6);
                                                element.setNombreSectionEnCours(7);
                                                element.setNombreLinkEnCours(8);
                                                element.setNombreLinkFinalise(9);
                                                element.setNumeroOrder(10);
                                                return element;
                                             })
                                             .collect(Collectors.toList());
        given.setCourss(courss);
        given.setCollaborator(new Collaborator(1L));
        return given;
    }

}
