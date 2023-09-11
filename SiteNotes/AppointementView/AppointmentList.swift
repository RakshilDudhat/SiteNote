//
//  AppointmentList.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import SwiftUI
import UIKit

struct AppointmentList: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section("TODAY") {
                        ForEach(ModelData().arrAppointmentList, id: \.self) { appointment in
                            ZStack {
                                Rectangle()
                                    .cornerRadius(8)
                                    .frame(height: 130, alignment: .center)
                                    .foregroundColor(.white)
                                ZStack {
                                    AppointementItem(appointmentList: appointment)
                                        .overlay(NavigationLink(destination: EditAppointment(list: Appointment(id: appointment.id, appointmentTittle: appointment.appointmentTittle, name: appointment.name, mobileNumber: appointment.mobileNumber, email: appointment.email, time: appointment.time, CompleteAndActive: appointment.CompleteAndActive)).navigationBarHidden(true)) {
                                        }.opacity(0))
                                }.padding(.all, 8.0)
                            }.padding(.bottom, 8.0)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                    }
                    .buttonStyle(.borderless)
                }
            }
            .navigationBarTitle("Appointments", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("Back")
                    }
                }
            }
        }
    }
}

struct AppointmentList_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentList()
    }
}
