//
//  Question.swift
//  Quizzler
//
//  Created by Evgenii Lysenko on 1/9/22.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        rightAnswer = correctAnswer
    }
}
