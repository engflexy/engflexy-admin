package  ma.zs.zyn.ws.dto.inscriptionref;

import ma.zs.zyn.zynerator.audit.Log;
import ma.zs.zyn.zynerator.dto.AuditBaseDto;
import com.fasterxml.jackson.annotation.JsonInclude;



import ma.zs.zyn.ws.dto.inscription.EtudiantDto;


@JsonInclude(JsonInclude.Include.NON_NULL)
public class EtudiantClassRoomDto  extends AuditBaseDto {


    private ClassRoomDto classRoom ;
    private EtudiantDto etudiant ;



    public EtudiantClassRoomDto(){
        super();
    }




    public ClassRoomDto getClassRoom(){
        return this.classRoom;
    }

    public void setClassRoom(ClassRoomDto classRoom){
        this.classRoom = classRoom;
    }
    public EtudiantDto getEtudiant(){
        return this.etudiant;
    }

    public void setEtudiant(EtudiantDto etudiant){
        this.etudiant = etudiant;
    }






}
