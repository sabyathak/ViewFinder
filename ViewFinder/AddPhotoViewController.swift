//
//  AddPhotoViewController.swift
//  ViewFinder
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 sabyatha. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
  
    var imagePicker = UIImagePickerController()
    //an object created where we can acess to sroe our photos/take photos wiwhtin the class Image Picker Controller

    
    @IBOutlet weak var newImageView: UIImageView!
    
    @IBOutlet weak var captionText: UITextField!
    
    //
//    @IBOutlet weak var newImageView: UIImageView!
//
//    @IBOutlet weak var captionText: UITextField!
//
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    

 
    @IBAction func selfieTapped(_ sender: Any) {
        imagePicker.sourceType = .camera
        //this allows me to open my camera
        
        present(imagePicker, animated: true, completion: nil)
        //animated allows for a smooth transition if we it  to ture
        //completion means that we exit our after we choose our photos
    }
    
    @IBAction func libraryTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
   
    }
    
    
   
    @IBAction func savePhotoTapped(_ sender: UIButton) {
       
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
          
            photoToSave.caption = captionText.text
           
            if let userImage = newImageView.image {
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
                }
            }
            
        }
          
        }
    

    
    
    }


