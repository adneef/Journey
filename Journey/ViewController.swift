//
//  ViewController.swift
//  Journey
//
//  Created by Adam Neef on 1/10/18.
//  Copyright © 2018 Adam Neef. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var coldButton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    fixButtonLabels(coldButton)
  }

  func fixButtonLabels(_ button: UIButton) {
    button.contentVerticalAlignment = .fill
    button.contentMode = .center
    button.imageView?.contentMode = .scaleAspectFit
  }

}

