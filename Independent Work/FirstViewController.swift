//
//  FirstViewController.swift
//  Independent Work
//
//  Created by Danielle Pintz on 4/3/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved. GOOD VERSION
//

import UIKit

var wordList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var table: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    
     return wordList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let word = wordList[indexPath.row]
        cell.textLabel?.text = word + "  :  " + translate(word)
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        print(wordList)
        table.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        NSUserDefaults.standardUserDefaults().setObject(wordList, forKey: "words")
        
        // Do any additional setup after loading the view, typically from a nib.
        if NSUserDefaults.standardUserDefaults().objectForKey("words") != nil
        {
            wordList = NSUserDefaults.standardUserDefaults().objectForKey("words") as! [String]
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("lang") == nil {
            language = "es"
            
        }
        else {
            language = NSUserDefaults.standardUserDefaults().objectForKey("lang") as! String
        }

    }
    
    func translate(word: String) -> String {
    let translate = TranslateQuery(sourceString: word, optional: "en", optional: language, withKey: "AIzaSyDRPlrmf7lrGkN5_U0RPgF8zG-YF9-CZMc")
    translate.translate()
    return translate.queryResult
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            wordList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(wordList, forKey: "words")
            table.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

