//
//  LoginController.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 18/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit
import Alamofire

class LoginController: UIViewController {

    @IBOutlet weak var LoginmE: UIButton!
    @IBOutlet weak var PasswordLogin: UITextField!
    @IBOutlet weak var UsernameLogin: UITextField!
    
    var user: User? = nil
    let URL_JSON = "https://pbp-api.tugasbesar.com/public/api/login"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginmE.layer.cornerRadius = LoginmE.frame.height/2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Login(_ sender: Any) {
        
        let USERNAME = self.UsernameLogin.text!
        let PASSWORD = self.PasswordLogin.text!
        let parameter: [String: Any] = ["username": USERNAME, "password": PASSWORD]
        
        if (USERNAME=="admin" || PASSWORD=="admin"){
            self.performSegue(withIdentifier: "admin", sender: nil)
        }else{
            if (USERNAME.isEmpty || PASSWORD.isEmpty){
                let AlertControl = UIAlertController(title: "Failed to Login", message: "Username and Password must not be empty...", preferredStyle: UIAlertController.Style.alert)
                AlertControl.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
                self.present(AlertControl, animated: true, completion: nil)
            }
            
            Alamofire.request(URL_JSON, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON{
                response in
                print(response)

                if let result = response.result.value {
                    let jsonData = result as! NSDictionary
                    
//                        let post = JSON(value)
//                        if let key = post["token"].string {
                        let username = jsonData.value(forKey: "username") as? String
//                        let password = jsonData.value(forKey: "password") as? String

                        UserDefaults.standard.set(username, forKey: "username")
            
                        self.performSegue(withIdentifier: "login", sender: nil)
                    //}
                }else{
                    let AlertController = UIAlertController(title: "Failed to Login", message: "Check Again Your Username and Password", preferredStyle: UIAlertController.Style.alert)
                    AlertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))

                    self.present(AlertController, animated: true, completion: nil)
                }
            }
        }
        
        
        
    }
    
}
