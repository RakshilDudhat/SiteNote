//
//  ModelData.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    @Published var todaydetalis: [Today] = [Today(id: 1, imageName: "Calender", name: "My Appointement", badge: "05"),
                                            Today(id: 2, imageName: "Task", name: "My Tasks", badge: "05")]
    
    @Published var smallHouse: [SmallHouse] = [SmallHouse(id: 1, name: "Leads", badge: "07"),
                                               SmallHouse(id: 2, name: "Site Visits", badge: ""),
                                               SmallHouse(id: 3, name: "Jobs", badge: ""),
                                               SmallHouse(id: 4, name: "Installations", badge: ""),
                                               SmallHouse(id: 5, name: "Completed", badge: "02"),]
    
    @Published var arrEditProjectStatus: [SmallHouse] = [SmallHouse(id: 1, name: "Leads", badge: ""),
                                                         SmallHouse(id: 2, name: "Site Visits", badge: ""),
                                                         SmallHouse(id: 3, name: "Jobs", badge: ""),
                                                         SmallHouse(id: 4, name: "Installations", badge: ""),
                                                         SmallHouse(id: 5, name: "Completed", badge: ""),]
    
    @Published var arrSetting: [SettingName] = [SettingName(id: 1, name: "Edit Default Project Template"),
                                                SettingName(id: 2, name: "Terms & Condition"),
                                                SettingName(id: 3, name: "Privacy Policy"),
                                                SettingName(id: 4, name: "Contant Us"),
                                                SettingName(id: 5, name: "Remove Ads (Subscribe)"),]
    
    @Published var arrFindList: [FindList] = [FindList(id: 1, listImgName: "IC_Find1", listName: "5132 Alderfield place, west vencouver", listImgCircle: "IC_Check", street: "6627 192A Street"),
                                              FindList(id: 2, listImgName: "IC_Find2", listName: "5132 Alderfield place, west vencouver", listImgCircle: "IC_Check", street: "6627 192A Street")]
    
    @Published var arrClientName: [ClientName] = [ClientName(name: "John Smith"),
                                                  ClientName(name: "Jacob Jones"),
                                                  ClientName(name: "Devon Lane"),
                                                  ClientName(name: "Lesile Alexander"),
                                                  ClientName(name: "Marvin McKinney"),
                                                  ClientName(name: "Jane Cooper"),
                                                  ClientName(name: "Courtney Henry"),]
    
    @Published var arrAppointmentList: [Appointment] = [Appointment(appointmentTittle: "Interior Design : Lorem Ip...", name: "John Smith", mobileNumber: "+91 (XXX)XXX-XXXX", email: "test22@gmail.com", time:                                                         "Today, 11:00 AM - 12:00 PM", CompleteAndActive: "Completed"),
                                                        Appointment(appointmentTittle: "Interior Design : Lorem Ip...", name: "John Smith", mobileNumber: "+91 (XXX)XXX-XXXX", email: "test22@gmail.com", time: "Today, 11:00 AM - 12:00 PM", CompleteAndActive: "Active"),
                                                        Appointment(appointmentTittle: "Interior Design : Lorem Ip...", name: "John Smith", mobileNumber: "+91 (XXX)XXX-XXXX", email: "test22@gmail.com", time: "Today, 11:00 AM - 12:00 PM", CompleteAndActive: "Completed")]
    
    @Published var arrTiming: [Notification] = [Notification(timing: "At time of event"),
                                                Notification(timing: "5 min before"),
                                                Notification(timing: "10 min before"),
                                                Notification(timing: "30 min before"),
                                                Notification(timing: "1 hour before"),
                                                Notification(timing: "1 day before"),]
    
    @Published var arrTask: [Task] = [Task(tittleName: "Interior Design : Lorem Ip...", name: "John Smith", subTittle: "Lorem lpsum is simply dummy.", image1: "IC_TaskImg1", image2: "IC_TaskImg2", time: "Today, 11:00 AM - 12:00 PM", CompleteAndActive: "Completed"),
                                      Task(tittleName: "Interior Design : Lorem Ip...", name: "John Smith", subTittle: "Lorem lpsum is simply dummy.", image1: "IC_TaskImg1", image2: "IC_TaskImg2", time: "Today, 11:00 AM - 12:00 PM", CompleteAndActive: "Completed"),
                                      Task(tittleName: "Interior Design : Lorem Ip...", name: "John Smith", subTittle: "Lorem lpsum is simply dummy.", image1: "IC_TaskImg1", image2: "IC_TaskImg2", time: "Today, 11:00 AM - 12:00 PM", CompleteAndActive: "Active"),
                                      Task(tittleName: "Interior Design : Lorem Ip...", name: "John Smith", subTittle: "Lorem lpsum is simply dummy.", image1: "IC_TaskImg1", image2: "IC_TaskImg2", time: "Today, 11:00 AM - 12:00 PM", CompleteAndActive: "Completed"),]
    
    @Published var arrLead: [FindList] = [FindList(id: 1, listImgName: "IC_Find1", listName: "5132 Alderfield place, west vencouver", listImgCircle: "IC_Check", street: "6627 192A Street"),
                                          FindList(id: 2, listImgName: "IC_Find3", listName: "5132 Alderfield place, west vencouver", listImgCircle: "IC_Check", street: "6627 192A Street"),
                                          FindList(id: 3, listImgName: "IC_Find2", listName: "5132 Alderfield place, west vencouver", listImgCircle: "IC_Check", street: "6627 192A Street"),
                                          FindList(id: 4, listImgName: "IC_Find3", listName: "5132 Alderfield place, west vencouver", listImgCircle: "IC_Check", street: "6627 192A Street"),
                                          FindList(id: 5, listImgName: "IC_Find4", listName: "5132 Alderfield place, west vencouver", listImgCircle: "IC_Check", street: "6627 192A Street"),]
    
    @Published var arrStatus = [Statu(id: 1, status: "Job"),
                                Statu(id: 2, status: "Site Visit"),
                                Statu(id: 3, status: "Installation"),
                                Statu(id: 4, status: "Completed"),]
}
