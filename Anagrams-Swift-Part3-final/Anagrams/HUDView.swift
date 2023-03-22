

import UIKit

class HUDView: UIView {
  
  var stopwatch: StopwatchView
  var gamePoints: CounterLabelView
  
  var hintButton: UIButton!
  
  //this should never be called
  required init(coder aDecoder:NSCoder) {
    fatalError("use init(frame:")
  }
  
  override init(frame:CGRect) {
    self.stopwatch = StopwatchView(frame:CGRectMake(ScreenWidth/2-150, 0, 300, 100))
      self.stopwatch.setSeconds(seconds: 0)
    
    //the dynamic points label
    self.gamePoints = CounterLabelView(font: FontHUD, frame: CGRectMake(ScreenWidth-200, 30, 200, 70))
    gamePoints.textColor = UIColor(red: 0.38, green: 0.098, blue: 0.035, alpha: 1)
    gamePoints.value = 0
    
    super.init(frame:frame)
    
    self.addSubview(gamePoints)
    
    //"points" label
    var pointsLabel = UILabel(frame: CGRectMake(ScreenWidth-340, 30, 140, 70))
    pointsLabel.backgroundColor = UIColor.clear
    pointsLabel.font = FontHUD
    pointsLabel.text = " Points:"
    self.addSubview(pointsLabel)
    
    self.addSubview(self.stopwatch)
    
      self.isUserInteractionEnabled = true
    
    //load the button image
    let hintButtonImage = UIImage(named: "btn")!
    
    //the help button
      self.hintButton = UIButton(type: .custom) as! UIButton
      hintButton.setTitle("Hint!", for:.normal)
    hintButton.titleLabel?.font = FontHUD
      hintButton.setBackgroundImage(hintButtonImage, for: .normal)
    hintButton.frame = CGRectMake(50, 30, hintButtonImage.size.width, hintButtonImage.size.height)
    hintButton.alpha = 0.8
    self.addSubview(hintButton)
  }
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
    //1 let touches through and only catch the ones on buttons
        let hitView = super.hitTest(point, with: event)
    
    //2
    if hitView is UIButton {
      return hitView
    }
    
    //3
    return nil
  }
  
}
