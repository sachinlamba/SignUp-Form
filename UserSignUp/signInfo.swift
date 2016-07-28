//
//  signInfo.swift
//  UserSignUp
//
//  Created by Sachin Lamba on 26/07/16.
//  Copyright © 2016 LambaG. All rights reserved.
//

import UIKit

class signInfo: UIViewController {

    var signUsername: String!
    var signPhoneNumber: String!
    var signEmailId: String!
    var signPassword: String!
    var signPic: UIImage!
    var signUserInfo: String!
    
    @IBOutlet weak var userSignUp: UITextField!
    @IBOutlet weak var phoneSignUp: UITextField!
    @IBOutlet weak var emailIdSignUp: UITextField!
    @IBOutlet weak var passwordSignUp: UITextField!
    @IBOutlet weak var picSignUp: UIImageView!
    @IBOutlet weak var infoSignUp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.yellowColor()
        
        //let sign = signUsername
        userSignUp.text = signUsername
        phoneSignUp.text = signPhoneNumber
        emailIdSignUp.text = signEmailId
        passwordSignUp.text = signPassword
        //picSignUp.frame = CGRect(x: 50, y: 300, width: 80, height: 80)
        picSignUp.image = signPic
        infoSignUp.text = signUserInfo
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
