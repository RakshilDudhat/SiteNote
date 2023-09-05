//
//  EditTask.swift
//  SiteNotes
//
//  Created by MacOS on 31/08/2023.
//

import SwiftUI

struct EditTask: View {
    
    @State var task: Task
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.presentationMode) var presentation
    @State var isToggle = true
    
    var body: some View {
//        ZStack {
        NavigationView {
            
            List {
                Section("") {
                    HStack {
                        Text(task.tittleName).font(.headline)
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
                TextField("", text: $task.name)
                TextField("", text: $task.subTittle)
                HStack {
                    TextField("", text: $task.time)
                    Spacer()
                    Button {
                        print("Appointemetn")
                    } label: {
                        Image("Appointment")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                HStack {
                    Button {
                        print("Image")
                    } label: {
                        Image(task.image2)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 64, height: 64)
                    }
                    
                    Button {
                        print("plus")
                    } label: {
                        Rectangle()
                            .stroke(.gray, style: StrokeStyle(lineWidth: 1, dash: [3], dashPhase: 0.0))
                            .foregroundColor(Color.white)
                            .frame(width: 64, height: 64)
                            .overlay(Image(systemName: "plus")
                                        .frame(width: 64, height: 64))
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
                
            }.buttonStyle(.borderless)
                .navigationBarHidden(true)
        }
//        }
    }
}

struct EditTask_Previews: PreviewProvider {
    static var previews: some View {
        EditTask(task: Task(tittleName: "", name: "", subTittle: "", image1: "", image2: "", time: "", CompleteAndActive: ""))
    }
}