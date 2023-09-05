//
//  AppointmentList.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import SwiftUI
import UIKit

struct AppointmentList: View {
    
    @State var showingAlert = false
    
    var body: some View {
        ZStack {
            List {
                Section("TODAY") {
                    ForEach(ModelData().arrAppointmentList, id: \.self) { appointment in
                        AppointementItem(appointmentList: appointment)
                            .overlay(NavigationLink(destination: EditAppointment(list: Appointment(appointmentTittle: appointment.appointmentTittle, name: appointment.name, mobileNumber: appointment.mobileNumber, email: appointment.email, time: appointment.time, CompleteAndActive: appointment.CompleteAndActive)).navigationBarTitle("Edit Appointement", displayMode: .inline)) {
                            }.opacity(0))
                    }
                    .listRowSeparator(.hidden)
                }
                .buttonStyle(.borderless)
            }
        }
    }
}

struct AppointmentList_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentList()
    }
}
