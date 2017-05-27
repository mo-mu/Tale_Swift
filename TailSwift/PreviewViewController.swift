//
//  PreviewViewController.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 27..
//  Copyright © 2017년 momu. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    var questions = ["test1", "test2", "test3"]
    override func viewDidLoad() {
        super.viewDidLoad()

        
        TableView.dataSource = self
        TableView.delegate = self
        
        // Do any additional setup after loading the view.
        self.TableView.insertRows(at: [IndexPath(row: self.questions.count-1,section: 0)], with : UITableViewRowAnimation.automatic)
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

}

extension PreviewViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if questions==nil{
            return 0
        }else{
            return questions.count }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // 첫 번째 인자로 등록한 identifier, cell은 as 키워드로 앞서 만든 custom cell class화 해준다.
        let cell = self.TableView.dequeueReusableCell(withIdentifier: "PreviewTableViewCell", for: indexPath) as! PreviewTableViewCell
        cell.txtQuestion.text = questions[indexPath.row]
        
        return cell }
}


extension PreviewViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        print(indexPath.row)
       
    }
}

