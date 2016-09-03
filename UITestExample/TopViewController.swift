//
//  TopViewController.swift
//  UITestExample
//
//  Created by tamaki on 8/27/16.
//  Copyright © 2016 tamaki. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nextButton.hidden = true

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        if let status = appDelegate.appStatus {
            switch status {
            case .LOGIN:
                self.nextButton.hidden = false
                break
            case .LOGOUT:
                performSegueWithIdentifier("LoginSegue", sender: self )
            case .SUSPEND:
                performSegueWithIdentifier("SuspendSegue", sender: self )
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        debugPrint(#function)
    }
    
    @IBAction func returnActionForSegue(segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else { return }
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        switch identifier {
        case "ExitLogin":
            appDelegate.appStatus = .SUSPEND
        case "ExitAnnouncement":
            appDelegate.appStatus = .LOGIN
        default:
            break
        }
    }
}
