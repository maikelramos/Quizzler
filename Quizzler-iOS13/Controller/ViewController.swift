//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizMain = QuizMain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func verifyAnswer(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let checkUser = quizMain.checkAnswer(userAnswer)
        
        if checkUser{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizMain.questionProgress()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI(){
        questionLabel.text = quizMain.getQuestionText()
        progressBar.progress = quizMain.getProgress()
        choice1Button.backgroundColor = UIColor.clear
        choice2Button.backgroundColor = UIColor.clear
        choice3Button.backgroundColor = UIColor.clear
        choice1Button.setTitle(quizMain.getChoices()[0], for: .normal)
        choice2Button.setTitle(quizMain.getChoices()[1], for: .normal)
        choice3Button.setTitle(quizMain.getChoices()[2], for: .normal)
        scoreLabel.text = "Score: \(quizMain.getScore())"
        
    }
}

