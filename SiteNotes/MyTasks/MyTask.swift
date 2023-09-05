//
//  MyTask.swift
//  SiteNotes
//
//  Created by MacOS on 31/08/2023.
//

import SwiftUI

struct MyTask: View {
    
    @State private var isEditingTask = false
    
    var body: some View {
        ZStack {
            List {
                Section("TODAY") {
                    ForEach(ModelData().arrTask, id: \.self) { task in
                        TaskItem(task: task).onTapGesture(perform: {
                            isEditingTask = true
                        })
                            .overlay(NavigationLink(destination: EditTask(task: Task(tittleName: task.tittleName, name: task.name, subTittle: task.subTittle, image1: task.image1, image2: task.image2, time: task.time, CompleteAndActive: task.CompleteAndActive))
                                                        .navigationBarTitle("Edit Task", displayMode: .inline)
                                                        .toolbar(content: {
                                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button("Done") {
                                        isEditingTask = false
                                        EditTask(task: task).presentation.wrappedValue.dismiss()
                                    }
                                }
                            }
                        ), isActive: $isEditingTask) {}.opacity(0))
                    }
                }
                .listRowSeparator(.hidden)
            }.buttonStyle(.borderless)
        }
    }
}

struct MyTask_Previews: PreviewProvider {
    static var previews: some View {
        MyTask()
    }
}
