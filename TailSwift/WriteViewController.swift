//
//  WriteViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 9..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit
import Firebase

class WriteViewController: UIViewController {

    @IBOutlet weak var editAnswer: UITextField!
    @IBOutlet weak var txtQuestion: UILabel!
    
    var question : String!
    var qId : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtQuestion.text = question
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDoneClicked(_ sender: Any) {
        var database = FIRDatabase.database()
        var ref = database.reference()
        
        ref = ref.child("Answer").child((FIRAuth.auth()?.currentUser?.uid)!)
        var handle: UInt = 0
        handle = ref.observe(FIRDataEventType.value, with: { (datasnapshot) in
            if datasnapshot != nil {
                ref.removeObserver(withHandle: handle)
                print("it's not nil", datasnapshot.childrenCount)
                ref.child(String(datasnapshot.childrenCount)).setValue(
                ["aId":datasnapshot.childrenCount,
                 "answer": self.editAnswer.text,
                 "created_at":"2017-05-28",
                 "qId": self.qId,
                 "question": self.question]
                )
            } else {
                print("it's nil")
            }
 
        })
 
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnBackClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
