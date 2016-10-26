//
//  ViewController.swift
//  SOGesture
//
//  Created by Hitesh on 10/26/16.
//  Copyright © 2016 myCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblGestures: UITableView!
    
    let arrGesture : NSMutableArray = ["Tap Gesture", "Swipe Gesture", "Pan Gesture", "Pinch Gesture", "Rotation Gesture"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: UITableViewDelegate
    

    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    
    //MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrGesture.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        configureCell(cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, forRowAtIndexPath: NSIndexPath) {
        cell.textLabel?.text = arrGesture.objectAtIndex(forRowAtIndexPath.row) as? String
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let objGesture : GestureVC = self.storyboard?.instantiateViewControllerWithIdentifier("GestureVCID") as! GestureVC
        objGesture.iRow = indexPath.row
        self.navigationController?.pushViewController(objGesture, animated: true)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

