//
//  DetailViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 27..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var question : String!
    var curAnswer : String!
    var created_at : String!
    var aId : Int!
    var qId : Int!
    
    var a : answer!
    
    @IBOutlet weak var container: UIImageView!
    @IBOutlet weak var txtQuestion: UILabel!
    @IBOutlet weak var txtAnswer: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi!!",a.question)
        print("hi!!",question)
        // Do any additional setup after loading the view.
        
        txtQuestion.text = a.question
        txtAnswer.text = a.answer
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        txtAnswer.isUserInteractionEnabled = true
        txtAnswer.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UITextView
        
        performSegue(withIdentifier: "segMoti", sender: self)
        // Your action
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segMoti" {
            let sendtimer=segue.destination as! MotiViewController
            sendtimer.a = answer(created_at : a.created_at, aId : a.aId, answer : a.answer, qId : a.qId, question : a.question )
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

    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
