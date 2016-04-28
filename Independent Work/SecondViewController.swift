//
//  SecondViewController.swift
//  Independent Work
//
//  Created by Danielle Pintz on 4/3/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var newword = ""

    @IBOutlet var word: UITextField!
    @IBAction func addWord(sender: AnyObject) {
        if !(word.text == "") {
        newword = word.text!
        wordList.append(newword)
        word.text = ""
        translation.text = ""
        NSUserDefaults.standardUserDefaults().setObject(wordList, forKey: "words")
        }
    }
    
    @IBOutlet var translation: UITextField!
    @IBAction func translate(sender: AnyObject) {
        newword = word.text!
        let translate = TranslateQuery(sourceString: newword, optional: "en", optional: language, withKey: "AIzaSyDRPlrmf7lrGkN5_U0RPgF8zG-YF9-CZMc")
        translate.translate()
        translation.text = translate.queryResult
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

