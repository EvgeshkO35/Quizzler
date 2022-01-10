//
//  ViewController.swift
//  Quizzler
//
//  Created by Evgenii Lysenko on 1/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer) // return true or false after check answer
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green  // - set background color to green if answer was right
        } else {
            sender.backgroundColor = UIColor.red // - set background color to red if answer was incorrect
        }
        
        quizBrain.nextQuestion() // no matter was answer right or not - it's go through all questions
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    // Function for update all UI elements: Question Label; All three button with answers; Progress Bar; Score Label; and also clear the background color after 0.2 seconds with Timer.scheduledTimer for all three buttons
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        choiceOneButton.setTitle(answerChoices[0], for: .normal)
        choiceTwoButton.setTitle(answerChoices[1], for: .normal)
        choiceThreeButton.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choiceOneButton.backgroundColor = UIColor.clear
        choiceTwoButton.backgroundColor = UIColor.clear
        choiceThreeButton.backgroundColor = UIColor.clear
    }
}

