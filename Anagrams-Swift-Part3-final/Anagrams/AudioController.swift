//
//  AudioController.swift
//  Anagrams
//
//  Created by Caroline Begbie on 12/04/2015.
//  Copyright (c) 2015 Caroline. All rights reserved.
//

import Foundation
import AVFoundation

class AudioController {
  private var audio = [String:AVAudioPlayer]()
  
  func preloadAudioEffects(effectFileNames:[String]) {
    for effect in AudioEffectFiles {
      //1 get the file path URL
        let soundPath = (Bundle.main.resourcePath! as NSString).appendingPathComponent(effect)
        let soundURL = NSURL.fileURL(withPath: soundPath)
      
      //2 load the file contents
      var loadError:NSError?
        do{
            let player = try AVAudioPlayer(contentsOf: soundURL)
            assert(loadError == nil, "Load sound failed")
            
            //3 prepare the play
            player.numberOfLoops = 0
            player.prepareToPlay()
            
            //4 add to the audio dictionary
            audio[effect] = player
        } catch let error {
            print(error)
        }
    }
  }
  
  func playEffect(name:String) {
    if let player = audio[name] {
        if player.isPlaying {
        player.currentTime = 0
      } else {
        player.play()
      }
    }
  }
  
}

