import {Component, OnInit} from '@angular/core';
import {SectionAdminService} from 'src/app/shared/service/admin/course/SectionAdmin.service';
import {SectionDto} from 'src/app/shared/model/course/Section.model';
import {SectionCriteria} from 'src/app/shared/criteria/course/SectionCriteria.model';
import {AbstractListController} from 'src/app/zynerator/controller/AbstractListController';
import {environment} from 'src/environments/environment';

import {CategorieSectionDto} from 'src/app/shared/model/courseref/CategorieSection.model';
import {CategorieSectionAdminService} from 'src/app/shared/service/admin/courseref/CategorieSectionAdmin.service';
import {CoursDto} from 'src/app/shared/model/course/Cours.model';
import {CoursAdminService} from 'src/app/shared/service/admin/course/CoursAdmin.service';
import {SectionItemAdminService} from 'src/app/shared/service/admin/course/SectionItemAdmin.service';


@Component({
    selector: 'app-section-list-admin',
    templateUrl: './section-list-admin.component.html'
})
export class SectionListAdminComponent extends AbstractListController<SectionDto, SectionCriteria, SectionAdminService> implements OnInit {

    override fileName = 'Section';


    categorieSections: Array<CategorieSectionDto>;
    courss: Array<CoursDto>;


    constructor(private sectionService: SectionAdminService, private categorieSectionService: CategorieSectionAdminService, private coursService: CoursAdminService, private sectionItemService: SectionItemAdminService) {
        super(sectionService);
    }

    ngOnInit(): void {
        this.activateSecurityConstraint('Section').subscribe(() => {
            if (true || this.listActionIsValid) {
                this.findPaginatedByCriteria();
                this.initExport();
                this.initCol();
                this.loadCategorieSection();
                this.loadCours();
            }
        });
    }


    public override initCol() {
        this.cols = [
            {field: 'code', header: 'Code'},
            {field: 'libelle', header: 'Libelle'},
            {field: 'urlImage', header: 'Url image'},
            {field: 'urlImage2', header: 'Url image2'},
            {field: 'urlImage3', header: 'Url image3'},
            {field: 'urlVideo', header: 'Url video'},
            {field: 'contenu', header: 'Contenu'},
            {field: 'questions', header: 'Questions'},
            {field: 'indicationProf', header: 'Indication prof'},
            {field: 'numeroOrder', header: 'Numero order'},
            {field: 'categorieSection?.code', header: 'Categorie section'},
            {field: 'cours?.libelle', header: 'Cours'},
            {field: 'url', header: 'Url'},
            {field: 'content', header: 'Content'},
        ];
    }


    public async loadCategorieSection() {
        this.categorieSectionService.findAllOptimized().subscribe(categorieSections => this.categorieSections = categorieSections, error => console.log(error))
    }

    public async loadCours() {
        this.coursService.findAllOptimized().subscribe(courss => this.courss = courss, error => console.log(error))
    }

    public override initDuplicate(res: SectionDto) {
        if (res.sectionItems != null) {
            res.sectionItems.forEach(d => {
                d.section = null;
                d.id = null;
            });
        }
    }


    public override prepareColumnExport(): void {
        this.exportData = this.items.map(e => {
            return {
                'Code': e.code,
                'Libelle': e.libelle,
                'Url image': e.urlImage,
                'Url image2': e.urlImage2,
                'Url image3': e.urlImage3,
                'Url video': e.urlVideo,
                'Contenu': e.contenu,
                'Questions': e.questions,
                'Indication prof': e.indicationProf,
                'Numero order': e.numeroOrder,
                'Categorie section': e.categorieSection?.code,
                'Cours': e.cours?.libelle,
                'Url': e.url,
                'Content': e.content,
            }
        });

        this.criteriaData = [{
            'Code': this.criteria.code ? this.criteria.code : environment.emptyForExport,
            'Libelle': this.criteria.libelle ? this.criteria.libelle : environment.emptyForExport,
            'Url image': this.criteria.urlImage ? this.criteria.urlImage : environment.emptyForExport,
            'Url image2': this.criteria.urlImage2 ? this.criteria.urlImage2 : environment.emptyForExport,
            'Url image3': this.criteria.urlImage3 ? this.criteria.urlImage3 : environment.emptyForExport,
            'Url video': this.criteria.urlVideo ? this.criteria.urlVideo : environment.emptyForExport,
            'Contenu': this.criteria.contenu ? this.criteria.contenu : environment.emptyForExport,
            'Questions': this.criteria.questions ? this.criteria.questions : environment.emptyForExport,
            'Indication prof': this.criteria.indicationProf ? this.criteria.indicationProf : environment.emptyForExport,
            'Numero order Min': this.criteria.numeroOrderMin ? this.criteria.numeroOrderMin : environment.emptyForExport,
            'Numero order Max': this.criteria.numeroOrderMax ? this.criteria.numeroOrderMax : environment.emptyForExport,
            //'Categorie section': this.criteria.categorieSection?.code ? this.criteria.categorieSection?.code : environment.emptyForExport ,
            //'Cours': this.criteria.cours?.libelle ? this.criteria.cours?.libelle : environment.emptyForExport ,
            'Url Min': this.criteria.urlMin ? this.criteria.urlMin : environment.emptyForExport,
            'Url Max': this.criteria.urlMax ? this.criteria.urlMax : environment.emptyForExport,
            'Content Min': this.criteria.contentMin ? this.criteria.contentMin : environment.emptyForExport,
            'Content Max': this.criteria.contentMax ? this.criteria.contentMax : environment.emptyForExport,
        }];
    }
}
