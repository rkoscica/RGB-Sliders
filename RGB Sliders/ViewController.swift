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
     
     @IBOutlet weak var openButton: UIButton!
     @IBOutlet weak var saveButton: UIBarButtonItem!
     @IBOutlet weak var loadButton: UIBarButtonItem!

     @IBOutlet weak var colorSquare: UIView!
     @IBOutlet weak var history: UIView!

     var hisVal = [0.0, 0.0, 0.0]
     override func viewDidLoad() {
          super.viewDidLoad()
          colorSquare.layer.borderColor = UIColor.blackColor().CGColor
          colorSquare.layer.borderWidth = 1
          history.layer.borderColor = UIColor.blackColor().CGColor
          history.layer.borderWidth = 1
          let defaults = NSUserDefaults.standardUserDefaults()
          redSlider.value = defaults.floatForKey("red")
          greenSlider.value = defaults.floatForKey("green")
          blueSlider.value = defaults.floatForKey("blue")
          updateSquare()
     }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("Memory Warning")
     }
     
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
          if (segue.identifier == "openColor") {
               let newViewController = segue.destinationViewController
               newViewController.view.backgroundColor = colorSquare.backgroundColor
          }
     }

     @IBAction func updateSquare() {
        colorSquare.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
          let defaults = NSUserDefaults.standardUserDefaults()
          defaults.setFloat(redSlider.value, forKey: "red")
          defaults.setFloat(greenSlider.value, forKey: "green")
          defaults.setFloat(blueSlider.value, forKey: "blue")
          defaults.synchronize()
    }
     @IBAction func updateHistory() {
          saveButton.title = "Saved!"
          loadButton.title = "Load"
          hisVal[0] = Double(redSlider.value)
          hisVal[1] = Double(greenSlider.value)
          hisVal[2] = Double(blueSlider.value)
          history.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
          
     }
     @IBAction func loadHistory() {
          loadButton.title = "Loaded!"
          saveButton.title = "Save"
          redSlider.value = Float(hisVal[0])
          greenSlider.value = Float(hisVal[1])
          blueSlider.value = Float(hisVal[2])
          updateSquare()
     }

}

// comment