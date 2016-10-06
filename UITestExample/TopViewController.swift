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
        self.nextButton.isHidden = true

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let status = appDelegate.appStatus {
            switch status {
            case .LOGIN:
                self.nextButton.isHidden = false
                break
            case .LOGOUT:
                performSegue(withIdentifier: "LoginSegue", sender: self )
            case .SUSPEND:
                performSegue(withIdentifier: "SuspendSegue", sender: self )
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        debugPrint(#function)
    }
    
    @IBAction func returnActionForSegue(_ segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else { return }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
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
