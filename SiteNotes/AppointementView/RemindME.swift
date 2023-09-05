//
//  RemindME.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import SwiftUI

struct RemindME: View {
    
    @State var selection: String?
    
    var body: some View {
        ZStack {
            List {
                Section("Choose Preferred Event Notification") {
                    ForEach(ModelData().arrTiming, id: \.self) { timing in
                        HStack {
                            Text(timing.timing)
                            Spacer()
                            if timing.timing == selection {
                                Image("EllipseFill")
                            } else {
                                Image("Ellipse")
                            }
                        }.contentShape(Rectangle())
                            .onTapGesture {
                                self.selection = timing.timing
                            }
                    }
                }.textCase(.none)
            }
        }
    }
}

struct RemindME_Previews: PreviewProvider {
    static var previews: some View {
        RemindME()
    }
}
