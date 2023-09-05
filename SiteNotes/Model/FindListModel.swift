//
//  FindListModel.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import Foundation

struct FindList: Hashable, Identifiable {
    var id: Int
    var listImgName: String
    var listName: String
    var listImgCircle: String
    var street: String
}


struct ClientName: Hashable, Identifiable {
    var id = UUID()
    var name: String
}
