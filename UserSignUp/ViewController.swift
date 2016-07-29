//
//  ViewController.swift
//  UserSignUp
//
//  Created by Sachin Lamba on 26/07/16.
//  Copyright © 2016 LambaG. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailID: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var pickedimage: UIImageView!
    @IBOutlet weak var introTextview: UITextView!
    @IBOutlet weak var buttonSignUp: UIButton!
    
    let pickImage = UIImagePickerController()
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var keyboardheight: CGFloat = 0
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

        presentViewController(newVC, animated: true, completion: nil)
        
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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        buttonSignUp.userInteractionEnabled = false
        buttonSignUp.backgroundColor = UIColor.yellowColor()
        
    }
    
    func keyboardWillShow(notification:NSNotification) {
        let keyBoardFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        keyboardheight = keyBoardFrame.height
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

/////////////textfield********************************************************************

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidBeginEditing(textField: UITextField) {

        let imageRight = UIImage(named: "yellow")
        let imageRightView = UIImageView(image: imageRight)
        imageRightView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        textField.leftView = imageRightView
        textField.leftViewMode = .Always
        
        textField.clearButtonMode = .WhileEditing
        
        if textField.frame.origin.y + textField.frame.size.height > screenSize.height - keyboardheight {
            view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y-keyboardheight, width: view.frame.size.width, height: view.frame.size.height)
            shift = true
        } else {
            shift = false
        }
    }
    
//    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
//        return textField.text?.characters.count == 10
//    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
//        // if valid email
//        textField.rightViewMode = .Never
//        textField.rightView = nil
//        // if not valid
//        textField.rightViewMode = .Always
//        textField.rightView = UIView()
        if shift {
        view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y+keyboardheight, width: view.frame.size.width, height: view.frame.size.height)
        }
        
        if !((userName.text?.isEmpty)! || (phoneNumber.text?.isEmpty)! || (emailID.text?.isEmpty)! || (introTextview.text?.isEmpty)! || (password.text?.isEmpty)! ) {
            buttonSignUp.userInteractionEnabled = true
            buttonSignUp.backgroundColor = UIColor.whiteColor()

        } else {
            buttonSignUp.userInteractionEnabled = false
            buttonSignUp.backgroundColor = UIColor.yellowColor()
        }
        
    }

}

///////////////textview******************************************************

extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        if textView.frame.origin.y + textView.frame.size.height > screenSize.height - keyboardheight {
            view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y-keyboardheight, width: view.frame.size.width, height: view.frame.size.height)
            shift = true
        } else {
            shift = false
            }
        
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if shift {
            view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y+keyboardheight, width: view.frame.size.width, height: view.frame.size.height)
        }
    }

}