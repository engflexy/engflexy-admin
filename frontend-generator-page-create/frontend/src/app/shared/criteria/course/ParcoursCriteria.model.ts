import {BaseCriteria} from 'src/app/zynerator/criteria/BaseCriteria.model';
import {CollaboratorCriteria} from '../vocab/CollaboratorCriteria.model';
import {CoursCriteria} from './CoursCriteria.model';

export class ParcoursCriteria  extends BaseCriteria  {

    public id: number;
    public datePublication: Date;
    public datePublicationFrom: Date;
    public datePublicationTo: Date;
    public dateCreation: Date;
    public dateCreationFrom: Date;
    public dateCreationTo: Date;
    public description: string;
    public descriptionLike: string;
    public code: string;
    public codeLike: string;
    public libelle: string;
    public libelleLike: string;
     public numeroOrder: number;
     public numeroOrderMin: number;
     public numeroOrderMax: number;
     public nombreCours: number;
     public nombreCoursMin: number;
     public nombreCoursMax: number;
      public courss: Array<CoursCriteria>;

}
