//
//  UserController.swift
//  TubesKelompokE
//
//  Created by Helga Eka on 22/11/18.
//  Copyright © 2018 kelompokE. All rights reserved.
//

import UIKit

class UserController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var EditProfile: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        EditProfile.layer.cornerRadius = EditProfile.frame.height/2
        // Do any additional setup after loading the view.
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
    
    @IBAction func EditProfilebtn(_ sender: Any) {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
