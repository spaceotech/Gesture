//
//  GestureVC.swift
//  SOGesture
//
//  Created by Hitesh on 10/26/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class GestureVC: UIViewController {
    
    var iRow : Int = 0
    
    @IBOutlet weak var viewGesture: UIView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
         viewGesture.backgroundColor = UIColor.blueColor()
        
        if iRow == 0 {
            //For Tap Gesture Recoginzation
            let TapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTapGesture))
            self.viewGesture.addGestureRecognizer(TapGestureRecognizer)
        }
        
        if iRow == 1 {
            //For Swipe Gesture Recoginzation
            let directions: [UISwipeGestureRecognizerDirection] = [.Right, .Left, .Up, .Down]
            for direction in directions {
                let SwiptGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GestureVC.handleSwipeGesture(_:)))
                SwiptGestureRecognizer.direction = direction
                viewGesture.addGestureRecognizer(SwiptGestureRecognizer)
            }
        }
        
        if iRow == 2 {
            //For Pan Gesture Recoginzation
            let PanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
            viewGesture.addGestureRecognizer(PanGestureRecognizer)
        }
        
        if iRow == 3 {
            //For Pinch Gesture Recoginzation
            let PinchGestureRecognizer: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(GestureVC.handlePinchGesture(_:)))
            viewGesture.addGestureRecognizer(PinchGestureRecognizer)
        }
        
        if iRow == 4 {
            //For Rotate Gesture Recoginzation
            let RotateGestureRecognizer: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(GestureVC.handleRotateGesture(_:)))
            viewGesture.addGestureRecognizer(RotateGestureRecognizer)
        }

        // Do any additional setup after loading the view.
    }
    
    //MARK: Handle Tap Gesture
    func handleTapGesture(tapGestureRecognizer: UITapGestureRecognizer) {
        if CGColorEqualToColor(viewGesture.backgroundColor!.CGColor, UIColor.greenColor().CGColor) {
            viewGesture.backgroundColor = UIColor.blueColor()
        } else {
            viewGesture.backgroundColor = UIColor.greenColor()
        }
    }
    
    //MARK: Handle Swipe Gesture
    func handleSwipeGesture(sender: UISwipeGestureRecognizer) {
        print(sender.direction)
    }
    
    //MARK: Handle Pan Gesture
    func handlePanGesture(gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .Began || gestureRecognizer.state == .Changed {
            
            let translation = gestureRecognizer.translationInView(self.view)
            // note: 'view' is optional and need to be unwrapped
            gestureRecognizer.view!.center = CGPointMake(gestureRecognizer.view!.center.x + translation.x, gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPointMake(0,0), inView: self.view)
        }  
    }
    
    //MARK: Handle Pinch Gesture
    func handlePinchGesture(sender: UIPinchGestureRecognizer) {
        sender.view!.transform = CGAffineTransformScale(sender.view!.transform,
                                                        sender.scale, sender.scale)
        sender.scale = 1
    }
    
    //MARK: Handle Rotate Gesture
    func handleRotateGesture(sender: UIRotationGestureRecognizer) {
        sender.view!.transform = CGAffineTransformRotate(sender.view!.transform, sender.rotation)
        sender.rotation = 0
    }
    
    

    @IBAction func actionBack(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
