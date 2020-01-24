//
//  SecondViewController.swift
//  notificationCenter
//
//  Created by Sagi Harika on 23/11/19.
//  Copyright © 2019 Sagi Harika. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate
{

    
    
    @IBOutlet weak var nameTF: UITextField!
    
    
    @IBOutlet weak var mobileNoTF: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTF.delegate=self
        mobileNoTF.delegate=self
        mobileNoTF.keyboardType = .phonePad
        
    }
    
    var returnVal:Bool = false
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        //to get one by one textfields
        if(textField==nameTF)
        {
            return true
        }
        if(textField==mobileNoTF)
        {
            if(nameTF.text!.count > 1 )
            {
                return true
            }
            else
            {
                return false
            }
        }
        return true
    }
    //regular expression functions
    
    func isValidName(Input:String) -> Bool {
        let ReGEx = "[A-Za-z ]{2,20}"
        let Test = NSPredicate(format:"SELF MATCHES %@", ReGEx)
        return Test.evaluate(with:Input)
    }
    func isValidMobileNum(Input:String) -> Bool {
        let ReGEx = "^[6-9][0-9]{9}$";
        let Test = NSPredicate(format:"SELF MATCHES %@", ReGEx)
        return Test.evaluate(with:Input)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //using characterset
        if(textField==nameTF)
        {
            let nameCharSet=CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
            if(string.rangeOfCharacter(from: nameCharSet) != nil || string == "")
            {
                returnVal=true
            }
                
            else
            {
                returnVal=false
                self.view.makeToast("Enter Only Alphabets", duration: 1.0, position: .top)
            }
        }
        if(textField==mobileNoTF)
        {
            let nameCharSet=CharacterSet(charactersIn: "0123456789 ")
            if(string.rangeOfCharacter(from: nameCharSet) != nil || string == "")
            {
                returnVal=true
            }
                
            else
            {
                returnVal=false
                self.view.makeToast("Enter Only Numbers", duration: 1.0, position: .top)
            }
            
        }
        return true
    }
    //event handler for button
    @IBAction func submitButtonEH(_ sender: UIButton)
    {
        if(isValidName(Input: nameTF.text!)==true && isValidMobileNum(Input: mobileNoTF.text!)==true)
        {
        
        var info = ["name":nameTF.text!,"mobileNo":mobileNoTF.text!]
        
        NotificationCenter.default.post(name: NSNotification.Name("dataTransfer"), object: self, userInfo: info)
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
}

