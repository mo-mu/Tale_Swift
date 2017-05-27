//
//  ViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 9..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var txtChange: UILabel!
    @IBOutlet weak var txtQst: UILabel!
    @IBOutlet weak var btnWrite: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        
        //탭바 투명하게 하는 코드
        let tabBar = UITabBar.appearance()
        tabBar.barTintColor = UIColor.clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        
        // Do any additional setup after loading the view, typically from a nib.
        let gesturetxtChange = UITapGestureRecognizer(target: self, action: #selector(self.changeQst(_:)))
        
        self.txtChange.addGestureRecognizer(gesturetxtChange)
        
        txtChange.isUserInteractionEnabled = true
    }
    
    //화면이 뜨고난 직후 돌아가는 코드.
    override func viewDidAppear(_ animated: Bool) {
        if FIRAuth.auth()?.currentUser?.uid == nil {
        self.performSegue(withIdentifier: "segPopUp", sender: self)
        }else {
            print("It's logined")
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func changeQst(_ sender: UITapGestureRecognizer) {
        txtQst.text = "test"
        print("hello")
        self.performSegue(withIdentifier: "segPopUp", sender: self)
        
        
    }
 
}

