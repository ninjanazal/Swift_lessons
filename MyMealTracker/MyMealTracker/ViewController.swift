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
    var meal: Meal?
    
    @IBOutlet weak var lblMealName: UILabel!
    @IBOutlet weak var txtMealName: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem,
         button === saveButton else
        {
            print("save button not pressed")
            return
        }
        
        let name = txtMealName.text ?? ""
        // let name = txtMealName.text == nil ? "" : txtMealName.text
        let image = imageView.image
        let rating = ratingControl.rating
        meal = Meal(name: name, photo: image, rating: rating)
    }
    
    // MARK: Actions
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let presentingMode = presentingViewController is UINavigationController
        if presentingMode{
            dismiss(animated: true, completion: nil)
        }
        else if let onwindNavigationController = navigationController {
            onwindNavigationController.popViewController(animated: true)
        }
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
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateStateSaveButton()
        navigationItem.title = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.originalImage] as? UIImage else {
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
        
        if let meal = meal {
            navigationItem.title = meal.name
            txtMealName.text = meal.name
            imageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        updateStateSaveButton()
    }

    private func updateStateSaveButton(){
        let text = txtMealName.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

