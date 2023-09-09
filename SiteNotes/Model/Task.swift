//
//  Task.swift
//  SiteNotes
//
//  Created by MacOS on 31/08/2023.
//

import Foundation

struct Task: Hashable, Identifiable {
    
    var id: Int
    var tittleName: String
    var street: String
    var name: String
    var subTittle: String
    var image1: String
    var image2: String
    var time: String
    var CompleteAndActive: String
}


struct Statu: Identifiable {
    var id: Int
    var status: String
}
