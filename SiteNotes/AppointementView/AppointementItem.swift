//
//  AppointementItem.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import SwiftUI

struct AppointementItem: View {
    
    let appointmentList: Appointment
    @State private var action: Int? = 0
    @State var showingAlert = false
    @State var isNavigationInEditTask = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(appointmentList.appointmentTittle).font(.headline)
                Spacer()
                Button {
                    print("hello")
                    isNavigationInEditTask.toggle()
                } label: {
                    Image("IC_OpenInNew")
                        .frame(width: 28, height: 28)
                        .aspectRatio(contentMode: .fill)
                }.background(NavigationLink("", destination: ProjectDetalis(leads: FindList(id: appointmentList.id, listImgName: "IC_Find2", listName: appointmentList.name, listImgCircle: "IC_Check", street: "6627 192A Street")).navigationBarHidden(true), isActive: $isNavigationInEditTask).opacity(0))
            }.frame(maxWidth: .infinity, maxHeight: 30)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(appointmentList.name).font(.system(size: 15))
                HStack {
                    Image("Phone")
                        .frame(width: 12, height: 12)
                    Text(appointmentList.mobileNumber).font(.system(size: 11)).foregroundColor(.gray)
                    HStack {
                        Spacer()
                        Button {
                            print("Delete")
                            showingAlert = true
                        } label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                                .frame(width: 24, height: 24)
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                }
                
                HStack {
                    Image("Mail")
                        .frame(width: 12, height: 12)
                    Text(appointmentList.email).font(.system(size: 11)).foregroundColor(.gray)
                    HStack {
                        Spacer()
                        Button {
                            print("Hello")
                        } label: {
                            if appointmentList.CompleteAndActive == "Completed" {
                                Text(appointmentList.CompleteAndActive).font(.system(size: 11))
                                    .frame(width: 77, height: 21)
                                    .tint(.white)
                                    .background(Color.green)
                                    .cornerRadius(8)
                            } else if appointmentList.CompleteAndActive == "Active" {
                                Text(appointmentList.CompleteAndActive).font(.system(size: 11))
                                    .frame(width: 77, height: 21)
                                    .tint(.white)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                        }
                    }
                }
                Text(appointmentList.time).font(.system(size: 11))
            }.onTapGesture {
                self.action = 1
            }
            .buttonStyle(.borderless)
            .overlay(NavigationLink(destination: EditAppointment(list: appointmentList).navigationBarHidden(true), tag: 1, selection: $action, label: {
            }).opacity(0))
            .alert(isPresented: $showingAlert) {
                let firstButton = Alert.Button.default(Text("Cancel")) { showingAlert = false }
                let secondButton = Alert.Button.destructive(Text("Delete")) { showingAlert = false }
                return Alert(title: Text("Delete Appointement?"), message: Text("Are you sure you want permanently delete this appointement?"), primaryButton: firstButton, secondaryButton: secondButton)
            }
        }
    }
}

struct AppointementItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppointementItem(appointmentList: ModelData().arrAppointmentList[0])
            AppointementItem(appointmentList: ModelData().arrAppointmentList[1])
        }
        .previewLayout(.sizeThatFits)
    }
}
