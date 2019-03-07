//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Amanda Jackson on 3/5/19.
//  Copyright © 2019 Amanda Jackson. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var newUsernameField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var rePasswordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = newUsernameField.text
        user.password = newPasswordField.text
        
        if newPasswordField.text == rePasswordField.text{
            user.signUpInBackground { (success, error) in
                if success{
                    self.performSegue(withIdentifier: "postSignupSegue", sender: nil)
                }else{
                    print("Error: \(error?.localizedDescription)")
                }
            }
        } else{
            print ("Error signing up")
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
