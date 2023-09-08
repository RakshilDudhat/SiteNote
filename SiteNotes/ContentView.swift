//
//  ContentView.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var selection: tab = .Home

    enum tab {
        case Home
        case Find
        case Setting
        case Contacts
    }
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        
        TabView(selection: $selection){
            //MARK: - Home Tab
            Home(text: "")
                .tabItem({
                    Label("Home", systemImage: "house")
                })
                .tag(tab.Home)
            FindScreen(text: "")
                .tabItem({
                    Label("Find", systemImage: "magnifyingglass")
                })
                .tag(tab.Setting)
            //MARK: - Setting Tab
            Settings()
                .tabItem({
                    Label("Setting", systemImage: "gear")
                })
                .tag(tab.Setting)
            //MARK: - Contanct Tab
            Contacts()
                .tabItem({
                    Label("Contacts", systemImage: "person.crop.square")
                })
                .tag(tab.Contacts)
        }
        
        
        .onAppear {
            print("Main View")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
