import SwiftUI

struct ContentView: View {
    // Properties
    @State private var shine = false
    var body: some View {
        NavigationStack {
            VStack {
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .shine(toggle: shine, duration: 0.5, clipShape: .rect(cornerRadius: 15))
                    .onTapGesture(perform: {
                        shine.toggle()
                    })
                    
            }
            .navigationTitle("Shine Effect")
        }
        
    }
}

extension View {
    @ViewBuilder
    func shine(toggle:Bool, duration:CGFloat = 0.5, clipShape: some Shape = .rect) -> some View {
        self 
            .overlay {
                GeometryReader {
                    let size = $0.size
                    let moddedDuration = max(0.3, duration)
                    Rectangle()
                        .fill(.linearGradient(colors: [
                            .clear,
                            .clear,
                            .white.opacity(0.1),
                            .white.opacity(0.5),
                            .white.opacity(1),
                            .white.opacity(0.5),
                            .white.opacity(0.1),
                            .clear,
                            .clear
                        ], 
                      startPoint: .leading, 
                      endPoint: .trailing))
                        .scaleEffect(y:8)
                        .keyframeAnimator(initialValue: 0.0, trigger: toggle, content: { content, progress in
                            content
                                .offset(x: -size.width + (progress * ( size.width * 2)))
                        }, keyframes: { _ in
                            CubicKeyframe(.zero, duration: 0.3)
                            CubicKeyframe(1, duration: moddedDuration)
                        })
                        .rotationEffect(.init(degrees: 45))
                }
            }
            .clipShape(clipShape)
    }
}
