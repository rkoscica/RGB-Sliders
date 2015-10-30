//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Rosalyn Koscica on 10/26/15.
//  Copyright © 2015 Rosalyn Koscica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     @IBOutlet weak var redSlider: UISlider!
     @IBOutlet weak var greenSlider: UISlider!
     @IBOutlet weak var blueSlider: UISlider!

     @IBOutlet weak var colorSquare: UIView!
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        
        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1
        updateSquare()
     }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("Memory Warning")
     }

     @IBAction func updateSquare() {
        colorSquare.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    

}

// comment