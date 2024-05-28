export function generateRandomString(length: number): string {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

// global-methods.ts
export function compareObjects(object1: any, object2: any) {
    return object1 && object2 && object1.id === object2.id;
}

export function compareObjectsName(object1: any, object2: any) {
    return object1 && object2 && object1.name === object2.name;
}
