//
//  ViewController.swift
//  DispatchQueue
//
//  Created by Roland Thomas on 10/4/16.
//  Copyright © 2016 Jedisware, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var theTitle = String()
    var message = String()
   


    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func Tap(_ sender: AnyObject) {
        
        let thisEmail = "eMailaddres.com"
        let thisPassword = "myPassword"
        
        
        
        DispatchQueue.global(qos: .background).async {
            
            //Validate user input
            
            let result = self.validate(thisEmail, password: thisPassword)
            
            // Go back to the main thread to update the UI
            DispatchQueue.main.async {
                if !result
                {
                    self.displayFailureAlert()
                }
                
            }
        }

    }
    
    
    func validate (_ userEmail: String, password: String) -> Bool
    {
        
        //Validate User Input
        var isSuccessful: Bool = false
        
        //Validation Code
        isSuccessful = true
        
        if isSuccessful
        {
            //Make Call to Web Api Method
            let result = true
            return result
            
        }
        else
        {
            let result = false
            return result
        }
        
    }

    func displayFailureAlert()
    {
        let alertController = UIAlertController(title: "Heading of Message", message:
            "Message Body", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    



}

