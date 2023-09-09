//
//  MyTask.swift
//  SiteNotes
//
//  Created by MacOS on 31/08/2023.
//

import SwiftUI

struct MyTask: View {
    
    
    var body: some View {
        ZStack {
            Form {
                Section("TODAY") {
                    ForEach(ModelData().arrTask, id: \.id) { task in
                        TaskItem(task: task)
                            .background(NavigationLink(destination: EditTask(task: task).navigationBarHidden(true), label: {}).opacity(0))
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
