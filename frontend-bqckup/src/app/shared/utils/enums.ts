export enum SectionStatus {
    VALIDATE = "Validate",
    CONTENU_MESSING = "Contenu Messing",
    MEDIA_MESSING = "Media Messing",
    QUIZ_MESSING = "Quiz Messing",
    PENDING = "Pending",
}

export enum LEVELS {
    ELEMENTARY = "1 ELEMENTARY",
    PRE_INTERMEDIATE = "2 PRE INTERMEDIATE",
    INTERMEDIATE = "3 INTERMEDIATE",
    UPPER_INTERMEDIATE = "4 UPPER INTERMEDIATE",
    ADVANCED = "5 ADVANCED",
}

export enum TYPE_HOMEWORK {
    WATCH_IT = "Watch it",
    PHRASEBOOK = "Phrasebook",
    WRITE_IT_UP = "Write it Up",
    LETS_PRACTICE = "Let\'s Practice",
    READING = "Reading",
    LIFE_STORY = "Life Story",
}

export enum TYPE_QUESTION {
    CHOOSE_THE_CORRECT_ALTERNATIVE = 't1',
    WRITE_IT_UP = 't2',
    TRANSLATE_THE_PHRASE = 't3',
    CORRECT_THE_MISTAKE = 't4',
    TRUE_OR_FALSE = 't5',
    WRITE_THE_CORRECT_FORM = 't6',
    DESCRIBE_WHAT_YOU_SEE = 't7',
    READ_AND_ADD_NEW_WORDS = 't8',
    WATCH_AND_ADD_NEW_WORDS = 't9',
    PUT_WORDS_TO_GAP = 't10',
    PUT_IN_ORDER = 't11',
    WORD_BY_WORD = 't12',
    DRAG_AND_DROP = 't13',
}

export enum Role {
    TEACHER = "TEACHER",
    ADMIN = "ADMIN",
    ADVERTISER = "ADVERTISER",
    STUDENT = "STUDENT"
}

export enum TYPE_INSCRIPTION {
    PENDING = "Pending",
    VALIDATE = "Validated",
    PAID = "PAID",
    REFUSED = "refused"
}
export enum ContentType {
    IMAGE = "IMAGE",
    MULTI_IMAGE = "MULTI_IMAGE",
    VIDEO = "VIDEO",
    CONTENT = "CONTENT",
    QUIZ = "QUIZ"
}


export enum CategorySections {
    WARM_UP = 'Warm up',
    GET_TO_KNOW = 'Get to know',
    DISCUSSION = 'Discussion',
    LIFE_STORY = 'Life Story',
    GAMES = 'Games',
    LETS_PRACTICE = 'Let\'s practice',
    LETS_SUM_UP = 'Let\'s sum up',
    VOCABULARY = 'Vocabulary',
    HOME_WORK_REVIEW = 'Home Work Review',
    ROLE_PLAY = 'Role Play'
}


export const SECTION_STATUS_LIST = [
    SectionStatus.VALIDATE,
    SectionStatus.PENDING,
    SectionStatus.MEDIA_MESSING,
    SectionStatus.CONTENU_MESSING,
    SectionStatus.QUIZ_MESSING,
]
