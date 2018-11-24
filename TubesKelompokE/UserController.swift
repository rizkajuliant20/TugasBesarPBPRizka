//
//  UserController.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 22/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit
import Alamofire
class UserController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//UNTUK DI UI PROFIL USER
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var EditProfile: UIButton!
    
    
//ATRIBUT DI UI EDIT PROFIL USER
    @IBOutlet weak var fullnameEditor: UITextField!
    @IBOutlet weak var passwordEditor: UITextField!
    @IBOutlet weak var phoneEditor: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func ediProfileAction(_ sender: Any) {
        performSegue(withIdentifier: "editProfile", sender: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImage.image = image
        }else if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            userImage.contentMode = .scaleToFill
            userImage.image = pickedImage
        }else{
            print("Error...")
        }
        
        self.dismiss(animated: false, completion: nil)
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func EditPicturebtn(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: "Load Your Picture", preferredStyle: .actionSheet)
        
        let takePhoto = UIAlertAction(title: "From Camera", style: .default) { (action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let choosePhoto = UIAlertAction(title: "From Gallery", style: .default) {(action: UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                
                imagePicker.allowsEditing = false
                
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePicker, animated: false, completion: nil)
            }else{
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                
                imagePicker.allowsEditing = false
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePicker, animated: false, completion: nil)
            }
        }
        
        let exitAlert = UIAlertAction(title: "Exit", style: .cancel)
        
        alertController.addAction(takePhoto)
        alertController.addAction(choosePhoto)
        alertController.addAction(exitAlert)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
}
