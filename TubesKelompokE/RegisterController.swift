//
//  RegisterController.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 18/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var FullName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var ConfPass: UITextField!
    
    @IBOutlet weak var RegisterMe: UIButton!
    let URL_JSON = "httpS://pbp-api.tugasbesar.com/public/api/guest"

    

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
        
        postMahasiswa(
            fullname: FULLNAME,
            email: EMAIL,
            phone: PHONE,
            username: USERNAME,
            password: PASSWORD
        )
        
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    fileprivate func postMahasiswa(fullname: String, email: String, phone: String, username: String, password: String){
        let parameters: [String: Any] = ["name": fullname, "email": email, "username": username, "no_hp": phone,  "password": password, "check": 1]
        
        guard let url = URL(string: URL_JSON) else{ return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request){ (data, response, err) in
            if let response = response{
                print(response)
            }
            if let data = data{
                do{
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                }
                catch{
                    print (error)
                }
            }
        }.resume()
    }
    
}
