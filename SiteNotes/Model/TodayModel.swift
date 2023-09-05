//
//  TodayModel.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import Foundation
import SwiftUI

struct Today: Hashable, Codable, Identifiable {
    
    var id: Int
    var imageName: String
    var name: String
    var badge: String
}


