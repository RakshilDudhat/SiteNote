//
//  NewTask.swift
//  SiteNotes
//
//  Created by MacOS on 04/09/2023.
//

import SwiftUI

struct NewTask: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var name = "Lorem lpusm"
    @State var description = ""
    @State var selectDate = ""
    @State private var image: Image? = Image("Camera")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @State var selectedDate: Date = Date()
    @State private var showDatePicker = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 240/255, green: 241/255, blue: 246/255)
                List {
                    TextField("Lorem Lpusm", text: $name)
                    TextField("Add Description", text: $description)
                    HStack {
                        TextField("Select Date", text: $selectDate)
                        Spacer()
                        Button("\(Image("Appointment"))") {
                            showDatePicker.toggle()
                        }.buttonStyle(.borderless)
                    }
                    VStack {
                        Text("Add Image").foregroundColor(Color(red: 134/255, green: 142/255, blue: 150/255))
                        HStack {
                            image!
                                .resizable()
                                .cornerRadius(8)
                                .frame(width: 64, height: 64)
                                .onTapGesture { self.shouldPresentActionScheet = true }
                            .sheet(isPresented: self.$shouldPresentImagePicker) {
                                ImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: $image, isPresented: self.$shouldPresentImagePicker)
                            }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                                ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your Image."), buttons: [ActionSheet.Button.default(Text("Photo Libary"), action: {
                                    self.shouldPresentImagePicker = true
                                    self.shouldPresentCamera = false
                                }), ActionSheet.Button.cancel()])
                            }
                        }
                    }
                }.disabled(showDatePicker)
                .navigationBarTitle("New Task", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel", role: .cancel) {
                            dismiss()
                        }.disabled(showDatePicker)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done", role: .cancel) {
                            dismiss()
                        }
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
                                        selectDate = formattedDate
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

struct NewTask_Previews: PreviewProvider {
    static var previews: some View {
        NewTask()
    }
}
