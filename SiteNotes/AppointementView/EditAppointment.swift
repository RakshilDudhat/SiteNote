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
    @State var isNavigationInEditTask = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
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
                            }.background(NavigationLink("", destination: ProjectDetalis(leads: FindList(id: list.id, listImgName: "IC_Find2", listName: list.name, listImgCircle: "IC_Check", street: "6627 192A Street")).navigationBarHidden(true), isActive: $isNavigationInEditTask).opacity(0))
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
            .navigationBarTitle("Edit Appointments", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("Back")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done", role: .cancel) {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct EditAppointment_Previews: PreviewProvider {
    static var previews: some View {
        EditAppointment(list: Appointment(id: 0, appointmentTittle: "", name: "", mobileNumber: "", email: "", time: "", CompleteAndActive: ""))
    }
}
