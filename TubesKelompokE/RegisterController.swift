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
    let URL_JSON = "https://pbp-api.tugasbesar.com/public/api/guest"

    

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
        let parameter: [String: Any] = ["name": FULLNAME, "email": EMAIL, "username": USERNAME, "no_hp": PHONE,  "password": PASSWORD, "check": 0]
        
        if (USERNAME.isEmpty || PASSWORD.isEmpty || FULLNAME.isEmpty || EMAIL.isEmpty || PHONE.isEmpty || CONFPASSWORD.isEmpty){
            let AlertControl = UIAlertController(title: "Failed to Login", message: "Field Must Not Be Empty", preferredStyle: UIAlertController.Style.alert)
            AlertControl.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(AlertControl, animated: true, completion: nil)
        }
        
        if (PASSWORD != CONFPASSWORD){
            let AlertControl = UIAlertController(title: "Failed to Login", message: "Password and Username Must Be Match", preferredStyle: UIAlertController.Style.alert)
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
    
    
    
    
    
    
    
    
//    fileprivate func postMahasiswa(fullname: String, email: String, phone: String, username: String, password: String){
//        let parameters: [String: Any] = ["name": fullname, "email": email, "username": username, "no_hp": phone,  "password": password, "check": 1]
//
//        guard let url = URL(string: URL_JSON) else{ return }
//
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
//        request.httpBody = httpBody
//
//        let session = URLSession.shared
//        session.dataTask(with: request){ (data, response, err) in
//            if let response = response{
//                print(response)
//            }
//            if let data = data{
//                do{
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                }
//                catch{
//                    print (error)
//                }
//            }
//        }.resume()
//    }
    
}
