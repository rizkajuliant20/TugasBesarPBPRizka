//
//  MasterViewController.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 19/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit
import Alamofire
class MasterViewController: UITableViewController, UISearchBarDelegate{
    @IBOutlet weak var Judul: UILabel!
    @IBOutlet weak var Isi: UITextView!
    @IBOutlet weak var UpdateNote: UIButton!
    
    let URL_JSON = "https://pbp-api.tugasbesar.com/public/api/note"
    
    var titleArray = [AnyObject]()
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    

}
