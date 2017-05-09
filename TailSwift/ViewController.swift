//
//  ViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 9..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtChange: UILabel!
    @IBOutlet weak var txtQst: UILabel!
    @IBOutlet weak var btnWrite: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        
        let gesturetxtChange = UITapGestureRecognizer(target: self, action: #selector(self.changeQst(_:)))
        
        self.txtChange.addGestureRecognizer(gesturetxtChange)
        
        txtChange.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func changeQst(_ sender: UITapGestureRecognizer) {
        txtQst.text = "test"
        print("hello")
    }
 
}

