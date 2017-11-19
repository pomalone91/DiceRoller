//
//  HorizontalSegue.swift
//  DiceRoller
//
//  Created by Paul Malone on 9/17/17.
//  Copyright © 2017 stroggi. All rights reserved.
//

import UIKit

class HorizontalSegue: UIStoryboardSegue {
    override func perform() {
        
        //credits to http://www.appcoda.com/custom-segue-animations/
        
        let firstClassView = self.source.view
        let secondClassView = self.destination.view
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        secondClassView?.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        if let window = UIApplication.shared.keyWindow {
            
            window.insertSubview(secondClassView!, aboveSubview: firstClassView!)
            
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                
                firstClassView?.frame = (firstClassView?.frame.offsetBy(dx: -screenWidth, dy: 0))!
                secondClassView?.frame = (secondClassView?.frame.offsetBy(dx: -screenWidth, dy: 0))!
                
            }, completion: {(Finished) -> Void in
                
                self.source.navigationController?.pushViewController(self.destination, animated: false)
                
            }) 
            
        }
        
    }

}
