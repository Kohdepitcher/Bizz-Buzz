//
//  OnboardingController.swift
//  Bizz-Buzz
//
//  Created by Kohde Pitcher on 22/9/17.
//  Copyright © 2017 Kohde Pitcher. All rights reserved.
//

import UIKit

class OnboardingController: UIViewController {

    @IBOutlet weak var actionButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let startColor = UIColor(red: 33/225, green: 212/225, blue: 253/225, alpha: 1)
        let endColor = UIColor(red: 183/225, green: 33/225, blue: 255/225, alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.frame = view.frame
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        actionButton.layer.cornerRadius = 20
    }

    
    
//    func createGradientLAyer() -> CAGradientLayer{
//        let startColor = UIColor(red: 33, green: 212, blue: 253, alpha: 1)
//        let endColor = UIColor(red: 183, green: 33, blue: 255, alpha: 1)
//        let gradientLayer = CAGradientLayer()
//
//        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
//        gradientLayer.locations = [0.0,0.5]
//        gradientLayer.frame = CGRect(x: 10, y: 10, width: 20, height: 20) //self.view.bounds
//        return gradientLayer
//        //self.view.layer.addSublayer(gradientLayer)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
