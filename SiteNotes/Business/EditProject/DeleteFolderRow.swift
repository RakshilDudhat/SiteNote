//
//  DeleteFolderRow.swift
//  SiteNotes
//
//  Created by MacOS on 28/08/2023.
//

import SwiftUI

struct DeleteFolderRow: View {
    var body: some View {
        HStack {
            Text("Delete Folder")
            Spacer()
            Button {
                print("Delete")
            } label: {
                Label("Delete", systemImage: "trash")
                    .labelStyle(.iconOnly)
                    .foregroundColor(.red)
            }
        }.listRowSeparator(.hidden)
    }
}

struct DeleteFolderRow_Previews: PreviewProvider {
    static var previews: some View {
        DeleteFolderRow()
    }
}
