//
//  SceneViewController.swift
//  Journey
//
//  Created by Adam Neef on 1/10/18.
//  Copyright © 2018 Adam Neef. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {

  @IBOutlet weak var MainText: UITextView!
  @IBOutlet weak var LeftButton: UIButton!
  @IBOutlet weak var RightButton: UIButton!
  @IBOutlet weak var TitleBox: UILabel!
  @IBOutlet weak var BackgroundImage: UIImageView!
  
  var storyPosition: String = "1"
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
