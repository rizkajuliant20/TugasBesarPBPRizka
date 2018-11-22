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
    @IBOutlet weak var Edit: UIButton!
    @IBOutlet weak var Show: UIButton!
    @IBOutlet weak var ExitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ShowSpesific.layer.cornerRadius = ShowSpesific.frame.height/2
        
        Edit.layer.cornerRadius = Edit.frame.height/2
        
        Show.layer.cornerRadius = Show.frame.height/2
        
        ExitButton.layer.cornerRadius = ExitButton.frame.height/2
        // Do any additional setup after loading the view.
    }
    

    @IBAction func ShowAction(_ sender: Any) {
    }
    
    @IBAction func EditAction(_ sender: Any) {
    }
    
    @IBAction func ShowAllAction(_ sender: Any) {
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
