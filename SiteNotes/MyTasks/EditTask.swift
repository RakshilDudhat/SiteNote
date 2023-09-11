//
//  EditTask.swift
//  SiteNotes
//
//  Created by MacOS on 31/08/2023.
//

import SwiftUI

struct EditTask: View {
    
    @State var task: Task
    @State var date = ""
    @State var selectedDate: Date = Date()
    @State private var showDatePicker = false
    @State var isToggle = true
    @State var isNavigationInEditTask = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section("") {
                        HStack {
                            Text(task.tittleName).font(.headline).disabled(showDatePicker)
                            Spacer()
                            Button {
                                print("hello")
                                isNavigationInEditTask.toggle()
                            } label: {
                                Image("IC_OpenInNew")
                                    .frame(width: 28, height: 28)
                                    .aspectRatio(contentMode: .fill)
                            }.disabled(showDatePicker)
                            .background(NavigationLink("", destination: ProjectDetalis(leads: FindList(id: task.id, listImgName: "IC_Find2", listName: task.name, listImgCircle: "IC_Check", street: task.street)).navigationBarHidden(true), isActive: $isNavigationInEditTask).opacity(0))
                        }
                    }
                    
                    TextField("", text: $task.name).disabled(showDatePicker)
                    TextField("", text: $task.subTittle).disabled(showDatePicker)
                    
                    HStack {
                        TextField("", text: $task.time).disabled(showDatePicker)
                        Spacer()
                        Button("\(Image("Appointment"))") {
                            showDatePicker.toggle()
                        }.buttonStyle(.borderless)
                    }
                    
                    HStack {
                        Button {
                            print("Image")
                        } label: {
                            Image(task.image2)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 64, height: 64)
                        }.disabled(showDatePicker)
                        
                        Button {
                            print("plus")
                        } label: {
                            Image("Notes2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 64, height: 64)
                        }.disabled(showDatePicker)
                    }
                    
                    Section("Complete Appointment") {
                        HStack {
                            Toggle(isOn: $isToggle) {
                                Text("Complete")
                                    .font(.system(size: 17))
                            }.disabled(showDatePicker)
                        }
                    }.textCase(.none)
                    
                }.buttonStyle(.borderless)
                    .navigationBarTitle("Edit Task", displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel", role: .cancel) {
                                dismiss()
                            }.disabled(showDatePicker)
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Done", role: .cancel) {
                                dismiss()
                            }.disabled(showDatePicker)
                        }
                    }
                if showDatePicker {
                    ZStack {
                        Rectangle().ignoresSafeArea(.all, edges: .all)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(.black).edgesIgnoringSafeArea(.all)
                            .opacity(0.3)
                        ZStack {
                            Rectangle()
                                .frame(height: 450)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                            VStack {
                                HStack {
                                    Button {
                                        showDatePicker = false
                                    } label: {
                                        Text("Cancel")
                                    }.padding(.leading)
                                    Spacer()
                                    Text("Due Date")
                                    Spacer()
                                    Button {
                                        showDatePicker = false
                                    } label: {
                                        Text("Done")
                                    }.padding(.trailing)
                                }.padding(.top, 8)
                                Divider()
                                DatePicker("", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                                    .labelsHidden()
                                    .datePickerStyle(.graphical)
                                    .datePickerStyle(.graphical)
                                    .frame(maxHeight: 400)
                                    .onDisappear {
                                        let dateFormatter = DateFormatter()
                                        dateFormatter.dateFormat = "d-MM-YYYY"
                                        let formattedDate = dateFormatter.string(from: selectedDate)
                                        date = formattedDate
                                    }
                            }
                        }.padding(.all, 8)
                    }.edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
    private func dismiss() {
         presentationMode.wrappedValue.dismiss()
     }
}

struct EditTask_Previews: PreviewProvider {
    static var previews: some View {
        EditTask(task: Task(id: 0, tittleName: "", street: "", name: "", subTittle: "", image1: "", image2: "", time: "", CompleteAndActive: ""))
    }
}
