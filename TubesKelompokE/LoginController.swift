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
    let URL_JSON = "https://pbp-api.tugasbesar.com/public/api/guest"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginmE.layer.cornerRadius = LoginmE.frame.height/2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Login(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: (Any).self)
        getJson(urlString: URL_JSON + UsernameLogin.text! + PasswordLogin.text!)
        
    }
    
    fileprivate func getJson(urlString: String)
    {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!){
            (data, response, err) in
            if err != nil{
                print("error", err ?? "")
            }else{
                if let useable = data{
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: useable, options: .mutableContainers) as AnyObject
                        
                        print(jsonObject)
                        
                        if let mhs = jsonObject as? [String: AnyObject]{
                            self.user = User(json: mhs as! [String: AnyObject])
                            self.user?.printData()
                        }else{
                            print("nil")
                        }
                    }
                    catch{
                        print("error catch")
                    }
                }
            }
        }.resume()
    }
    

}
