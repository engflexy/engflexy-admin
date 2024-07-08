// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
    production: false,
    dateFormatCreate: 'dd/mm/yy',
    dateFormatEdit: 'dd/mm/yy',
    dateFormatView: 'dd/mm/yy',
    dateFormatList: 'dd/MM/yyyy',
    trueValue: 'Vrai',
    falseValue: 'Faux',
    emptyForExport: '-----',

    apiUrlAlcservice: 'http://localhost:8036/api/',
    loginUrl: 'http://localhost:8036/',
    apiUrl: 'http://localhost:8036/',

    rootAppUrl: 'app',

};


/*
// create new component
ng g c path/component-name --skip-import --skip-tests
 EX: ng g c modules/admin/manage-salary/create-salary --skip-import --skip-tests

 // create new module
 ng g module path/module-name  --skip-tests
 EX: ng g module modules/admin/manage-salary/salary --skip-tests


 */
