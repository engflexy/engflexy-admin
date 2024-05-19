package ma.zs.alc.unit.service.impl.admin.course;

import ma.zs.alc.bean.core.course.Cours;
import ma.zs.alc.dao.facade.core.course.CoursDao;
import ma.zs.alc.service.impl.admin.course.CoursAdminServiceImpl;

import ma.zs.alc.bean.core.course.Parcours ;
import ma.zs.alc.bean.core.course.Section ;
import ma.zs.alc.bean.core.homework.TypeHomeWork ;
import ma.zs.alc.bean.core.course.Cours ;
import ma.zs.alc.bean.core.homework.HomeWork ;
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
class CoursAdminServiceImplTest {

    @Mock
    private CoursDao repository;
    private AutoCloseable autoCloseable;
    private CoursAdminServiceImpl underTest;



    @BeforeEach
    void setUp() {
        autoCloseable = MockitoAnnotations.openMocks(this);
        underTest = new CoursAdminServiceImpl(repository);
    }

    @AfterEach
    void tearDown() throws Exception {
        autoCloseable.close();
    }

    @Test
    void canGetAllCours() {
         //when
        underTest.findAll();
        verify(repository).findAll();
    }

    @Test
    void itShouldSaveCours() {
        // Given
        Cours toSave = constructSample(1);
        when(repository.save(toSave)).thenReturn(toSave);

        // When
        underTest.create(toSave);

        // Then
        verify(repository).save(toSave);
    }

    @Test
    void itShouldDeleteCours() {
        // Given
        Long idToDelete = 1L;
        when(repository.existsById(idToDelete)).thenReturn(true);

        // When
        underTest.deleteById(idToDelete);

        // Then
        verify(repository).deleteById(idToDelete);
    }
    @Test
    void itShouldGetCoursById() {
        // Given
        Long idToRetrieve = 1L; // Example Cours ID to retrieve
        Cours expected = new Cours(); // You need to replace Cours with your actual class
        expected.setId(idToRetrieve);
        when(repository.findById(idToRetrieve)).thenReturn(java.util.Optional.of(expected));

        // When
        Cours result = underTest.findById(idToRetrieve);

        // Then
        assertEquals(expected, result);
    }
	
	private Cours constructSample(int i) {
		Cours given = new Cours();
        given.setCode("code-"+i);
        given.setLibelle("libelle-"+i);
        given.setDescription("description-"+i);
        given.setImage("image-"+i);
        given.setParcours(new Parcours(1L));
        given.setNombreSectionFinalise(i);
        given.setNombreSectionEnCours(i);
        given.setNombreLinkEnCours(i);
        given.setNombreLinkFinalise(i);
        given.setNumeroOrder(i);
        List<Section> sections = IntStream.rangeClosed(1, 3)
                                             .mapToObj(id -> {
                                                Section element = new Section();
                                                element.setId((long)id);
                                                element.setCode("code"+id);
                                                element.setLibelle("libelle"+id);
                                                element.setDescription("description"+id);
                                                element.setCours(new Cours(Long.valueOf(4)));
                                                return element;
                                             })
                                             .collect(Collectors.toList());
        given.setSections(sections);
        List<HomeWork> homeWorks = IntStream.rangeClosed(1, 3)
                                             .mapToObj(id -> {
                                                HomeWork element = new HomeWork();
                                                element.setId((long)id);
                                                element.setLibelle("libelle"+id);
                                                element.setUrlImage("urlImage"+id);
                                                element.setUrlVideo("urlVideo"+id);
                                                element.setCours(new Cours(Long.valueOf(5)));
                                                element.setTypeHomeWork(new TypeHomeWork(Long.valueOf(6)));
                                                return element;
                                             })
                                             .collect(Collectors.toList());
        given.setHomeWorks(homeWorks);
        return given;
    }

}
