import {BaseDto} from '../../../zynerator/dto/BaseDto.model';

import {GroupeEtudiantDto} from '../grpe/GroupeEtudiant.model';
import {CoursDto} from '../course/Cours.model';
import {ProfDto} from './Prof.model';

export class ScheduleProfDto extends BaseDto {

    public subject: string;

    public startTime: Date;

    public endTime: Date;

    public ref: string;

    public grpName: string;

    public profName: string;

    public profsId: null | number;

    public courseFinished: null | boolean;

    public groupeEtudiant = new GroupeEtudiantDto();
    public prof: ProfDto;
    public cours: CoursDto;

    constructor(id?:number) {
        super(id);

        this.subject = '';
        this.startTime = null;
        this.endTime = null;
        this.ref = '';
        this.grpName = '';
        this.profName = '';
        this.profsId = null;
        this.courseFinished = null;

    }

}
