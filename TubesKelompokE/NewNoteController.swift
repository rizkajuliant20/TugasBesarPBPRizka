//
//  NewNoteController.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 25/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit
import Alamofire

class NewNoteController: UIViewController {

    @IBOutlet weak var JudulBaru: UITextField!
    @IBOutlet weak var IsiBaru: UITextView!
    
    let URL_JSON = "https://pbp-api.tugasbesar.com/public/api/notes"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SimpanNoteBaru(_ sender: Any) {
        let JUDUL = self.JudulBaru.text!
        let ISI = self.IsiBaru.text!
        let parameter : [String: Any] = ["notes_title": JUDUL, "notes_content": ISI, "user_id": 0]
        
        if (JUDUL.isEmpty || ISI.isEmpty){
            let AlertControl = UIAlertController(title: "Failed to Save Data", message: "Field Must Not Be Empty", preferredStyle: UIAlertController.Style.alert)
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
