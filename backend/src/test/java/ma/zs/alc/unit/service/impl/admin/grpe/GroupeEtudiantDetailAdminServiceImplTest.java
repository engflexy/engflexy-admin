package ma.zs.alc.unit.service.impl.admin.grpe;

import ma.zs.alc.bean.core.grpe.GroupeEtudiantDetail;
import ma.zs.alc.dao.facade.core.grpe.GroupeEtudiantDetailDao;
import ma.zs.alc.service.impl.admin.grpe.GroupeEtudiantDetailAdminServiceImpl;

import ma.zs.alc.bean.core.inscription.Etudiant ;
import ma.zs.alc.bean.core.grpe.GroupeEtudiant ;
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
class GroupeEtudiantDetailAdminServiceImplTest {

    @Mock
    private GroupeEtudiantDetailDao repository;
    private AutoCloseable autoCloseable;
    private GroupeEtudiantDetailAdminServiceImpl underTest;



    @BeforeEach
    void setUp() {
        autoCloseable = MockitoAnnotations.openMocks(this);
        underTest = new GroupeEtudiantDetailAdminServiceImpl(repository);
    }

    @AfterEach
    void tearDown() throws Exception {
        autoCloseable.close();
    }

    @Test
    void canGetAllGroupeEtudiantDetail() {
         //when
        underTest.findAll();
        verify(repository).findAll();
    }

    @Test
    void itShouldSaveGroupeEtudiantDetail() {
        // Given
        GroupeEtudiantDetail toSave = constructSample(1);
        when(repository.save(toSave)).thenReturn(toSave);

        // When
        underTest.create(toSave);

        // Then
        verify(repository).save(toSave);
    }

    @Test
    void itShouldDeleteGroupeEtudiantDetail() {
        // Given
        Long idToDelete = 1L;
        when(repository.existsById(idToDelete)).thenReturn(true);

        // When
        underTest.deleteById(idToDelete);

        // Then
        verify(repository).deleteById(idToDelete);
    }
    @Test
    void itShouldGetGroupeEtudiantDetailById() {
        // Given
        Long idToRetrieve = 1L; // Example GroupeEtudiantDetail ID to retrieve
        GroupeEtudiantDetail expected = new GroupeEtudiantDetail(); // You need to replace GroupeEtudiantDetail with your actual class
        expected.setId(idToRetrieve);
        when(repository.findById(idToRetrieve)).thenReturn(java.util.Optional.of(expected));

        // When
        GroupeEtudiantDetail result = underTest.findById(idToRetrieve);

        // Then
        assertEquals(expected, result);
    }
	
	private GroupeEtudiantDetail constructSample(int i) {
		GroupeEtudiantDetail given = new GroupeEtudiantDetail();
        given.setGroupeEtudiant(new GroupeEtudiant(1L));
        given.setEtudiant(new Etudiant(1L));
        return given;
    }

}
