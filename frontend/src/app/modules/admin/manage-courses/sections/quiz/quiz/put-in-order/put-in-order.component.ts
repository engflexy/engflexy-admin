import {ChangeDetectorRef, Component, Input, OnInit} from '@angular/core';
import {CdkDragDrop, moveItemInArray} from "@angular/cdk/drag-drop";
import {QuestionDto} from "../../../../../../../shared/model/quiz/Question.model";

@Component({
    selector: 'app-put-in-order',
    templateUrl: './put-in-order.component.html',


})
export class PutInOrderComponent implements OnInit {
    @Input()
    question: QuestionDto = new QuestionDto()
    showError: boolean = false
    dragAndDropAnswer: Map<string, string> = new Map<string, string>()
    values: Map<number, string> = new Map<number, string>()
    listOfWords: Array<string> = new Array<string>()
    originalListOfWords: Array<string> = new Array<string>();

    listOfText: Map<number, string> = new Map<number, string>()
    value: string
    index: number = 0
    checked: boolean = false
    userOrder: Array<string> = []; // To store the user's current order

    constructor(private ref: ChangeDetectorRef) {
    }


    ngOnInit() {
        //this.checked = false
        if (this.question?.libelle) {
            this.extractData(this.question.libelle)
        } else {
            this.showError = true
        }
    }


    private extractData(data: string): void {
        // Remove HTML tags and entities
        const cleanData = data.replace(/<\/?[^>]+(>|$)/g, "").replace(/&#160;/g, " ");

        // Split the cleaned data into sentences
        const sentences = cleanData.split(/(?<=[.!?])\s+/).filter(sentence => sentence.trim() !== '');

        // Create a map where the index is the number removed from the start of each sentence
        const sentenceMap: { [index: number]: string } = {};

        sentences.forEach(sentence => {
            // Extract number and sentence text
            const match = sentence.match(/^(\d+)\s+(.*)$/);
            if (match) {
                const index = parseInt(match[1], 10);
                const text = match[2];
                sentenceMap[index] = text;
            }
        });

        // Populate originalListOfWords with sentences based on their indices
        this.originalListOfWords = Object.keys(sentenceMap)
            .sort((a, b) => parseInt(a, 10) - parseInt(b, 10)) // Sort keys numerically
            .map(key => sentenceMap[parseInt(key, 10)]);

        // Convert sentenceMap to an array for shuffling
        const sentenceArray = Object.keys(sentenceMap)
            .map(key => ({ index: parseInt(key, 10), text: sentenceMap[parseInt(key, 10)] }));

        // Fisher-Yates shuffle algorithm
        for (let i = sentenceArray.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [sentenceArray[i], sentenceArray[j]] = [sentenceArray[j], sentenceArray[i]];
        }

        // Populate listOfWords with shuffled sentences
        this.listOfWords = sentenceArray.map(item => item.text);

        // Initialize dragAndDropAnswer with the original sentence order
        this.dragAndDropAnswer = new Map(this.originalListOfWords.map((text, i) => [(i + 1).toString(), text]));

        // Notify Angular of the change
        this.ref.detectChanges();

        console.log("Original List of Words:", this.originalListOfWords);
        console.log("Shuffled List of Words:", this.listOfWords);
    }

    public onDrop(event: CdkDragDrop<string[]>): void {
        if(!this.checked) {
            moveItemInArray(this.listOfWords, event.previousIndex, event.currentIndex);

            this.userOrder = [...this.listOfWords];
        }

    }

    public check(): void {
        // Compare userOrder with originalListOfWords
        const correct = this.userOrder.every((sentence, i) => sentence === this.originalListOfWords[i]);

        this.checked = true;

        if (correct) {
            console.log("The order is correct!");
        } else {
            console.log("The order is incorrect.");
        }
    }

    public getBackgroundColor(sentence: string, index: number): string {
        if (!this.checked) {
            return 'transparent'; // Default background color before checking
        }

        const correctIndex = Array.from(this.dragAndDropAnswer.keys()).find(key => this.dragAndDropAnswer.get(key) === sentence);
        if (correctIndex === (index + 1).toString()) {
            return '#F5FFFA'; // Correct placement color
        } else if (correctIndex) {
            return '#FFE4E1'; // Incorrect placement color
        }

        return 'transparent'; // Default background color if no answer is provided
    }

   public getTooltipText(sentence: string, index: number): string {
        // Get the original order from the Map
        const correctOrder = Array.from(this.dragAndDropAnswer.entries())
            .find(([_, value]) => value === sentence);

        // Return the order number for the tooltip, or default message
        return correctOrder ? `${Array.from(this.dragAndDropAnswer.keys()).indexOf(correctOrder[0]) + 1}` : 'No order';
    }

}
