//
//  NewAppointement.swift
//  SiteNotes
//
//  Created by MacOS on 02/09/2023.
//

import SwiftUI

struct NewAppointement: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var description = ""
    @State var date = ""
    @State var selectedDate: Date = Date()
    @State private var showDatePicker = false
    @State private var isDetailViewPresented = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 240/255, green: 241/255, blue: 246/255)
                Form {
                    VStack(alignment: .leading, spacing: 24) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .frame(height: 90, alignment: .center)
                            VStack(spacing: 20) {
                                TextField("Add Description", text: $description)
                                HStack {
                                    TextField("Select Date", text: $date)
                                    Spacer()
                                    Button("\(Image("Appointment"))") {
                                        showDatePicker.toggle()
                                    }.buttonStyle(.borderless)
                                }
                            }.padding(.all, 12)
                        }.background(Color.clear)
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .frame(height: 50, alignment: .center)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text("Remind Me").font(.system(size: 17))
                                    NavigationLink {
                                        RemindME().navigationBarTitle("Remind Me", displayMode: .inline)
                                    } label: {
                                        Spacer()
                                        Label("1 day before", image: "")
                                            .foregroundColor(Color.gray)
                                            .labelStyle(.titleOnly)
                                    }
                                }
                            }.padding(.all, 12)
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12))
                    .listRowBackground(Color.clear)
                }.disabled(showDatePicker)
                    .navigationBarTitle("New Appointement", displayMode: .inline)
                
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
                            .sheet(isPresented: $isDetailViewPresented) {}
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
        }.edgesIgnoringSafeArea(.all)
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct NewAppointement_Previews: PreviewProvider {
    static var previews: some View {
        NewAppointement()
    }
}
