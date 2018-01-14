//
//  Emitter.swift
//  Journey
//
//  Created by Adam Neef on 1/13/18.
//  Copyright © 2018 Adam Neef. All rights reserved.
//

import UIKit

class Emitter {
  static func get(with image: UIImage) -> CAEmitterLayer {
    let emitter = CAEmitterLayer()
    emitter.emitterShape = kCAEmitterLayerLine
    emitter.cornerRadius = 0.9
    emitter.zPosition = 10
    emitter.emitterCells = generateEmitterCells(with: image)
    return emitter
  }
  static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell] {
    var cells = [CAEmitterCell]()
    
    let cell = CAEmitterCell()
    cell.contents = image.cgImage
    cell.birthRate = 0.25
    cell.lifetime = 50
    cell.velocity = CGFloat(25)
    cell.emissionLongitude = (180 * .pi/180)
    cell.emissionRange = (45 * .pi/180)
    cell.scale = 0.8
    cell.scaleRange = 0.2
    
    cells.append(cell)
    
    return cells
  }
}
