//
//  SceneViewController.swift
//  Journey
//
//  Created by Adam Neef on 1/10/18.
//  Copyright © 2018 Adam Neef. All rights reserved.
//

import UIKit

import AVFoundation

import AudioToolbox

class SceneViewController: UIViewController, UITextViewDelegate {

  //variables for the moving display parts of the app
  @IBOutlet weak var mainText: UITextView! {
    didSet {
      mainText.delegate = self
    }
  }
  
  @IBOutlet weak var leftButton: UIButton!
//  {
//    didSet {
//      leftButton.isHidden = true
//    }
//  }
  
  @IBOutlet weak var rightButton: UIButton!
  @IBOutlet weak var backgroundImage: UIImageView!
  @IBOutlet weak var restartButton: UIButton!
  
//  LeftButton.isHidden = true
//  RightButton.isHidden = true
  
  //variables that control the story flow and delivery content
  var storyPosition: Int = 1
  let scenes: [Int: String] =
    //MARK:  First scene
    [1: "You startle awake, your senses overwhelmed - you're laying on something soft and crunchy, your whole body feels dull and sluggish, someone whispers in your ear, your eyes can't seem to focus.  Are they even open?  Yes, they are.  You're looking up at a blurry scene of white, green, and brown shaking and twisting violently.\n\nPain.\n\nCold?\n\nYou lay there for a moment, and take in a deep, frigid breath.\n\nIt\'s both.You decide to stand up, and see what's going on.  As you try, your motion is halted.  You look down and see a large branch laying on your leg.  It doesn't look too heavy.  You might be able to lift it off.  Or you could try to wriggle out from underneath of it.\n\nWhat do you do?",
     //MARK:  Second scene
      
    2: """
      You push on the branch but it's too heavy to move.  You try two times, three times, but finally are forced to give up.  As you lay there, you notice more keenly the sound of the wind and the groan of the trees.
      
      What do you do?
      """,
    //MARK: Third scene
    3: """
      You wiggle out from under it. You slowly stand up.  You're groggy, feeling more aches and pains that you didn't notice until now Suddenly you get dizzy.  You reach a hand out toward the nearest tree to steady yourself, putting the other hand on your throbbing head. The wind gusts louder as the trees shake and creak.
      
      You feel something crusty on your face with your...bare hand?  It's too cold for bare hands.  Your hand comes away clean, but you're sure the crust is blood.  You must have broken that branch off this tree while running, knocked yourself out cold, and the branch dropped on your foot.  Why where you running?   You try to think back, but you can't remember.
      
      You decide to look around.  You quickly notice a glove on the ground near you.  You pick it up and put it on.  Now you have a set, and your cold hand is covered.  Your vision starts to clear and you take a step away from the three.  You look around and notice tracks, footprints leading toward you, and more tracks leading away but fewer of them.  Both seem to head toward more trees, both on flat ground. There doesn't seem to be any difference in terrain.
      
      Which way?
      """,
    //MARK: Fourth scene
    4: """
      You decide to walk with the tracks, figuring whoever made those tracks was heading that way for a reason.  You walk for a while, as your head clears more.  The whispering you heard when you woke up seems to be wind blowing through the trees.  You look up, and see the tops of the trees violently blowing, despite the relative calm down where you are.  The sound is so loud, though.  You turn your eyes down to the ground again and continue forward, following the tracks.  The sun is low in the sky, and you know your sunlight isn't going to last.
      
      You come around a tree a little while later, and find the smoldering remains of a fire.  You stop to look around, but don't see anyone.  The trail of footprints stops here.  You take a quick look around, and hear, above the sound of the suddenly loud, gusting wind, something flapping.  You look up to see something dark stuck in a tree, snapping in the wind.  Strangely, the branches on that tree have been removed to two or three times your height.  It looks like you're not getting up there.
      
      And why are the branches missing?  There are a lot of sticks laying around, forming a circle around the fire, about ten feet across. You realize the sun's going down, you've got only a few minutes of day light left.  There's plenty of fuel around to start the fire back up, or you could take a look around.
      
      What do you want to do?
      """,
    //MARK: Fifth scene
    5: """
      You start walking against the tracks, curious what people were moving away from.  You crunch your way through the snowy forest, listening to the wind gust and howl as the the trees groan from the force of it.  The scenery is constant - brown bark, green-needled trees, flecks of pure white snow dotting the landscape from every angle, making distances hard to judge, the whole scene wrapped in a sonic cocoon of ever present, shifting air.  You plod on...
      
      The sun is at your back and dips low in the sky you come to the edge of the forest.  Beyond the trees the wind is a tide carrying snow in every direction, seeming to never let it fall to the ground, and breaking on the first few rows of trees, right where the tracks lead.  The sound vibrates your bones. The wind is deafening, the snow blinding, but as you squint against the snow, you can make out a couple of dark objects not far away.  You pull your hood tight and take a step beyond the trees.
      
      You stumble as you're blasted sideways.  You take several quick steps and almost fall before you recover.  The objects are close now.  You fight for a few more steps to bring them in to focus.  You can't be more than five feet away, but the whiteout forces you closer to make them out.
      
      Rocks.  They're exposed rocks.  You're near the edge of a ravine.  You carefully step toward the ravine, hoping and not hoping to see...anything.
      
      Suddenly the wind blasts you from behind.  You turn around to lean in to it, crouch low to reduce your surface area.  The sun is a dispersed orange blob through the blizzard.  You put your head down to ride out the gust.  Once it abates, you look up - the sun is partially obscured.  There's something very dark, tall, and thin, like a small tree, blocking what little sunlight is coming through the snow screen.  The thing is past the trees.  Was there a 'tree' that far out before?  You can't remember - you were too busy fighting the wind and snow.
      
      You take the opportunity to look back at the ravine, thinking you might see something now that the wind died down.  You peer over the edge but see nothing.  The ravine is deeper than you thought.
      
      You hear a crunch behind you.  You turn quickly to see the thing an arm's length away - dark and looming.  Surprised, you take in a quick breath and instinctively take a step backward, in to the ravine...
      """,
    //MARK: Sixth scene
    6:"""
      You decide to rekindle the fire, picking up sticks in the circle, and setting a few on the fire.  The sticks pop audibly as you pick them up, a little louder than normal for dried timber.  Same for your footsteps on the snow.  Once the fire is going well, you take off your wet clothes and try to dry them off.  As you sit there, tired, warm, and less uncomfortable, your eyes close.  Only a blink, it seems.
      
      When you wake up, surely only a moment later, the fire is out, though it seems the logs haven't burned at all.  You try to stand up,  but the foot the branch fell on weak catches up with you, and you fall.  Did it get darker?  Are the trees closer?  You blink, only a blink, and open your eyes to all-encompassing darkness - no trees, no fire, no snow, no light.  You try your hardest to keep your eyes open, but finally must close them...
      """,
    //MARK: Seventh Scene
    7: """
      You decide to take a look around. You glance up again at the flapping, dark object in the tree.  There's no way to climb it with all the lower branches missing, so you move on for now. You follow along the circle of sticks, being careful not to move them.  Just beyond the edge of the sticks is a dark object, buried in the snow.  You take a closer look.
      
      It's a jacket, just like yours.  You look through the jacket, hoping to find some clue to what's going on. The jacket lots of pockets but you don't find anything. Except...
      a still on flashlight!
      It was buried inside the jacket, and covered in snow, so you wouldn't have seen it from the circle.  You turn the flashlight off, hoping to conserve whatever battery is left.  You also notice a sewn-in patch that matches the patch on your jacket.  Whose jacket was this?
      
      As you come back toward the circle, you notice a pile of sticks, just outside the circle.
      
      The sunlight continues to fade.
      """,
    //MARK: Eighth scene
    8: """
      You decide to take a look at the bundle of sticks.  As you get closer, you notice the sticks form a pattern, an arrow, pointing away from the circle.  You decide to follow the arrow, and after taking a few steps, you discover a few, nearly filled in footprints.  No, not filled in, very shallow.  And wide.  Maybe snowshoes?  You follow the 'tracks' through the forest, the wind reaching a howl, as the the trees creak under the strain.  And the temperature is dropping.
      
      Eventually you reach the edge of a clearing, just as the last of the ambient sunlight fades.  In the waning light, you notice how flat the clearing is, only the really tall trees jutting to the sky.  Was this a natural clearing?  Hard to say.
      """,
    //MARK: Ninth scene
      9:"""
        You take out the flashlight, and turn it on.  You step into the clearing to get a better look.  The ground is entirely covered in twigs, sticks, and branches that crack and pop with every footfall.  After a few steps, you come to a really big branch...no, a small tree, about eight feet long, laying on the ground.  You run your flashlight over the length of it and see that some of the branches are still attached, some snapped off, but also the trunk looks like it's been snapped off.
      
        ...
      
        What could snap off the trunk of an eight foot tall tree?  You shine the flashlight in a wide arc, and notice multiple trees that look torn down, some larger than the one in front of you.  And...organized?  There seems to be some pattern to how the trees are laid out...
      
        You take a step forward, and the wind suddenly picks up, a gust that howls from behind as it tears though the clearing.  You brace yourself against the blast, ready for the force of it, only no force comes.  You slowly turn as the wind subsides, and just as your flashlight flickers and goes out, you see the silhouette of a tall, slender...tree? with very thin, outstretched branches, much closer to you in the dark than you remember any thing being.  In the very faint light, you can make out something dark and shiny on the 'tree.'  As you stare at the reflective object, it disappears, then slowly reappears.
      
        The last thing you remember is a physical feeling of darkness, and lots of very thin 'branches' wrapping around your body.
      """,
      //MARK: Tenth scene
      10:"""
      You decide to skirt the clearing, and keep moving before it gets even colder.  As you walk around the clearing, the wind howls at your back.  The gust is loud, violent even, but there is no force.  Confused, you turn on the flashlight and point it in the direction of the gust.  There in the center of the clearing is a tall, thin, dark, unmoving object, with something dark but shiny lodged high in it.  Was that...tree? there before?  You didn't get a good look at the clearing before the light faded away, and the flashlight's beam is too weak to cut that far through the darkness.  Suddenly the shiny object disappears, then reappears.  Snow or a leaf blowing across the 'tree?'  Something feels wrong here.
      
      The object moves toward you.
      """,
      //MARK: Eleventh scene
      11:"""
      You squint your eyes and stare into the darkness.  You take a few steps toward the center of the clearing.  The object hasn't moved again, and the dark thing in or on it hasn't disappeared again.
      
      Snap.
      
      You turn your head reflexively toward the sound, a loud crack to your left in the woods beyond the clearing.  You turn back toward the center of the clearing, shine your flashlight on the object there.
      
      But it's gone.
      
      You turn in a circle, trying to figure out what's going on, but don't see anything except large, downed tree limbs arranged in some kind of pattern.  As you're trying to place the pattern, your flashlight flickers, then dies.  You hear a loud snap again, closer this time.
      
      Crack.
      
      From the other side.  You turn your head quickly to look, but it's too dark to see anything.  The wind gusts, sharp but softly.  You slowly turn your head to look forward, and see nothing but darkness, darker than the black surrounding it.  The darkness shifts into very thin tendrils that move toward you.  You try to run but can't, you're paralyzed.  The darkness wraps around you, and the last thing you remember is opening your eyes as wide as you can, and still being unable to see...
      """,
      //MARK:  Twelfth scene
      12:"""
      You run as fast as you can away from the clearing, and away from the fire, beam from the flashlight bouncing as you try keep it pointed steadily forward.  The sound of wind howls at your back again, and you run faster as your pick your way through the trees.  Are the trees getting thinner?
      
      No time to think as the wind audibly gusts again, closer this time.  You risk a glance over your shoulder, but only see wooded darkness behind you.  You look forward again, the tree line rapidly approaching.  Just as you're about to step out of the trees, the flashlight beam flickers out, comes on again to reveal the ground beyond the trees is gone.
      You pull up short, falling to the snow-covered ground and dropping the flashlight, which goes dark with a crack.
      
      You peer over the edge of the cliff, into a dark ravine.  You hear the wind begin to blow again...
      
      What do you do?
      """,
      //MARK: Thirteenth Scene
      13: """
        You stand and hurl yourself off the cliff, unsure of what lies below.  You fall long enough to take a second breath, then your entire body is stabbed with daggers of ice as your descent slows.  You exhale reflexively in the arctic water, then push toward what you think is the surface, brain in shock, body heavy with clothing, and little to no air left in your lungs to fuel your muscles.  The water's getting darker as you swim...up?  Or is it your vision?  You can't think clearly as the last of your oxygen goes.
      
        You manage another stroke, two strokes, and your head breaks the surface.  You gulp in the air greedily, only to fall back under again, the weight of your soaked clothes dragging you down.  You force yourself up again, and bump into something slimy and floating.  You wrap your arms around it, too tired to do anything else.  The object buoys you up, so in one final great push, you throw your body on top of the thing, probably a log, and hang on.  As you slowly drift, your eyes, as heavy as your water-laden clothing, droop shut...
      
        You wake up in a bed, your wet clothes replaced with clean, dry ones.  You can see your clothing laid out by a roaring fire in a large stone fireplace across the room.  A man is sleeping nearby in a chair, and stirs as you begin to move and make noise.  He blinks a couple times, then looks at you.
      
        'Who...' you begin.
      
        'I pulled you out of the river.  Where did you come from?'
      
        'Woods...'
      
        'Up river?  Those woods are at the base of the 'Mountain of Death.'  They say something terrible lives there.  Is that what happened to you?'
      
        You relax in to bed, slipping back into unconsciousness, leaving the man with only an indeterminate head gesture.
      """,
      //MARK: Fourteenth Scene
      14: """
        You stand up, just as the volume of the wind increases, and begin to run along the edge of the ravine.  Despite the cold, you start to get sweaty in your heavy winter clothing.  You pick the best path you can among the trees, while the trees keep getting thicker, slowing your pace, and the snow near the tree line has been blown away, leaving only cold hard ground.  Your pace slows further as you burn the last of your energy, unsure when you last ate.  You jump over a log, but your foot catches and you tumble to the ground, hard, on the other side.  You hear a short, sharp, gust of wind.  You turn over and see something very tall and slender, the same thing from the clearing before, standing over you, very thin, very dark hands reaching toward you...
        """
  ]
  //MARK: Decisions dictionary
  let decisions = [1:[2: "Try to push the branch off", 3: "Try to wiggle yourself out"],
                  2:[2: "Try to push the branch off again", 3: "Try to wiggle yourself out"],
                  3:[4: "Follow the tracks leading away", 5: "Follow the tracks leading toward you"],
                  4:[6: "Rekindle the fire", 7: "Take a look around"],
                  5:[15: "||||", 16: "||||"],
                  6:[15: "||||", 16: "||||"],
                  7:[8: "Take a look at the sticks", 6: "It's getting dark, I'll build up the fire"],
                  8:[9: "Take out your flashlight and investigate", 10: "Skirt the clearing and move on"],
                  9:[15: "||||", 16: "||||"],
                  10:[11: "I think I just imagined it...", 12: "Run!  Now's the time to run!"],
                  11:[15: "||||", 16: "||||"],
                  12:[13: "Jump!", 14: "Not jumping.  I'll run along the ravine"],
                  13:[15: "||||", 16: "||||"],
                  14:[15: "||||", 16: "||||"],
                  ]
  //decisionPoint unneeded for now.  In a future update, yes.
  //let decisionPoint: Bool = false
  
  let backgroundsArray: [String] = []
  
  //variables for buttons and content
  var leftButtonNextSceneNumber: Int? = nil
  var rightButtonNextSceneNumber: Int? = nil
  var leftButtonText: String? = nil
  var rightButtonText: String? = nil
  var testButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.backgroundImage.image = #imageLiteral(resourceName: "BlurrySnowTreesScaled.jpg")
    renderStory(storyPosition, scenes, decisions)
    UIScreen.main.brightness = 0.2
//    textViewDidScroll(mainText)
//    toggleTorch(on: true)
//    AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
//    AudioServicesPlaySystemSound(1519)
//    AudioServicesPlaySystemSound(1520)
//    AudioServicesPlaySystemSound(1521)
  }
  
  func renderStory( _ pos: Int, _ scene: [Int: String], _ decision:[Int:[Int:String]]) {
    mainText.scrollRangeToVisible(NSRange(location:0, length:0))
//    textViewDidScroll(mainText)
    removeButton()
    restartButton.isHidden = true
    mainText.text = scene[pos]
    appendButton(mainText)
    
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
    
    if leftButtonText == "||||" {
      leftButton.isHidden = true
      rightButton.isHidden = true
      restartButton.isHidden = false
    } else {
      leftButton.setTitle("\(leftButtonText!)", for: .normal)
      rightButton.setTitle("\(rightButtonText!)", for: .normal)
    }
  }
  
  @IBAction func leftButtonPushed() {
    storyPosition = leftButtonNextSceneNumber!
    leftButtonText = nil
    leftButtonNextSceneNumber = nil
    renderStory(storyPosition, scenes, decisions)
  }
  
  @IBAction func rightButtonPushed() {
    storyPosition = rightButtonNextSceneNumber!
    leftButtonText = nil
    leftButtonNextSceneNumber = nil
    renderStory(storyPosition, scenes, decisions)
  }
  
  @IBAction func restart() {
    storyPosition = 1
    leftButtonText = nil
    leftButtonNextSceneNumber = nil
    leftButton.isHidden = false
    rightButton.isHidden = false
    renderStory(storyPosition, scenes, decisions)
  }
  
  func appendButton( _ textView: UITextView) {
    let buttonHeight: CGFloat = 40
    let contentInset: CGFloat = 8
    
    print("The amount of content in the mainTextView is: \(textView.contentSize)")
    textView.contentSize = CGSize(width: textView.contentSize.width, height: textView.contentSize.height
    + buttonHeight * 1.5)
    print("Increased the amount of content in the mainTextView is: \(textView.contentSize)")
    
    textView.textContainerInset = UIEdgeInsets(top: contentInset, left: contentInset, bottom: (buttonHeight + contentInset * 2), right: contentInset)
    
    testButton = UIButton(frame: CGRect(x: contentInset, y: textView.contentSize.height - buttonHeight -  contentInset, width: textView.contentSize.width - contentInset * 2, height: buttonHeight))
    
    testButton.setTitle("BUTTON", for: .normal)
    testButton.setTitleColor(UIColor.red, for: .normal)
    testButton.backgroundColor = UIColor.lightGray
    
    textView.addSubview(testButton)
  }
  
  func removeButton() {
    if let testButton = testButton {
     testButton.removeFromSuperview()
    } else {
      print("No button to remove!")
    }
  }
  
  func textViewDidScroll(_ scrollView: UIScrollView) {
    
    leftButton.isHidden = scrollView.contentOffset.y + scrollView.bounds.height < scrollView.contentSize.height
    
//    if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height) {
//      print( "View scrolled to the bottom" )
//    }
  }
  
  func toggleTorch(on: Bool) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }
    
    if device.hasTorch {
      do {
        try device.lockForConfiguration()
        
        if on == true {
          device.torchMode = .on
        } else {
          device.torchMode = .off
        }
        
        device.unlockForConfiguration()
      } catch {
        print("Torch could not be used")
      }
    } else {
      print("Torch is not available")
    }
  }
}
