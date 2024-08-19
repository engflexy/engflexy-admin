import {BaseDto} from "../../../zynerator/dto/BaseDto.model";


export class PackageCollaboratorDto extends BaseDto {

    public libelle: string;

    public  school: null | boolean;

    public nbrStudentBase: null | number;

    public priceBase: null | number;

    public priceBaseOld: null | number;

    public priceLogo: null | number;

    public priceLogoOld: null | number;

    public priceColor: null | number;

    public priceColorOld: null | number;

    public priceBannerAd: null | number;

    public priceBannerAdOld: null | number;


    constructor() {
        super();

        this.libelle = '';
        this.school=null;
        this.nbrStudentBase = null;
        this.priceBase = null;
        this.priceBaseOld = null;
        this.priceLogo = null;
        this.priceLogoOld = null;
        this.priceColor = null;
        this.priceColorOld = null;
        this.priceBannerAd = null;
        this.priceBannerAdOld = null;

    }

}
