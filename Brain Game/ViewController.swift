//
//  ViewController.swift
//  Brain Game
//
//  Created by Ryan Cornel on 12/10/20.
//

import UIKit


enum Colors {
    
    case gold, silver, black, blue
    
    var colorNames: UIColor {
        switch self {
        case .gold:
            return #colorLiteral(red: 0.9882352941, green: 0.7607843137, blue: 0, alpha: 1)
        case .silver:
            return #colorLiteral(red: 0.6830701828, green: 0.6830701828, blue: 0.6830701828, alpha: 1)
        case .black:
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .blue:
            return #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        }
    }
    
    var textColors: String {
        switch self {
        case .gold:
            return "gold"
        case .silver:
            return "silver"
        case .black:
            return "black"
        case .blue:
            return "blue"
        }
    }
    
    
    init() {
        self = Colors.allCases[Int(arc4random_uniform(UInt32(Colors.allCases.count)))]
    }
}
    
extension Colors: CaseIterable {
        mutating func getRandomColor() { //updates color to a random Color from all Color cases //CaseIterable allows me to use the allCases typeProperty
            self = Colors.allCases[Int(arc4random_uniform(UInt32(Colors.allCases.count)))]
        }
    }


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer()
    }
    
    
   
    
    @IBAction func yesButton(_ sender: Any) {
        if topColor != bottomColor {
            score -= 1
            
        } else {
            score += 1
            
        }
        randomColors()
        scoreLabel.text = "\(score)"
        
    }
    
    @IBAction func noButton(_ sender: Any) {
        if topColor == bottomColor {
            score -= 1
            
        } else {
            score += 1
            
        }
        randomColors()
        scoreLabel.text = "\(score)"
    }
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    var topColor = Colors()
    var bottomColor = Colors()
    var score = 0
    var time = 25
    
    func randomColors() {
        topColor = Colors()
        bottomColor = Colors()
        
        topLabel.text = topColor.textColors
        bottomLabel.textColor = bottomColor.colorNames
        bottomLabel.textColor = topColor.colorNames
        
    }
    
    func timer() {
        var coutner = 0
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            coutner += 1
            self.timerLabel.text = "\(self.time-coutner)"
            if coutner == self.time {
                timer.invalidate()
                self.score = 0
                self.scoreLabel.text = "\(self.score)"
                self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }






