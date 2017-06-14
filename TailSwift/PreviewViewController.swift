//
//  PreviewViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 27..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit
import Firebase

class PreviewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewNothing: UIView!
    
    var answers : [answer] = []
    
    var curAnswer : answer!
    override func viewDidAppear(_ animated: Bool) {
        
        var database = FIRDatabase.database()
        var ref  = database.reference()
        
        self.view.viewWithTag(4)?.isHidden = false
        self.view.viewWithTag(1)?.isHidden = false
        
        answers.removeAll()
        tableView.reloadData()
        
        ref = ref.child("Answer").child((FIRAuth.auth()?.currentUser?.uid)!)
        var handle : UInt = 0
        handle = ref.observe(FIRDataEventType.value, with: { (dataSnapshot) in
            ref.removeObserver(withHandle: handle)
            if dataSnapshot.childrenCount > 0 {
                
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.view.viewWithTag(1)?.isHidden = false
                self.view.viewWithTag(4)?.isHidden = true
                
                handle = ref.observe(.childAdded, with: { (snapshot) -> Void in
                    let ans = snapshot.value as! NSDictionary
                    var item = answer(created_at : ans["created_at"]  as! String, aId : ans["aId"] as! Int, answer : ans["answer"] as! String, qId : ans["qId"] as! Int, question : ans["question"] as! String )
                    
                    self.answers.append(item)
                    
                    self.tableView.insertRows(at: [IndexPath(row: self.answers.count-1,section: 0)], with : UITableViewRowAnimation.automatic)
                })
                
                
                
            } else {
                self.view.viewWithTag(4)?.isHidden = false
                self.view.viewWithTag(1)?.isHidden = true
            }
        })
        


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segDetail" {
            let sendtimer=segue.destination as! DetailViewController
            print(self.curAnswer.question)
            sendtimer.a = answer(created_at : curAnswer.created_at, aId : curAnswer.aId, answer : curAnswer.answer, qId : curAnswer.qId, question : curAnswer.question )
            sendtimer.question = self.curAnswer.question
        }
    }
}

extension PreviewViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if answers.count >= 1{
            return answers.count
        }else{
            return 0}
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 첫 번째 인자로 등록한 identifier, cell은 as 키워드로 앞서 만든 custom cell class화 해준다.
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PreviewTableViewCell", for: indexPath) as! PreviewTableViewCell
        if indexPath.row >= 0 {
            cell.isHidden = false
            
        } else {
            cell.isHidden = true
            
        }
        cell.txtQuestion.text = answers[indexPath.row].question
        cell.txtDate.text = answers[indexPath.row].created_at
        return cell }

}


extension PreviewViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        print("HI!",answers[indexPath.row].question)
        curAnswer = answer(created_at : answers[indexPath.row].created_at, aId : answers[indexPath.row].aId, answer : answers[indexPath.row].answer, qId : answers[indexPath.row].qId, question : answers[indexPath.row].question )
        self.performSegue(withIdentifier: "segDetail", sender: self)
        
       
    }
}

