//
//  ViewController.swift
//  Anagrams
//
//  Created by Caroline on 1/08/2014.
//  Copyright (c) 2014 Caroline. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let controller:GameController
    required init?(coder: NSCoder) {
        controller = GameController()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //add one layer for all game elements
        let gameView = UIView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        self.view.addSubview(gameView)
        controller.gameView = gameView
        
        //add one view for all hud and controls
        let hudView = HUDView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        self.view.addSubview(hudView)
        controller.hud = hudView
        
        controller.onAnagramSolved = self.showLevelMenu
    }
    
    //show the game menu on app start
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.showLevelMenu()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showLevelMenu() {
        //1 show the level selector menu
        let alertController = UIAlertController(title: "Choose Difficulty Level",
                                                message: nil,
                                                preferredStyle:UIAlertController.Style.alert)
        
        //2 set up the menu actions
        let easy = UIAlertAction(title: "Easy-peasy", style:.default,
                                 handler: {(alert:UIAlertAction!) in
            self.showLevel(levelNumber: 1)
        })
        let hard = UIAlertAction(title: "Challenge accepted", style:.default,
                                 handler: {(alert:UIAlertAction!) in
            self.showLevel(levelNumber:2)
        })
        let hardest = UIAlertAction(title: "I'm totally hard-core", style: .default,
                                    handler: {(alert:UIAlertAction!) in
            self.showLevel(levelNumber:3)
        })
        
        //3 add the menu actions to the menu
        alertController.addAction(easy)
        alertController.addAction(hard)
        alertController.addAction(hardest)
        
        //4 show the UIAlertController
        self.present(alertController, animated: true, completion: nil)
    }
    
    //5 show the appropriate level selected by the player
    func showLevel(levelNumber:Int) {
        controller.level = Level(levelNumber: levelNumber)
        controller.dealRandomAnagram()
    }
    
}

