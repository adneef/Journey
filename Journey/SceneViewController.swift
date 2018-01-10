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
  @IBOutlet weak var MainText: UITextView!
  @IBOutlet weak var LeftButton: UIButton!
  @IBOutlet weak var RightButton: UIButton!
  @IBOutlet weak var BackgroundImage: UIImageView!

  //variables that control the story flow and delivery content
  var storyPosition: Int = 1
  let scenes: [Int: String] = [1: "This is the first scene", 2: "This is the second scene", 3: "This is the third scene"]
  let decisions = [1:[2:"Go Left", 3: "Go Right"], 2:[3:"Go Forward", 4:"Go Back"]]
  let decisionPoint: Bool = false

  override func viewDidLoad() {
    super.viewDidLoad()
    renderStory(storyPosition, scenes, decisions)
  }
  
  func renderStory(_ pos: Int, _ scene: [Int: String], _ decision:[Int:[Int:String]]) {
    MainText.text = scene[pos]
    LeftButton.setTitle("\(decision[pos]![pos+1]!)", for: .normal)
    RightButton.setTitle("\(decision[pos]![pos+2]!)", for: .normal)
  }
  
  @IBAction func progessStory() {
    storyPosition += 1
    renderStory(storyPosition, scenes, decisions)
  }
    
}
