//
//  Note.swift
//  TubesKelompokE
//
//  Created by Daud Joan Do Cristoregi Jemadut on 27/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit

class Note: NSObject {
    
    var notes_title: String!
    var notes_content: String!
    
    init(json: [String: Any]) {
        self.notes_title = json["notes_title"] as? String ?? ""
        self.notes_content = json["notes_content"] as? String ?? ""
    }
    
    func printData(){
        print(
            " notes_title: ", self.notes_title,
            " notes_content: ", self.notes_content
        )
    }
    
}
