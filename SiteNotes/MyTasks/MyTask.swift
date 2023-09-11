//
//  MyTask.swift
//  SiteNotes
//
//  Created by MacOS on 31/08/2023.
//

import SwiftUI

struct MyTask: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                Form {
                    Section("TODAY") {
                        ForEach(ModelData().arrTask, id: \.id) { task in
                            ZStack {
                                Rectangle()
                                    .cornerRadius(8)
                                    .frame(height: 130, alignment: .center)
                                    .foregroundColor(.white)
                                ZStack {
                                    TaskItem(task: task)
                                }.padding(.all, 8.0)
                            }.padding(.bottom, 8.0)
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets())
                    }
                    .listRowSeparator(.hidden)
                }.buttonStyle(.borderless)
            }
            .navigationBarTitle("Tasks", displayMode: .inline)
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

struct MyTask_Previews: PreviewProvider {
    static var previews: some View {
        MyTask()
    }
}
