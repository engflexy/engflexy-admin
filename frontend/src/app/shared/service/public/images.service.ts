import {Injectable} from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from "../../../../environments/environment";
import {Observable} from "rxjs";


@Injectable({
    providedIn: 'root'
})
export class ImagesService {
    API: string = environment.apiUrl + 'app/images/'

    constructor(private http: HttpClient) {
    }

    public generate_img_url(fileName: string, form): Observable<string> {
        const headers = new HttpHeaders();
        headers.append('Content-Type', 'multipart/form-data'); // Set the correct content type.
        return this.http.post<string>(this.API + `generate-image-url/${fileName}`, form);
    }


    findOptimized(link): Observable<any> {
        console.log(this.API + `optimized/${link}`)
        return this.http.get<any>(this.API + `optimized/${link}`);
    }

}
