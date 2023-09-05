//
//  TaskItem.swift
//  SiteNotes
//
//  Created by MacOS on 31/08/2023.
//

import SwiftUI

struct TaskItem: View {
    
    let task: Task
    @State var showingAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
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
            }.frame(maxWidth: .infinity, maxHeight: 30)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
            Text(task.name).font(.system(size: 15))
            HStack {
                Text(task.subTittle).font(.system(size: 11)).foregroundColor(.gray)
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
                
                Image(task.image1)
                    .resizable()
                    .frame(width: 20, height: 20)
                Image(task.image2)
                    .offset(x: -12)
                Text(task.time).font(.system(size: 11))
                HStack {
                    Spacer()
                    Button {
                        print("Hello")
                    } label: {
                        if task.CompleteAndActive == "Completed" {
                            Text(task.CompleteAndActive).font(.system(size: 11))
                                .frame(width: 77, height: 21)
                                .tint(.white)
                                .background(Color.green)
                                .cornerRadius(8)
                        } else if task.CompleteAndActive == "Active" {
                            Text(task.CompleteAndActive).font(.system(size: 11))
                                .frame(width: 77, height: 21)
                                .tint(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            let firstButton = Alert.Button.default(Text("Cancel")) { showingAlert = false }
            let secondButton = Alert.Button.destructive(Text("Delete")) { showingAlert = false }
            return Alert(title: Text("Delete Appointement?"), message: Text("Are you sure you want permanently delete this appointement?"), primaryButton: firstButton, secondaryButton: secondButton)
        }
    }
}

struct TaskItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TaskItem(task: ModelData().arrTask[0])
            TaskItem(task: ModelData().arrTask[2])
        }
        .previewLayout(.fixed(width: 240, height: 200))
    }
}
