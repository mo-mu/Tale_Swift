//
//  answer.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 28..
//  Copyright © 2017년 momu. All rights reserved.
//

import Foundation

class answer{
    var created_at : String
    var aId : Int
    var answer : String
    var qId : Int
    var question : String
    
    
    init(created_at : String, aId : Int, answer : String, qId : Int, question : String ) {
        self.created_at  = created_at
        self.aId = aId
        self.answer = answer
        self.qId = qId
        self.question = question
    }
    
    
}
