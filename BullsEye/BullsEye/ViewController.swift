//
//  ViewController.swift
//  BullsEye
//
//  Created by Syed ali Abbas on 4/13/20.
//  Copyright © 2020 Syed ali Abbas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewRound()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert () {
        
        let diffrence = abs(targetValue - currentValue)
        var points = 100 - diffrence
        
        score += points
        
        let title: String
        if diffrence == 0 {
            title = "Perfect!"
            points += 100
        } else if diffrence < 5{
            title = "You almost had it!"
            if diffrence == 1 {
                points += 50
            }
        } else if diffrence < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not even close..."
        }
        
        
        let message = "You Scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        let roundedValue = slider.value.rounded()
        
        
        
        currentValue = Int(roundedValue)
        
    }
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

}

