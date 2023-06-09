//
//  ExplodeView.swift
//  Anagrams
//
//  Created by Caroline Begbie on 12/04/2015.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

import Foundation
import UIKit

class ExplodeView: UIView {
  //1
  private var emitter:CAEmitterLayer!
  
  required init(coder aDecoder:NSCoder) {
    fatalError("use init(frame:")
  }
  
  override init(frame:CGRect) {
    super.init(frame:frame)
    
    //initialize the emitter
    emitter = self.layer as! CAEmitterLayer
    emitter.emitterPosition = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
    emitter.emitterSize = self.bounds.size
      emitter.emitterMode = CAEmitterLayerEmitterMode.outline//kCAEmitterLayerAdditive
      emitter.emitterShape = CAEmitterLayerEmitterShape.rectangle
  }
    override class var layerClass: AnyClass {
    return CAEmitterLayer.self
  }
  
  override func didMoveToSuperview() {
    //1
    super.didMoveToSuperview()
    if self.superview == nil {
      return
    }
    
    //2
    let texture:UIImage? = UIImage(named:"particle")
    assert(texture != nil, "particle image not found")
    
    //3
    let emitterCell = CAEmitterCell()
    
    //4
      emitterCell.contents = texture!.cgImage
    
    //5
    emitterCell.name = "cell"
    
    //6
    emitterCell.birthRate = 1000
    emitterCell.lifetime = 0.75
    
    //7
    emitterCell.blueRange = 0.33
    emitterCell.blueSpeed = -0.33
    
    //8
    emitterCell.velocity = 160
    emitterCell.velocityRange = 40
    
    //9
    emitterCell.scaleRange = 0.5
    emitterCell.scaleSpeed = -0.2
    
    //10
    emitterCell.emissionRange = CGFloat(Double.pi*2)
    
    //11
    emitter.emitterCells = [emitterCell]
    
    //disable the emitter
      
    
      var dispatchAfter = DispatchTimeInterval.seconds(Int(0.1))

      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dispatchAfter, execute: {
          // Do your thing
          self.disableEmitterCell()

      })
      var dispatchAfter1 = DispatchTimeInterval.seconds(Int(2.1))
    //remove explosion view
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + dispatchAfter1, execute: {
          // Do your thing
          self.removeFromSuperview()

      })

  }
  
  func disableEmitterCell() {
    emitter.setValue(0, forKeyPath: "emitterCells.cell.birthRate")
  }
  
}
