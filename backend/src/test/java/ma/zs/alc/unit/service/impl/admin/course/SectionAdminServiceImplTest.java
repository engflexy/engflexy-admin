package ma.zs.alc.unit.service.impl.admin.course;

import ma.zs.alc.bean.core.course.Section;
import ma.zs.alc.dao.facade.core.course.SectionDao;
import ma.zs.alc.service.impl.admin.course.SectionAdminServiceImpl;

import ma.zs.alc.bean.core.quiz.Quiz ;
import ma.zs.alc.bean.core.courseref.ContentType ;
import ma.zs.alc.bean.core.course.Section ;
import ma.zs.alc.bean.core.course.Exercice ;
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
class SectionAdminServiceImplTest {

    @Mock
    private SectionDao repository;
    private AutoCloseable autoCloseable;
    private SectionAdminServiceImpl underTest;



    @BeforeEach
    void setUp() {
        autoCloseable = MockitoAnnotations.openMocks(this);
        underTest = new SectionAdminServiceImpl(repository);
    }

    @AfterEach
    void tearDown() throws Exception {
        autoCloseable.close();
    }

    @Test
    void canGetAllSection() {
         //when
        underTest.findAll();
        verify(repository).findAll();
    }

    @Test
    void itShouldSaveSection() {
        // Given
        Section toSave = constructSample(1);
        when(repository.save(toSave)).thenReturn(toSave);

        // When
        underTest.create(toSave);

        // Then
        verify(repository).save(toSave);
    }

    @Test
    void itShouldDeleteSection() {
        // Given
        Long idToDelete = 1L;
        when(repository.existsById(idToDelete)).thenReturn(true);

        // When
        underTest.deleteById(idToDelete);

        // Then
        verify(repository).deleteById(idToDelete);
    }
    @Test
    void itShouldGetSectionById() {
        // Given
        Long idToRetrieve = 1L; // Example Section ID to retrieve
        Section expected = new Section(); // You need to replace Section with your actual class
        expected.setId(idToRetrieve);
        when(repository.findById(idToRetrieve)).thenReturn(java.util.Optional.of(expected));

        // When
        Section result = underTest.findById(idToRetrieve);

        // Then
        assertEquals(expected, result);
    }
	
	private Section constructSample(int i) {
		Section given = new Section();
        given.setCode("code-"+i);
        given.setLibelle("libelle-"+i);
        given.setDescription("description-"+i);
        given.setCours(new Cours(1L));
        List<Quiz> quizs = IntStream.rangeClosed(1, 3)
                                             .mapToObj(id -> {
                                                Quiz element = new Quiz();
                                                element.setId((long)id);
                                                element.setRef("ref"+id);
                                                element.setLib("lib"+id);
                                                element.setDateDebut(LocalDateTime.now());
                                                element.setDateFin(LocalDateTime.now());
                                                element.setSection(new Section(Long.valueOf(6)));
                                                element.setNumero(7L);
                                                element.setSeuilReussite(8L);
                                                return element;
                                             })
                                             .collect(Collectors.toList());
        given.setQuizs(quizs);
        List<Exercice> exercices = IntStream.rangeClosed(1, 3)
                                             .mapToObj(id -> {
                                                Exercice element = new Exercice();
                                                element.setId((long)id);
                                                element.setContent("content"+id);
                                                element.setDescription("description"+id);
                                                element.setLibelle("libelle"+id);
                                                element.setNumero(4L);
                                                element.setContentType(new ContentType(Long.valueOf(5)));
                                                element.setSection(new Section(Long.valueOf(6)));
                                                return element;
                                             })
                                             .collect(Collectors.toList());
        given.setExercices(exercices);
        return given;
    }

}
