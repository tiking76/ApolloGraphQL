import SwiftUI

struct FirstAppear: ViewModifier {
    @State private var status = true
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content.onAppear(perform: {
            defer {
                status = false
            }
            if status {
                action()
            }
        })
    }
}

extension View {
    func firstAppear(perform action: @escaping () -> Void) -> some View {
        modifier(FirstAppear(action: action))
    }
}
