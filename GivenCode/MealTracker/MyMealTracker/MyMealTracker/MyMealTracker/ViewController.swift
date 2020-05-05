//
//  ViewController.swift
//  MyMealTracker
//
//  Created by Daniela da Cruz on 28/04/2020.
//  Copyright © 2020 Daniela da Cruz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var lblMealName: UILabel!
    @IBOutlet weak var txtMealName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Actions
    @IBAction func btnChangeText(_ sender: Any) {
        lblMealName.text = "Mean Name"
        txtMealName.text = ""
    }
    
    @IBAction func selectImage(_ sender: UITapGestureRecognizer) {
        // esconde o teclado
      txtMealName.resignFirstResponder()
      
      let imagePicker = UIImagePickerController()
      imagePicker.sourceType = .photoLibrary
      imagePicker.delegate = self
      present(imagePicker, animated: true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        lblMealName.text = txtMealName.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else
        {
            print("Imagem nao encontrada")
            return
        }
        
        imageView.image = image
        dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        txtMealName.delegate = self
    }


}

