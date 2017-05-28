//
//  question.swift
//  TailSwift
//
//  Created by songmho on 2017. 5. 28..
//  Copyright © 2017년 momu. All rights reserved.
//

import Foundation

class group{
    
    var created_at : String
    var id : Int
    var q : String
    var updated_at : String
    
    
    init(created_at : String, id : Int, q : String, updated_at : String ) {
        self.created_at  = created_at
        self.id = id
        self.q = q
        self.updated_at = updated_at
    }
    
}
