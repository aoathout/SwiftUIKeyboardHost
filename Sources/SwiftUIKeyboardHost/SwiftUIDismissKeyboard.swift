import SwiftUI

@available(iOS 13.0, tvOS 13.0, *)
@available(OSX, unavailable)
@available(watchOS, unavailable)
public struct SwiftUIDismissKeyboard: UIViewRepresentable {
    
    public init() {
        
    }
    
    public func makeUIView(context: UIViewRepresentableContext<SwiftUIDismissKeyboard>) -> UIView {
        let v = UIView(frame: .zero)
        let gesture = UITapGestureRecognizer(target: context.coordinator,
                                             action: #selector(Coordinator.tapped))
        v.addGestureRecognizer(gesture)
        return v
    }
    
    public class Coordinator: NSObject {
        
        @objc func tapped(gesture:UITapGestureRecognizer) {
            let point = gesture.location(in: gesture.view)
            let firstResponderBounds = UIResponder.getBoundsOfFirstResponder()
            if !firstResponderBounds.contains(point) {
                guard let firsResponderView = UIResponder.getFirstResponderView() else { return }
                firsResponderView.resignFirstResponder()
            }
        }
    }
    
    public func makeCoordinator() -> SwiftUIDismissKeyboard.Coordinator {
        return Coordinator()
    }
    
    public func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<SwiftUIDismissKeyboard>) {
    }
    
}
