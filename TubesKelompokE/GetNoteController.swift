//
//  GetNoteController.swift
//  TubesKelompokE
//
//  Created by Daud Joan Do Cristoregi Jemadut on 27/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit

class GetNoteController: UITableViewController {
    
    let URL_JSON = "https://pbp-api.tugasbesar.com/public/api/notes"
    var notes = [Note]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJson(urlString: URL_JSON)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        
        cell.textLabel?.text = notes[indexPath.row].notes_title
        return cell
    }
    
    fileprivate func getJson(urlString: String) {
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {
            (data, response, err) in
            if err != nil {
                print("error", err ?? "")
            }
            else {
                if let useable = data {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: useable, options: .mutableContainers) as AnyObject
                        print(jsonObject)
                        
                        let notes = jsonObject as? [AnyObject]
                        for note in notes! {
                            let n = Note(json: note as! [String: Any])
                            self.notes.append(n)
                        }
                        
                        DispatchQueue.main.async(execute: {
                            self.tableView.reloadData()
                            
                        })
                    }
                    catch {
                        print("error catch")
                    }
                }
            }
        }.resume()
    }
}
