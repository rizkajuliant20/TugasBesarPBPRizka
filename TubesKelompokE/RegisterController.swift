//
//  RegisterController.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 18/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit
import Alamofire
class RegisterController: UIViewController {

    @IBOutlet weak var FullName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfPass: UITextField!
    
    @IBOutlet weak var RegisterMe: UIButton!
    let URL_JSON = "https://pbp-api.tugasbesar.com/public/api/register"

    

    override func viewDidLoad() {
        super.viewDidLoad()
        RegisterMe.layer.cornerRadius = RegisterMe.frame.height/2
        // Do any additional setup after loading the view.
    }
    

    @IBAction func Register(_ sender: Any) {
        let FULLNAME = self.FullName.text!
        let EMAIL = self.Email.text!
        let PHONE = self.Phone.text!
        let USERNAME = self.Username.text!
        let PASSWORD = self.Password.text!
        let CONFPASSWORD = self.ConfPass.text!
        let parameter: [String: Any] = ["name": FULLNAME, "email": EMAIL, "username": USERNAME, "no_hp": PHONE,  "password": PASSWORD, "password_confirmation": CONFPASSWORD]
        
        if (USERNAME.isEmpty || PASSWORD.isEmpty || FULLNAME.isEmpty || EMAIL.isEmpty || PHONE.isEmpty || CONFPASSWORD.isEmpty){
            let AlertControl = UIAlertController(title: "Failed to Register", message: "Field Must Not Be Empty", preferredStyle: UIAlertController.Style.alert)
            AlertControl.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(AlertControl, animated: true, completion: nil)
        }
        
        if (PASSWORD != CONFPASSWORD){
            let AlertControl = UIAlertController(title: "Failed to Register", message: "Password and Username Must Be Match", preferredStyle: UIAlertController.Style.alert)
            AlertControl.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(AlertControl, animated: true, completion: nil)
        }
        
        Alamofire.request(URL_JSON, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
                case .success:
                    print(response)
                    
                    break
                case .failure(let error):
                    print(error)
            }
            
        }
        
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
}
