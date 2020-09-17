//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var count: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progessBar: UIView!
    
    @IBOutlet weak var progressLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1) {
            pickedAnswer = true
        } else { pickedAnswer = false }
        
        checkAnswer()
        nextQuestion()
    }
    
    
    func updateUI() {
        progressLabel.text = "\(count + 1) / 13"
        scoreLabel.text = "Score: \(score)"
        progessBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(count+1)
    }
    

    func nextQuestion() {
        questionLabel.text=allQuestions.list[count].questionText
    }
    
    
    func checkAnswer() {
        let firstAnswer = allQuestions.list[count].answer
        if(firstAnswer == pickedAnswer) {
            ProgressHUD.showSuccess("right")
            score += 1
            print("right \(score)")
        } else {
            ProgressHUD.showError("Wrong")
            print("false")
        }
        
         
        if (count<12) {
            count += 1
        } else {
            let alert = UIAlertController(title: "Alert", message: "there is no more questions", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default , handler: { (UIAlertAction) in  self.startOver() })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()
        
    }
    
    
    func startOver() {
       count = 0
        score = 0
        nextQuestion()
        updateUI()
    }
    

    
}
