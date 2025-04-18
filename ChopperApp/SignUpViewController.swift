//
//  SignUpViewController.swift
//  ChopperApp
//
//  Created by Prashanth Thongala on 18/04/25.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var confirmpassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func resetbutton(_ sender: Any) {
        
        guard let enteremail = email.text,
                 let newpassword = password.text,
                 let confirmpassword = confirmpassword.text else {
               showAlert(message: "Please fill all fields")
               return
           }

           var errorMessages: [String] = []

           // ✅ Validate email using the extracted string
           if !validemail(enteremail) {
               errorMessages.append("Enter a valid email address")
           }

           // ✅ Validate password match
           if newpassword != confirmpassword {
               errorMessages.append("Passwords do not match")
           }

           // ✅ Show all collected errors
           if !errorMessages.isEmpty {
               showAlert(message: errorMessages.joined(separator: "\n"))
               return
           }

           // ✅ All good
           showAlert(message: "Password reset successful (demo logic)")
       }
    func validemail(_ email: String) -> Bool {
           // Basic email format regex
        let atSymbolCount = email.filter { $0 == "@" }.count
         guard atSymbolCount == 1 else {
             return false
         }

         // Check email regex pattern
         let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
         let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)

         return emailTest.evaluate(with: email)
       }
    
    
    func showAlert(message: String) {
           let alert = UIAlertController(title: "Notice", message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default))
           present(alert, animated: true)
       }
}


