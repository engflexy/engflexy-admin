import { Injectable } from '@angular/core';
import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable()
export class DateFormatInterceptor implements HttpInterceptor {

    intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
        const modifiedReq = req.clone({
            body: this.formatDates(req.body)
        });
        return next.handle(modifiedReq);
    }

    private formatDates(body: any): any {
        if (body === null || body === undefined) {
            return body;
        }

        if (typeof body !== 'object') {
            return body;
        }

        for (const key of Object.keys(body)) {
            const value = body[key];
            if (this.isDate(value)) {
                body[key] = this.formatDate(value);
            } else if (typeof value === 'object') {
                body[key] = this.formatDates(value);
            }
        }

        return body;
    }

    private isDate(value: any): boolean {
        return Object.prototype.toString.call(value) === '[object Date]';
    }

    private formatDate(date: Date): string {
        const day = this.padZero(date.getDate());
        const month = this.padZero(date.getMonth() + 1);
        const year = date.getFullYear();
        const hours = this.padZero(date.getHours());
        const minutes = this.padZero(date.getMinutes());
        const seconds = this.padZero(date.getSeconds());

        return `${day}/${month}/${year} ${hours}:${minutes}:${seconds}`;
    }

    private padZero(value: number): string {
        return value < 10 ? '0' + value : value.toString();
    }
}
