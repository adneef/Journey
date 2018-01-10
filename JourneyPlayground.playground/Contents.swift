import UIKit

  
  //variables for the moving display parts of the app
//  @IBOutlet weak var MainText: UITextView!
//  @IBOutlet weak var LeftButton: UIButton!
//  @IBOutlet weak var RightButton: UIButton!
//  @IBOutlet weak var TitleBox: UILabel!
//  @IBOutlet weak var BackgroundImage: UIImageView!

  //variables that control the story flow and delivery content
  var storyPosition: Int = 1
  let scenes: [Int: String] = [1: "This is the first scene", 2: "This is the second scene", 3: "This is the third scene"]
  let decisions = [1:[2:"Go Left", 3: "Go Right"], 2:[3:"Go Forward", 4:"Go Back"]]
  let decisionPoint: Bool = false

print(decisions[1]![2]!)
  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    renderStory(storyPosition, scenes)
//  }

//  func renderStory(_ pos: Int, _ scene: [Int: String]) {
//    MainText.text = scene[pos]
//  }

//  @IBAction func progessStory() {
//    storyPosition += 1
//    renderStory(storyPosition, scenes)
//  }

