package ma.zs.alc.unit.service.impl.admin.quiz;

import ma.zs.alc.bean.core.quiz.Question;
import ma.zs.alc.dao.facade.core.quiz.QuestionDao;
import ma.zs.alc.service.impl.admin.quiz.QuestionAdminServiceImpl;

import ma.zs.alc.bean.core.quiz.Quiz ;
import ma.zs.alc.bean.core.quizref.TypeDeQuestion ;
import ma.zs.alc.bean.core.quiz.Question ;
import ma.zs.alc.bean.core.quiz.Reponse ;
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
class QuestionCollaboratorServiceImplTest {

    @Mock
    private QuestionDao repository;
    private AutoCloseable autoCloseable;
    private QuestionCollaboratorServiceImpl underTest;



    @BeforeEach
    void setUp() {
        autoCloseable = MockitoAnnotations.openMocks(this);
        underTest = new QuestionAdminServiceImpl(repository);
    }

    @AfterEach
    void tearDown() throws Exception {
        autoCloseable.close();
    }

    @Test
    void canGetAllQuestion() {
         //when
        underTest.findAll();
        verify(repository).findAll();
    }

    @Test
    void itShouldSaveQuestion() {
        // Given
        Question toSave = constructSample(1);
        when(repository.save(toSave)).thenReturn(toSave);

        // When
        underTest.create(toSave);

        // Then
        verify(repository).save(toSave);
    }

    @Test
    void itShouldDeleteQuestion() {
        // Given
        Long idToDelete = 1L;
        when(repository.existsById(idToDelete)).thenReturn(true);

        // When
        underTest.deleteById(idToDelete);

        // Then
        verify(repository).deleteById(idToDelete);
    }
    @Test
    void itShouldGetQuestionById() {
        // Given
        Long idToRetrieve = 1L; // Example Question ID to retrieve
        Question expected = new Question(); // You need to replace Question with your actual class
        expected.setId(idToRetrieve);
        when(repository.findById(idToRetrieve)).thenReturn(java.util.Optional.of(expected));

        // When
        Question result = underTest.findById(idToRetrieve);

        // Then
        assertEquals(expected, result);
    }
	
	private Question constructSample(int i) {
		Question given = new Question();
        given.setRef("ref-"+i);
        given.setLibelle("libelle-"+i);
        given.setUrlImg("urlImg-"+i);
        given.setUrlVideo("urlVideo-"+i);
        given.setNumero(i*1L);
        given.setPointReponseJuste(BigDecimal.TEN);
        given.setPointReponsefausse(BigDecimal.TEN);
        given.setTypeDeQuestion(new TypeDeQuestion(1L));
        List<Reponse> reponses = IntStream.rangeClosed(1, 3)
                                             .mapToObj(id -> {
                                                Reponse element = new Reponse();
                                                element.setId((long)id);
                                                element.setRef("ref"+id);
                                                element.setLib("lib"+id);
                                                element.setEtatReponse("etatReponse"+id);
                                                element.setNumero(4L);
                                                element.setQuestion(new Question(Long.valueOf(5)));
                                                return element;
                                             })
                                             .collect(Collectors.toList());
        given.setReponses(reponses);
        given.setQuiz(new Quiz(1L));
        return given;
    }

}
