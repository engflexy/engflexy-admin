import {Component, OnInit} from '@angular/core';
import {GroupeEtudiantAdminService} from 'src/app/shared/service/admin/grpe/GroupeEtudiantAdmin.service';
import {GroupeEtudiantDto} from 'src/app/shared/model/grpe/GroupeEtudiant.model';
import {GroupeEtudiantCriteria} from 'src/app/shared/criteria/grpe/GroupeEtudiantCriteria.model';
import {AbstractListController} from 'src/app/zynerator/controller/AbstractListController';
import {environment} from 'src/environments/environment';

import {ParcoursDto} from 'src/app/shared/model/course/Parcours.model';
import {ParcoursAdminService} from 'src/app/shared/service/admin/course/ParcoursAdmin.service';
import {GroupeEtatDto} from 'src/app/shared/model/grpe/GroupeEtat.model';
import {GroupeEtatAdminService} from 'src/app/shared/service/admin/grpe/GroupeEtatAdmin.service';
import {GroupeEtudiantDetailAdminService} from 'src/app/shared/service/admin/grpe/GroupeEtudiantDetailAdmin.service';
import {EtudiantAdminService} from 'src/app/shared/service/admin/inscription/EtudiantAdmin.service';
import {GroupeTypeDto} from 'src/app/shared/model/grpe/GroupeType.model';
import {GroupeTypeAdminService} from 'src/app/shared/service/admin/grpe/GroupeTypeAdmin.service';
import {GroupeEtudeDto} from 'src/app/shared/model/grpe/GroupeEtude.model';
import {GroupeEtudeAdminService} from 'src/app/shared/service/admin/grpe/GroupeEtudeAdmin.service';
import {ProfDto} from 'src/app/shared/model/prof/Prof.model';
import {ProfAdminService} from 'src/app/shared/service/admin/prof/ProfAdmin.service';


@Component({
    selector: 'app-groupe-etudiant-list-admin',
    templateUrl: './groupe-etudiant-list-admin.component.html'
})
export class GroupeEtudiantListAdminComponent extends AbstractListController<GroupeEtudiantDto, GroupeEtudiantCriteria, GroupeEtudiantAdminService> implements OnInit {

    override fileName = 'GroupeEtudiant';


    groupeEtudes: Array<GroupeEtudeDto>;
    groupeTypes: Array<GroupeTypeDto>;
    groupeEtats: Array<GroupeEtatDto>;
    parcourss: Array<ParcoursDto>;
    profs: Array<ProfDto>;


    constructor(private groupeEtudiantService: GroupeEtudiantAdminService, private parcoursService: ParcoursAdminService, private groupeEtatService: GroupeEtatAdminService, private groupeEtudiantDetailService: GroupeEtudiantDetailAdminService, private etudiantService: EtudiantAdminService, private groupeTypeService: GroupeTypeAdminService, private groupeEtudeService: GroupeEtudeAdminService, private profService: ProfAdminService) {
        super(groupeEtudiantService);
    }

    ngOnInit(): void {
        this.activateSecurityConstraint('GroupeEtudiant').subscribe(() => {
            if (true || this.listActionIsValid) {
                this.findPaginatedByCriteria();
                this.initExport();
                this.initCol();
                this.loadGroupeEtude();
                this.loadGroupeType();
                this.loadGroupeEtat();
                this.loadParcours();
                this.loadProf();
            }
        });
    }


    public override initCol() {
        this.cols = [
            {field: 'libelle', header: 'Libelle'},
            {field: 'type', header: 'Type'},
            {field: 'dateDebut', header: 'Date debut'},
            {field: 'dateFin', header: 'Date fin'},
            {field: 'nombrePlace', header: 'Nombre place'},
            {field: 'nombrePlacevide', header: 'Nombre placevide'},
            {field: 'nombrePlaceNonVide', header: 'Nombre place non vide'},
            {field: 'groupeEtude?.libelle', header: 'Groupe etude'},
            {field: 'groupeType?.libelle', header: 'Groupe type'},
            {field: 'groupeEtat?.libelle', header: 'Groupe etat'},
            {field: 'parcours?.libelle', header: 'Parcours'},
            {field: 'prof?.ref', header: 'Prof'},
            {field: 'nreCoursesComing', header: 'Nre courses coming'},
            {field: 'nreCoursesCompleted', header: 'Nre courses completed'},
            {field: 'nreCourses', header: 'Nre courses'},
        ];
    }


    public async loadGroupeEtude() {
        this.groupeEtudeService.findAllOptimized().subscribe(groupeEtudes => this.groupeEtudes = groupeEtudes, error => console.log(error))
    }

    public async loadGroupeType() {
        this.groupeTypeService.findAllOptimized().subscribe(groupeTypes => this.groupeTypes = groupeTypes, error => console.log(error))
    }

    public async loadGroupeEtat() {
        this.groupeEtatService.findAllOptimized().subscribe(groupeEtats => this.groupeEtats = groupeEtats, error => console.log(error))
    }

    public async loadParcours() {
        this.parcoursService.findAllOptimized().subscribe(parcourss => this.parcourss = parcourss, error => console.log(error))
    }

    public async loadProf() {
        this.profService.findAllOptimized().subscribe(profs => this.profs = profs, error => console.log(error))
    }

    public override initDuplicate(res: GroupeEtudiantDto) {
        if (res.groupeEtudiantDetails != null) {
            res.groupeEtudiantDetails.forEach(d => {
                d.groupeEtudiant = null;
                d.id = null;
            });
        }
    }


    public override prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                'Libelle': e.libelle,
                'Type': e.type,
                'Date debut': this.datePipe.transform(e.dateDebut, 'dd/MM/yyyy hh:mm'),
                'Date fin': this.datePipe.transform(e.dateFin, 'dd/MM/yyyy hh:mm'),
                'Nombre place': e.nombrePlace,
                'Nombre placevide': e.nombrePlacevide,
                'Nombre place non vide': e.nombrePlaceNonVide,
                'Groupe etude': e.groupeEtude?.libelle,
                'Groupe type': e.groupeType?.libelle,
                'Groupe etat': e.groupeEtat?.libelle,
                'Parcours': e.parcours?.libelle,
                'Prof': e.prof?.ref,
                'Nre courses coming': e.nreCoursesComing,
                'Nre courses completed': e.nreCoursesCompleted,
                'Nre courses': e.nreCourses,
            }
        });

        this.criteriaData = [{
            'Libelle': this.criteria.libelle ? this.criteria.libelle : environment.emptyForExport,
            'Type': this.criteria.type ? this.criteria.type : environment.emptyForExport,
            'Date debut Min': this.criteria.dateDebutFrom ? this.datePipe.transform(this.criteria.dateDebutFrom, this.dateFormat) : environment.emptyForExport,
            'Date debut Max': this.criteria.dateDebutTo ? this.datePipe.transform(this.criteria.dateDebutTo, this.dateFormat) : environment.emptyForExport,
            'Date fin Min': this.criteria.dateFinFrom ? this.datePipe.transform(this.criteria.dateFinFrom, this.dateFormat) : environment.emptyForExport,
            'Date fin Max': this.criteria.dateFinTo ? this.datePipe.transform(this.criteria.dateFinTo, this.dateFormat) : environment.emptyForExport,
            'Nombre place Min': this.criteria.nombrePlaceMin ? this.criteria.nombrePlaceMin : environment.emptyForExport,
            'Nombre place Max': this.criteria.nombrePlaceMax ? this.criteria.nombrePlaceMax : environment.emptyForExport,
            'Nombre placevide Min': this.criteria.nombrePlacevideMin ? this.criteria.nombrePlacevideMin : environment.emptyForExport,
            'Nombre placevide Max': this.criteria.nombrePlacevideMax ? this.criteria.nombrePlacevideMax : environment.emptyForExport,
            'Nombre place non vide Min': this.criteria.nombrePlaceNonVideMin ? this.criteria.nombrePlaceNonVideMin : environment.emptyForExport,
            'Nombre place non vide Max': this.criteria.nombrePlaceNonVideMax ? this.criteria.nombrePlaceNonVideMax : environment.emptyForExport,
            //'Groupe etude': this.criteria.groupeEtude?.libelle ? this.criteria.groupeEtude?.libelle : environment.emptyForExport ,
            //'Groupe type': this.criteria.groupeType?.libelle ? this.criteria.groupeType?.libelle : environment.emptyForExport ,
            //'Groupe etat': this.criteria.groupeEtat?.libelle ? this.criteria.groupeEtat?.libelle : environment.emptyForExport ,
            //'Parcours': this.criteria.parcours?.libelle ? this.criteria.parcours?.libelle : environment.emptyForExport ,
            //'Prof': this.criteria.prof?.ref ? this.criteria.prof?.ref : environment.emptyForExport ,
            'Nre courses coming Min': this.criteria.nreCoursesComingMin ? this.criteria.nreCoursesComingMin : environment.emptyForExport,
            'Nre courses coming Max': this.criteria.nreCoursesComingMax ? this.criteria.nreCoursesComingMax : environment.emptyForExport,
            'Nre courses completed Min': this.criteria.nreCoursesCompletedMin ? this.criteria.nreCoursesCompletedMin : environment.emptyForExport,
            'Nre courses completed Max': this.criteria.nreCoursesCompletedMax ? this.criteria.nreCoursesCompletedMax : environment.emptyForExport,
            'Nre courses Min': this.criteria.nreCoursesMin ? this.criteria.nreCoursesMin : environment.emptyForExport,
            'Nre courses Max': this.criteria.nreCoursesMax ? this.criteria.nreCoursesMax : environment.emptyForExport,
        }];
    }
}
