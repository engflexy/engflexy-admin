declare var responsiveVoice: any;

export function sound(son: string) {
    responsiveVoice.speak(son);
}

