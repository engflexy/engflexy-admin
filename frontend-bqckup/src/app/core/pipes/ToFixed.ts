import {Pipe, PipeTransform} from '@angular/core';

@Pipe({
    name: 'toFixed',
    standalone: true
})
export class ToFixed implements PipeTransform {
    transform(value: number, digits: number): number {
        const fixedValue = value.toFixed(digits);
        return parseFloat(fixedValue);
    }
}
