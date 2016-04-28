//
//  FourthViewController.swift
//  Independent Work
//
//  Created by Danielle Pintz on 4/7/16.
//  Copyright © 2016 Danielle Pintz. All rights reserved.
//

import UIKit
import WebKit

var genWords = [String: Int]()
var bestWords = [String] ()
var highfreq = 0
var badWords = [String] ()
var newword = ""

class FourthViewController: UIViewController, WKNavigationDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        badWords = []
        NSUserDefaults.standardUserDefaults().setObject(badWords, forKey: "badarr")
            }
    
    override func viewWillAppear(animated: Bool) {
        
        refresh()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func refresh() {
        highfreq = 0
        genWords = [String: Int]()
        bestWords = [String] ()
        for index in 0...wordList.count-1 {
            let word = wordList[index]
            let url = NSURL(string: "http://wordassociation.org/words/" + word)
            let webView2 = WKWebView(frame: self.view.bounds)
            webView2.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
            webView2.navigationDelegate = self
            self.view.addSubview(webView2)
            webView2.loadRequest(NSURLRequest(URL: url!))
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("badarr") != nil {
            badWords = NSUserDefaults.standardUserDefaults().objectForKey("badarr") as! [String]
        }
        for index in 0...wordList.count-1 {
            let word = wordList[index]
            if !(badWords.contains(word)) {
                badWords.append(word)
            }
        }
    }
    @IBOutlet var wordfield: UITextField!
    @IBAction func generate(sender: AnyObject) {
        let size = bestWords.count
        let random = Int(arc4random_uniform(UInt32(size)))
        print(badWords)
        newword = bestWords[random]
        refresh()
        wordfield.text = newword
    }
    
    @IBAction func add(sender: AnyObject) {
        if !(newword == "") {
            wordList.append(newword)
            badWords.append(newword)
            wordfield.text = ""
            translation.text = ""
            NSUserDefaults.standardUserDefaults().setObject(badWords, forKey: "badarr")
            NSUserDefaults.standardUserDefaults().setObject(wordList, forKey: "arr")
            refresh()
        }
    }
    @IBOutlet var translation: UITextField!
    
    @IBAction func getranslation(sender: AnyObject) {
        wordfield.text = newword
        let translate = TranslateQuery(sourceString: newword, optional: "en", optional: language, withKey: "AIzaSyDRPlrmf7lrGkN5_U0RPgF8zG-YF9-CZMc")
        translate.translate()
        translation.text = translate.queryResult
    }
    
    @IBAction func skip(sender: AnyObject) {
        wordfield.text = ""
        translation.text = ""
        badWords.append(newword)
        NSUserDefaults.standardUserDefaults().setObject(badWords, forKey: "badarr")
        refresh()
    }
    
func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        webView.evaluateJavaScript("document.body.innerHTML") { (result, error) in
            let page = result as! String
            let lines = page.characters.split("\n").map { String($0) }
            var i = 0
            while (true) {
                if lines[i] == "<tbody><tr>" {
                    break
                }
                else {i = i+1}
            }
            i = i+3
            for index in i...i+4 {
                let line = lines[index]
                var splitarray = line.componentsSeparatedByString(";")
                let subs = splitarray[1]
                let ind = subs.characters.indexOf("&")
                let word = subs.substringWithRange(Range<String.Index>(start: subs.startIndex, end: ind!))
                if !(badWords.contains(word)) {
                    let value = genWords[word]
                    var wordfreq = 0
                    if value == nil {
                         wordfreq = 1
                    }
                    else {
                        wordfreq = value!+1
                    }
                        genWords.updateValue(wordfreq, forKey: word)
                        if wordfreq > highfreq {
                            highfreq = wordfreq
                            bestWords = [String] ()
                            bestWords.append(word)
                        }
                        if wordfreq == highfreq {
                            let inlist =  bestWords.contains(word)
                            if !inlist {
                               bestWords.append(word)
                            }
                        }
                }
                
            }
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}

