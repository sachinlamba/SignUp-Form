//
//  ViewController.swift
//  UserSignUp
//
//  Created by Sachin Lamba on 26/07/16.
//  Copyright © 2016 LambaG. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var pickedimage: UIImageView!
    let pickImage = UIImagePickerController()

    @IBAction func ImagePickButton(sender: AnyObject) {
        presentViewController(pickImage, animated: true, completion: nil)
    }
    
    @IBAction func signUpTapped(sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyBoard.instantiateViewControllerWithIdentifier("signInfo") as! signInfo
       // newVC.selectedColorFromPreviousScreen = colors[selectedRow]
        newVC.signUsername = userName.text!
        newVC.signPhoneNumber = phoneNumber.text
        newVC.signEmailId = emailID.text
        newVC.signPassword = password.text
        newVC.signPic = pickedimage.image
        presentViewController(newVC, animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userName.delegate = self
        phoneNumber.delegate = self
        emailID.delegate = self
        password.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyboardReturn)))
        
        pickImage.delegate = self
        
        
    }
    
    func imagePickerController(imager: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {

        let newImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        pickedimage.image = newImage
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    func keyboardReturn() {
        //textField.resignFirstResponder()
        
    }

}


extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        if textField.text?.characters.count == 10 {
//            textField.resignFirstResponder()
//            
//            return true
//        }
//        return false
//    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
//    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
//        return textField.text?.characters.count == 10
//    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
    }

}

//extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    //let pickImage: UIImagePickerController()
//    
//    
//    
//}
