//
//  triviaQuestions.swift
//  TrueFalseStarter
//
//  Created by David Welsh on 7/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import GameKit
import Foundation



struct Answer {
    let answer: String
    let correct: Bool
    
}


struct TriviaQuestion {
    let question: String
    let answer1: Answer
    let answer2: Answer
    let answer3: Answer
    let answer4: Answer
    
}

let question1 = TriviaQuestion(question: "Only U.S. President to serve more than two consectutive terms", answer1: Answer(answer:"George Washington", correct: false), answer2: Answer(answer: "Franklin D. Roosevelt", correct: true), answer3: Answer(answer: "Woodrow Wilson", correct: false), answer4: Answer(answer: "Andrew Jackson", correct: false))
let question2 = TriviaQuestion(question: "Which of the following countries has the most residents", answer1: Answer(answer:"Nigeria", correct: true), answer2: Answer(answer:"Russia", correct: false), answer3: Answer(answer: "Iran", correct: false), answer4: Answer(answer: "Vietnam", correct: false))
let question3 = TriviaQuestion(question: "What year was the U.N. founded", answer1: Answer(answer: "1918", correct: false), answer2: Answer(answer: "1919", correct: false), answer3: Answer(answer:"1945", correct: true), answer4: Answer(answer: "1923", correct: false))
let question4 = TriviaQuestion(question: "Where was the Titanic's intended arrival location?", answer1: Answer(answer: "Paris", correct: false), answer2: Answer(answer: "New York", correct: true), answer3: Answer(answer:"Boston", correct: false), answer4: Answer(answer: "Washington D.C.", correct: false))
let question5 = TriviaQuestion(question: "Which nation produces the most oil?", answer1: Answer(answer: "Iran", correct: false), answer2: Answer(answer: "Saudi Arabia", correct: false), answer3: Answer(answer:"Iraq", correct: false), answer4: Answer(answer: "Canada", correct: true))
let question6 = TriviaQuestion(question: "Which of the following rivers is the longest?", answer1: Answer(answer: "Yangtze", correct: false), answer2: Answer(answer: "Mississippi", correct: true), answer3: Answer(answer:"Congo", correct: false), answer4: Answer(answer: "Yough", correct: false))
let question7 = TriviaQuestion(question: "Which city is the oldest?", answer1: Answer(answer: "Mexico City", correct: true), answer2: Answer(answer: "CapeTown", correct: false), answer3: Answer(answer:"San Jaun", correct: false), answer4: Answer(answer: "Sydney", correct: false))
let question8 = TriviaQuestion(question: "Which country first allowed women to vote in national elections?", answer1: Answer(answer: "United States", correct: false), answer2: Answer(answer: "Poland", correct: true), answer3: Answer(answer:"France", correct: false), answer4: Answer(answer: "Sweden", correct: false))
let question9 = TriviaQuestion(question: "Which conty won the most medals in the 2012 Summer Olympics?", answer1: Answer(answer: "France", correct: false), answer2: Answer(answer: "Japan", correct: false), answer3: Answer(answer:"U.S.", correct: false), answer4: Answer(answer: "United Kingdom", correct: true))


var trivia = [question1, question2, question3, question4, question5, question6, question7, question8, question9]
