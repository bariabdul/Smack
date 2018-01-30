//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Bari Abdul on 1/22/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailText.text , emailText.text != "" else {
            return
        }
        guard let password = passwordText.text , passwordText.text != "" else {
            return
        }
        guard let name = usernameText.text , usernameText.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
                
            }
        }
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
    }
    
    @IBAction func pickBGColorPressed(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
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
