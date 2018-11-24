//
//  AdminController.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 22/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit

class AdminController: UIViewController {

    
    @IBOutlet weak var ShowSpesific: UIButton!
    @IBOutlet weak var Show: UIButton!
    @IBOutlet weak var ExitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ShowSpesific.layer.cornerRadius = ShowSpesific.frame.height/2
        
        Show.layer.cornerRadius = Show.frame.height/2
        
        ExitButton.layer.cornerRadius = ExitButton.frame.height/2
        // Do any additional setup after loading the view.
    }
    

    @IBAction func ShowAction(_ sender: Any) {
        performSegue(withIdentifier: "showData", sender: nil)
    }
    
    
    @IBAction func ShowAllAction(_ sender: Any) {
        performSegue(withIdentifier: "showAll", sender: nil)
    }
  
    
    @IBAction func ExitAction(_ sender: Any) {
        self.performSegue(withIdentifier: "BackToHome", sender: nil)
    }
    
}
