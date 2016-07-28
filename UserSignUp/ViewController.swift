//
//  ViewController.swift
//  UserSignUp
//
//  Created by Sachin Lamba on 26/07/16.
//  Copyright © 2016 LambaG. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var pickedimage: UIImageView!
    @IBOutlet weak var introTextview: UITextView!
    
    let pickImage = UIImagePickerController()
    var shift: Bool = false
    @IBAction func ImagePickButton(sender: AnyObject) {
        presentViewController(pickImage, animated: true, completion: nil)
    }
    
    @IBAction func signUpTapped(sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyBoard.instantiateViewControllerWithIdentifier("signInfo") as! signInfo
        newVC.signUsername = userName.text
        newVC.signPhoneNumber = phoneNumber.text
        newVC.signEmailId = emailID.text
        newVC.signPassword = password.text
        newVC.signPic = pickedimage.image
        newVC.signUserInfo = introTextview.text
        introTextview.editable = true
        introTextview.backgroundColor = UIColor.yellowColor()

        presentViewController(newVC, animated: true, completion: nil)
        
        userName.rightView = UIView()
        userName.rightViewMode = .Always

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userName.delegate = self
        phoneNumber.delegate = self
        emailID.delegate = self
        password.delegate = self
        introTextview.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyboardReturn)))
        
        pickImage.delegate = self
        
        
    }
    
    func imagePickerController(imager: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {

        let newImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        pickedimage.image = newImage
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    func keyboardReturn() {
        view.endEditing(true)
        //textField.resignFirstResponder()
    }
}


extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.frame.origin.y - 100 > view.frame.origin.y {
            view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y-100, width: view.frame.size.width, height: view.frame.size.height)
            shift = true
        } else {
            shift = false
        }
    }
    
//    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
//        return textField.text?.characters.count == 10
//    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        // if valid email 
        textField.rightViewMode = .Never
        textField.rightView = nil
        // if not valid
        textField.rightViewMode = .Always
        textField.rightView = UIView()
        if shift {
        view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y+100, width: view.frame.size.width, height: view.frame.size.height)
        }
        
    }

}
