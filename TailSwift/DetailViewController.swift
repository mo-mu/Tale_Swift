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
    var answer : String!
    var created_at : String!
    var aId : Int!
    var qId : Int!
    
    var a : answer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi!!",a.question)
        print("hi!!",question)
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

    @IBAction func btnBackClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
