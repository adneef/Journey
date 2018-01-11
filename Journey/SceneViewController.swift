//
//  SceneViewController.swift
//  Journey
//
//  Created by Adam Neef on 1/10/18.
//  Copyright © 2018 Adam Neef. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {

  //variables for the moving display parts of the app
  @IBOutlet weak var mainText: UITextView!
  @IBOutlet weak var leftButton: UIButton!
  @IBOutlet weak var rightButton: UIButton!
  @IBOutlet weak var backgroundImage: UIImageView!
//  LeftButton.isHidden = true
//  RightButton.isHidden = true
  

  //variables that control the story flow and delivery content
  var storyPosition: Int = 1
  let scenes: [Int: String] = [1: "This is the first scene", 2: "This is the second scene", 3: "This is the third scene"]
  let decisions = [1:[2: "Go Left", 3: "Go Right"], 2:[4: "Go Forward", 5: "Go Back"]]
  let decisionPoint: Bool = false
  
  //variables for buttons and content
  var leftButtonNextSceneNumber: Int? = nil
  var rightButtonNextSceneNumber: Int? = nil
  var leftButtonText: String? = nil
  var rightButtonText: String? = nil

  override func viewDidLoad() {
    super.viewDidLoad()
    renderStory(storyPosition, scenes, decisions)
  }
  
  func renderStory( _ pos: Int, _ scene: [Int: String], _ decision:[Int:[Int:String]]) {
    mainText.text = scene[pos]
    
    for k in decision[pos]!.keys {
      if leftButtonNextSceneNumber == nil {
        leftButtonNextSceneNumber = k
      } else {
        rightButtonNextSceneNumber = k
      }
    }
    
    for v in decision[pos]!.values {
      if leftButtonText == nil {
        leftButtonText = v
      } else {
        rightButtonText = v
      }
    }
    
    leftButton.setTitle("\(leftButtonText!)", for: .normal)
    rightButton.setTitle("\(rightButtonText!)", for: .normal)
  }
  
  @IBAction func leftButtonPushed() {
    storyPosition = leftButtonNextSceneNumber!
    renderStory(storyPosition, scenes, decisions)
  }
  
  @IBAction func rightButtonPushed() {
    storyPosition = rightButtonNextSceneNumber!
    renderStory(storyPosition, scenes, decisions)
  }
    
}
