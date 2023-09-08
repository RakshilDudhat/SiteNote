//
//  EditAppointment.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import SwiftUI

struct EditAppointment: View {
    
    @State var list: Appointment
    @State var isToggle = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            List {
                Section("") {
                    HStack {
                        Text(list.appointmentTittle).font(.headline)
                        Spacer()
                        Button {
                            print("hello")
                        } label: {
                            Image("IC_OpenInNew")
                                .frame(width: 28, height: 28)
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                }
                TextField("", text: $list.name)
                HStack {
                    Image("Phone-1")
                        .resizable()
                        .frame(width: 25, height: 25)
                    TextField("", text: $list.mobileNumber)
                }
                HStack {
                    Image("Mail-1")
                        .resizable()
                        .frame(width: 25, height: 25)
                    TextField("", text: $list.email)
                }
                HStack {
                    Image("Calender-1")
                        .resizable()
                        .frame(width: 25, height: 25)
                    TextField("", text: $list.time)
                }
                
                Section("") {
                    HStack {
                        Text("Remind Me").font(.system(size: 17))
                        NavigationLink {
                            RemindME()
                                .navigationBarTitle("Remind Me", displayMode: .inline)
                        } label: {
                            Spacer()
                            Label("1 day before", image: "")
                                .foregroundColor(Color.gray)
                                .labelStyle(.titleOnly)
                        }
                    }
                }
                
                Section("Complete Appointment") {
                    HStack {
                        Toggle(isOn: $isToggle) {
                            Text("Complete")
                                .font(.system(size: 17))
                        }
                    }
                }.textCase(.none)
            }
        }
    }
}

struct EditAppointment_Previews: PreviewProvider {
    static var previews: some View {
        EditAppointment(list: Appointment(appointmentTittle: "", name: "", mobileNumber: "", email: "", time: "", CompleteAndActive: ""))
    }
}
