//
//  ViewExtension.swift
//  SiteNotes
//
//  Created by MacOS on 29/08/2023.
//

import Foundation
import SwiftUI
import UIKit


extension View {
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
