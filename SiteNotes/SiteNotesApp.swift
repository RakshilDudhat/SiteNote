//
//  SiteNotesApp.swift
//  SiteNotes
//
//  Created by MacOS on 24/08/2023.
//

import SwiftUI

@main
struct SiteNotesApp: App {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(ModelData())
        }
    }
}
