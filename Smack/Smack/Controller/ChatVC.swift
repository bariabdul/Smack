//
//  ChatVC.swift
//  Smack
//
//  Created by Bari Abdul on 1/21/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)

        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        // Do any additional setup after loading the view.
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
        
        MessageService.instance.findAllChannel { (success) in
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
