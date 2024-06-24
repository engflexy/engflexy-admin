export class BaseDto {
    public id: number;

    protected constructor(id?: number) {
        this.id = id;
    }
}
