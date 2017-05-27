//
//  LoginViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 27..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var editEmail: UITextField!
    @IBOutlet weak var editPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBackClicked(_ sender: Any) {
        let alertController = UIAlertController(title: "잠깐만", message: "로그인을 취소하시겠어요?", preferredStyle: .alert)
        
        
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
    @IBAction func btnLoginClicked(_ sender: Any) {
        print(self.editEmail.text!)
        FIRAuth.auth()?.signIn(withEmail: self.editEmail.text!, password: self.editPassword.text!, completion: { (user, error) in
            if error != nil {       //로그인 됐을 때
                print("it's logined")
                self.dismiss(animated: true, completion: nil)
                print(FIRAuth.auth()?.currentUser?.uid)
            } else {        // 로그인 안됐을 때
                let alertController = UIAlertController(title: "다시 확인 바랍니다.", message: "", preferredStyle: .alert)
                
                
                let cancelAction = UIAlertAction(title: "확인", style: .default, handler: {
                    (action : UIAlertAction!) -> Void in
                    
                })

            }
        })
        
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
