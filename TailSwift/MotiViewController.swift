//
//  MotiViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 29..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit

class MotiViewController: UIViewController {

    
    var a : answer!
    
    @IBOutlet weak var txtQuestion: UILabel!
    @IBOutlet weak var editAnswer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtQuestion.text = a.question
        editAnswer.text = a.answer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBackClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnMotiClicked(_ sender: Any) {
        
        let alertController = UIAlertController(title: "잠깐만", message: "수정하시겠어요?", preferredStyle: .alert)
        
        
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
    @IBAction func btnRemoveClicked(_ sender: Any) {
        
        let alertController = UIAlertController(title: "잠깐만", message: "삭제하시겠어요?", preferredStyle: .alert)
        
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
