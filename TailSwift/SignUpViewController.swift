//
//  SignUpViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 27..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var editNickname: UITextField!
    @IBOutlet weak var editemail: UITextField!
    @IBOutlet weak var editPassword: UITextField!
    @IBOutlet weak var editcheckPw: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClicked(_ sender: Any) {
        
        let alertController = UIAlertController(title: "잠깐만", message: "회원가입을 취소하시겠어요?", preferredStyle: .alert)
        
        
        let cancelAction = UIAlertAction(title: "아니요", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            
        })
        
        let saveAction = UIAlertAction(title: "넴", style: .default, handler: {
            alert -> Void in
            self.dismiss(animated: true, completion: nil)
            
        })
        
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }

    @IBAction func btnSignUpClicked(_ sender: Any) {
        if self.editPassword.text! == self.editcheckPw.text! {  //같을 경우
            FIRAuth.auth()?.createUser(withEmail: editemail.text!, password: editPassword.text!, completion: { (user, error) in
                if error == nil {   //성공
                    var database = FIRDatabase.database()
                    var ref = database.reference()
                    
                    ref.child("user").child((FIRAuth.auth()?.currentUser?.uid)!)
                        .setValue(["email" : FIRAuth.auth()?.currentUser?.email!,
                                   "nickname" : self.editNickname.text!])
                    
                    self.dismiss(animated: true, completion: nil)
            
                } else {        //실패
                    let alertController = UIAlertController(title: "잠깐만", message: "오류가 있어요.", preferredStyle: .alert)
                    
                    let saveAction = UIAlertAction(title: "넴", style: .default, handler: {
                        alert -> Void in
                        self.dismiss(animated: true, completion: nil)
                    })
                
                alertController.addAction(saveAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
            }
        )} else { // 다를 경우
            let alertController = UIAlertController(title: "잠깐만", message: "비밀번호를 확인하세요.", preferredStyle: .alert)
            
            let saveAction = UIAlertAction(title: "넴", style: .default, handler: {
                alert -> Void in
                self.dismiss(animated: true, completion: nil)
                
            })
            
            alertController.addAction(saveAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
