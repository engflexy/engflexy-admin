import {Pipe, PipeTransform} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';

@Pipe({
    name: 'priceFormat',
    standalone: true
})
export class PriceFormatPipe implements PipeTransform {
    constructor(private http: HttpClient) {
    }

    transform(price: any, currency: string): Observable<string> {
        if (currency === 'MAD') {
            // Format the price in MAD
            return new Observable<string>((observer) => {
                observer.next(String(price));
                observer.complete();
            });
        } else {
            // Format the price in USD
            const apiUrl = 'https://api.engflexy.com/app/public/currency-converter/mad-dollar/' + price;
            return this.http.get<string>(apiUrl);
        }
    }
}
