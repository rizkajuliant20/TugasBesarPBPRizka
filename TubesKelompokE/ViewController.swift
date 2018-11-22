//
//  ViewController.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 18/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Loginbtn: UIButton!
    @IBOutlet weak var Registerbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Loginbtn.layer.cornerRadius = Loginbtn.frame.height/2
        
        Registerbtn.layer.cornerRadius = Registerbtn.frame.height/2
    }
    
    @IBAction func BtnLogin(_ sender: Any) {
        performSegue(withIdentifier: "btnLogin", sender: (Any).self)
    }
    @IBAction func BtnRegister(_ sender: Any) {
        performSegue(withIdentifier: "btnRegister", sender: (Any).self)
    }


}

