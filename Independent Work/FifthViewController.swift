//
//  FifthViewController.swift
//  Independent Work
//
//  Created by Danielle Pintz on 4/18/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//


import UIKit
var language = "es"

class FifthViewController: UIViewController {
    
    @IBOutlet var spanish: UIButton!
    @IBOutlet var french: UIButton!
    @IBOutlet var german: UIButton!
    @IBOutlet var italian: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("lang") == nil {
            language = "es"

        }
        else {
            language = NSUserDefaults.standardUserDefaults().objectForKey("lang") as! String
        }
        
        if language == "es" {
            spanish.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            french.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            german.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            italian.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        }
        if language == "fr" {
            spanish.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            french.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            german.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            italian.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        }
        if language == "de" {
            spanish.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            french.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            german.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
            italian.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)          }
        if language == "it" {
            spanish.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            french.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            german.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            italian.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)        }
        // Do any additional setup after loading the view, typically from a nib.
           }
    
    @IBAction func spanish(sender: AnyObject) {
        language = "es"
        spanish.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        french.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        german.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        italian.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        NSUserDefaults.standardUserDefaults().setObject(language, forKey: "lang")
    }
    
    
    @IBAction func french(sender: AnyObject) {
        language = "fr"
        NSUserDefaults.standardUserDefaults().setObject(language, forKey: "lang")
        spanish.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        french.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        german.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        italian.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
    }

    @IBAction func german(sender: AnyObject) {
        language = "de"
        NSUserDefaults.standardUserDefaults().setObject(language, forKey: "lang")
        spanish.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        french.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        german.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        italian.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)    }
  
    @IBAction func italian(sender: AnyObject) {
        language = "it"
        NSUserDefaults.standardUserDefaults().setObject(language, forKey: "lang")
        spanish.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        french.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        german.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        italian.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

