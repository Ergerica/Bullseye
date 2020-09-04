//
//  ViewController.swift
//  BullsEye
//
//  Created by Ray Wenderlich on 6/13/18.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var currentValue: Int = 0
  var targetValue: Int = 0
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
    startNewGame()
    
    let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
    slider.setThumbImage(thumbImageNormal, for: .normal)
    let thumbImageHighlighter = #imageLiteral(resourceName: "SliderThumb-Highlighted")
    slider.setThumbImage(thumbImageHighlighter, for: .highlighted)
    let insets = UIEdgeInsets(top:0,left:14, bottom:0, right:14)
    
    let trackLeftImage =  #imageLiteral(resourceName: "SliderTrackLeft")
    let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
    
    let trackRightImage =  #imageLiteral(resourceName: "SliderTrackRight")
    let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    
    
  }
  @IBAction func startNewGame(){
    score = 0;
    round = 0;
    startNewRound()
        
  }
  @IBAction func showAlert() {
    
    var difference : Int
    difference = targetValue - currentValue
    difference = abs(difference)
    var points = 100 - difference
    let message = "You scored \(points)"
    
    score+=points
    let title: String
    
    if difference == 0 {
        title = "Perfect"
        points+=100
    }else if difference < 5{
        title = "You almost had it"
        if difference < 1{
            points+=50
        }
    } else if difference < 10{
         title = "That's still pretty good"
    }else{
        title = "Not even close..."
    }
     
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: {
        action in
        self.startNewRound()
    })
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
    
    
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



