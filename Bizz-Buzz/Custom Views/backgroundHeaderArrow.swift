//
//  backgroundHeaderArrow.swift
//  Bizz-Buzz
//
//  Created by Kohde Pitcher on 1/4/18.
//  Copyright © 2018 Kohde Pitcher. All rights reserved.
//

import UIKit

class backgroundHeaderArrow: UIView {
    var colorForArrow = UIColor()
    var colorForViewBack = UIColor.white

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = colorForViewBack
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = colorForViewBack
        colorForArrow = UIColor()
    }
    
    override func draw(_ rect: CGRect) {
        let size = self.bounds.size //size of bounds of view
        let viewHeight = bounds.height //height of view
        
        //calculate points for shape
        let pnt1 = self.bounds.origin
        let pnt2 = CGPoint(x: size.width/2 - 15, y: pnt1.y)
        let pnt3 = CGPoint(x: size.width/2 + 15, y: viewHeight/2)
        let pnt4 = CGPoint(x: size.width/2 - 15, y: viewHeight)
        let pnt5 = CGPoint(x: pnt1.x, y: viewHeight)
        
        //create the path
        let path = UIBezierPath()
        path.move(to: pnt1)
        path.addLine(to: pnt2)
        path.addLine(to: pnt3)
        path.addLine(to: pnt4)
        path.addLine(to: pnt5)
        path.close()
        
        //fill path
        colorForArrow.set()
        path.fill()
        
    }
    
}
