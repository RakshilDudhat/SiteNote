//
//  ProjectDetalis.swift
//  SiteNotes
//
//  Created by MacOS on 01/09/2023.
//

import SwiftUI

struct ProjectDetalis: View {
    
    let leads: FindList
    @State private var isEditViewActive = false
    @State private var image: Image? = Image("Camera")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var shouldPresentCamera = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(spacing: 0) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .frame(height: 98, alignment: .center)
                            VStack {
                                HStack {
                                    Text(leads.listName).font(.headline)
                                        .lineSpacing(2)
                                    Spacer()
                                    HStack {
                                        NavigationLink("", destination: Project(name: leads.listName, street: leads.street).navigationBarHidden(true), isActive: $isEditViewActive)
                                        
                                        Button {
                                            print("Edit")
                                            isEditViewActive.toggle()
                                        } label: {
                                            Image("Edit")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                        }
                                        
                                        Button {
                                            print("Trash")
                                        } label: {
                                            Image(systemName: "trash")
                                                .resizable()
                                                .foregroundColor(.red)
                                                .frame(width: 20, height: 20)
                                        }
                                    }.offset(y: 13)
                                }
                                HStack {
                                    Image(leads.listImgCircle)
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    Text(leads.street).font(.footnote).foregroundColor(.gray)
                                    Spacer()
                                }
                            }.padding(.all, 12)
                            
                        }.padding()
                        ZStack {
                            Rectangle()
                                .frame(height: 100, alignment: .center)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            HStack(alignment: .center) {
                                Spacer()
                                NavigationLink(destination: ProjectImage().navigationBarHidden(true)) {
                                    if let image = Image(leads.listImgName) {
                                        image.resizable()
                                            .frame(width: 90, height: 90)
                                    } else {
                                        Image("IC_Find4")
                                            .resizable()
                                            .frame(width: 90, height: 90)
                                    }
                                }
                                Spacer()
                            }
                        }.padding()
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .frame(height: 89)
                            VStack(alignment: .leading) {
                                NavigationLink {
                                    Status().navigationBarHidden(true)
                                } label: {
                                    Text("Client: John Smith").foregroundColor(.black)
                                    Spacer()
                                    Image("MyTask")
                                }
                                HStack {
                                    Spacer()
                                    Rectangle()
                                        .frame(height: 1.5).foregroundColor(Color(red: 233/255, green: 236/255, blue: 238/255))
                                }
                                HStack {
                                    Rectangle()
                                        .frame(width: 10, height: 10)
                                        .cornerRadius(2)
                                        .foregroundColor(.green)
                                    NavigationLink {
                                        Status()
                                            .navigationBarHidden(true)
                                    } label: {
                                        Text("Status: Job").foregroundColor(.black)
                                        Spacer()
                                        Image("MyTask")
                                    }
                                }
                            }.padding(.all, 12)
                        }.padding()
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .frame(height: 410)
                            VStack(alignment: .leading, spacing: 28) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Description").font(.system(size: 15))
                                        NavigationLink {
                                            Description().navigationBarHidden(true)
                                        } label: {
                                            Label("Description", systemImage: "plus")
                                        }.foregroundColor(.gray)
                                            .buttonStyle(PlainButtonStyle())
                                    }
                                    Spacer()
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Notes").font(.system(size: 15))
                                    NavigationLink {
                                        NewNotes().navigationBarHidden(true)
                                    } label: {
                                        Label("Notes", systemImage: "plus")
                                    }.foregroundColor(.gray)
                                        .buttonStyle(PlainButtonStyle())
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Appointement").font(.system(size: 15))
                                    NavigationLink {
                                        NewAppointement().navigationBarHidden(true)
                                    } label: {
                                        Label("Appointement", systemImage: "plus")
                                    }.foregroundColor(.gray)
                                        .buttonStyle(PlainButtonStyle())
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Task").font(.system(size: 15))
                                    NavigationLink {
                                        NewTask().navigationBarHidden(true)
                                    } label: {
                                        Label("Task", systemImage: "plus")
                                    }.foregroundColor(.gray)
                                        .buttonStyle(PlainButtonStyle())
                                }
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Images").font(.system(size: 15))
                                    image!
                                        .resizable()
                                        .cornerRadius(8)
                                        .frame(width: 64, height: 64)
                                        .aspectRatio(contentMode: .fill)
                                        .onTapGesture { self.shouldPresentActionScheet = true }
                                        .sheet(isPresented: $shouldPresentImagePicker) {
                                            ImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
                                        }.actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
                                            ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your Image."), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                                                self.shouldPresentImagePicker = true
                                                self.shouldPresentCamera = true
                                            }), ActionSheet.Button.default(Text("Photo Libary"), action: {
                                                self.shouldPresentImagePicker = true
                                                self.shouldPresentCamera = false
                                            }), ActionSheet.Button.cancel()])
                                        }
                                }
                            }.padding(.all, 12)
                        }.padding()
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    .background(Color(red: 240/255, green: 241/255, blue: 246/255))
                    .buttonStyle(.borderless)
                }
                .navigationBarTitle("Project Detalis", displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("Back")
                        }
                    }
                }
            }
            .background(Color(red: 240/255, green: 241/255, blue: 246/255))
    }
    private func dismiss() {
         presentationMode.wrappedValue.dismiss()
     }
}

struct ProjectDetalis_Previews: PreviewProvider {
    static var previews: some View {
        ProjectDetalis(leads: FindList(id: 0, listImgName: "", listName: "", listImgCircle: "", street: ""))
    }
}
