//
//  AppontementModel.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import Foundation

struct Appointment: Hashable, Identifiable, Codable {
    var id: Int
    var appointmentTittle: String
    var name: String
    var mobileNumber: String
    var email: String
    var time: String
    var CompleteAndActive: String
}

struct Notification: Hashable, Identifiable {
    var id = UUID()
    var timing: String
}
