//
//  SetUpViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 27..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit
import Firebase

class SetUpViewController: UIViewController {

    @IBOutlet weak var txtLogin: UILabel!
    @IBOutlet weak var txtEmail: UILabel!
    @IBOutlet weak var txtVersion: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       self.checkingUser()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       self.checkingUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func checkingUser(){
        if FIRAuth.auth()?.currentUser != nil {
            txtLogin.text = "로그아웃"
            txtEmail.text = FIRAuth.auth()?.currentUser?.email
        
            let gesturetxtChange = UITapGestureRecognizer(target: self, action: #selector(self.logout(_:)))
        
            self.txtLogin.addGestureRecognizer(gesturetxtChange)
        
            txtLogin.isUserInteractionEnabled = true
        
        } else {
            txtLogin.text = "로그인"
            txtEmail.text = ""
            
            let gesturetxtChange = UITapGestureRecognizer(target: self, action: #selector(self.login(_:)))
            
            self.txtLogin.addGestureRecognizer(gesturetxtChange)
            
            txtLogin.isUserInteractionEnabled = true
        }
    }
    
    func login(_ sender: UITapGestureRecognizer) {
        
        self.performSegue(withIdentifier: "segLogin", sender: self)
    }
    
    func logout (_ sender: UITapGestureRecognizer){
        let alertController = UIAlertController(title: "잠깐만", message: "로그아웃을 하시겠어요?", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "넴", style: .default, handler: {
            alert -> Void in
            do {
               try FIRAuth.auth()?.signOut()
                self.dismiss(animated: true, completion: nil)
                self.checkingUser()
            } catch {
            
            }
        })
        let cancelAction = UIAlertAction(title: "아니요", style: .default, handler: {
            alert -> Void in
        })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
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
