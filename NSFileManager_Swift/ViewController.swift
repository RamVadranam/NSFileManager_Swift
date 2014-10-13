//
//  ViewController.swift
//  NSFileManager_Swift
//
//  Created by Rama Chandra on 13/10/2014.
//  Copyright (c) 2014 Rama Chandra. All rights reserved.
//

import UIKit

let theDocumentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
let theFileName = "/userInfo.txt"
let thePathToTheFile = theDocumentDirectory.stringByAppendingString(theFileName)


class ViewController: UIViewController {

    @IBOutlet weak var theAgeTextField      : UITextField!
    @IBOutlet weak var theLocationTextField : UITextField!
    @IBOutlet weak var theNameTextField     : UITextField!
    
    @IBOutlet weak var theInfoLabel: UILabel!
    @IBAction func SaveData(sender: AnyObject) {
        
        var theName=self.theNameTextField.text
        var theLocation=self.theLocationTextField.text
        var theAge=self.theAgeTextField.text
        
        var theUserInfoString="The user info:\(theName),\(theLocation),\(theAge)"
        
        let theFileManger=NSFileManager.defaultManager()
        
        if(!theFileManger.fileExistsAtPath(thePathToTheFile))
        {
            var error:NSError?
            
            let theFileWritten=theUserInfoString.writeToFile(thePathToTheFile, atomically: true, encoding: NSUTF8StringEncoding, error: &error)
            
            if error==nil
            {
                println("Success")
            }else
            {
                println("Failed with  error:\(error)")
            }
        }
        else
        {
            println("File already exist")
        }
        
        theNameTextField.resignFirstResponder()
        theLocationTextField.resignFirstResponder()
        theAgeTextField.resignFirstResponder()
    }
    
    @IBAction func LoadData(sender: AnyObject) {
        
        let userInfo=String.stringWithContentsOfFile(thePathToTheFile, encoding:NSUTF8StringEncoding, error: nil)
        theInfoLabel.text=userInfo
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
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

