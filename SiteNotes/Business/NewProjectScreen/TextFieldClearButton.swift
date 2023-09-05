import SwiftUI

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String
    
    func body(content: Content) -> some View {
        HStack {
            content
            
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image("Close")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                ) 
            }
        }
    }
}
