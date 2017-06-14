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
    @IBOutlet weak var txtAnswer: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var img: UIImageView!
    
    var curQst : String!
    var qId : Int!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        //탭바 투명하게 하는 코드
        let tabBar = UITabBar.appearance()
        tabBar.barTintColor = UIColor.clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        // Do any additional setup after loading the view, typically from a nib.
        let gesturetxtChange = UITapGestureRecognizer(target: self, action: #selector(self.getQst(_:)))
        
        txtChange.isUserInteractionEnabled = true
        
        txtChange.addGestureRecognizer(gesturetxtChange)
    }
    
    //화면이 뜨고난 직후 돌아가는 코드.
    override func viewDidAppear(_ animated: Bool) {
        if FIRAuth.auth()?.currentUser?.uid == nil {
        self.performSegue(withIdentifier: "segPopUp", sender: self)
        }else {
            self.checkToday()
            print("It's logined")
        }
 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnWriteClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "segWrite", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segWrite" {
            let sendtimer=segue.destination as! WriteViewController
            sendtimer.question = self.curQst
            sendtimer.qId = self.qId
            sendtimer.answer = self.txtAnswer.text
        }
    }
    func checkToday(){
        var database = FIRDatabase.database()
        var ref  = database.reference()
        var handle : UInt = 0
        handle = ref.child("Answer").child((FIRAuth.auth()?.currentUser?.uid)!).observe(FIRDataEventType.value, with: { (dataSnapshot) in
            ref.removeObserver(withHandle: handle)
            if !dataSnapshot.exists() {
                print("Null")
                self.txtAnswer.isHidden = true
                
                self.getQst()
            } else {
                print("not Null")

                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                let result = formatter.string(from: date)
                print(result)
                
                ref.child("Answer").child((FIRAuth.auth()?.currentUser?.uid)!).queryLimited(toLast: 1).observe(FIRDataEventType.childAdded, with: { (snapShot) in
                    print(String(describing: snapShot))
                    let ans = snapShot.value as! NSDictionary
                    var createdAt = ans["created_at"] as! String!
                    print(createdAt)
                    if createdAt == result {
                        
                        if self.txtAnswer.text == "" {
                        self.txtChange.isHidden = true
                        self.txtQst.text = ans["question"] as! String!
                      
                        self.txtAnswer.text = ans["answer"] as! String!
                        self.curQst =  ans["question"] as! String!
                        self.qId = ans["qId"] as! Int!
                        self.txtQst.text = self.curQst
                        self.txtAnswer.sizeToFit()
                        
                        self.container.frame = CGRect(x: 27, y: 166, width: self.img.frame.size.width, height: self.img.frame.size.height + self.txtAnswer.frame.size.height+50)
                        }
                    } else {
                        self.getQst()
                    }
                })
            }
        })
        
    }
    
    
    func getQst() {
        var randomeN = arc4random_uniform(101)
        print("hi", String(randomeN))
        var database = FIRDatabase.database()
        var ref  = database.reference()
        ref.child("question").child(String(randomeN)).observe(FIRDataEventType.value, with: { (snapshot) in
            let question = snapshot.value as! NSDictionary
            print("hi",question["id"]!)
            self.curQst =  question["q"]! as! String
            self.qId = question["id"]! as! Int
            self.txtQst.text = self.curQst
        })
        print("hello")
        
    }
    
    func getQst(_ sender: UITapGestureRecognizer) {
        getQst()
    }
}

