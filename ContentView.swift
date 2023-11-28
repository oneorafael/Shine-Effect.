import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("Pic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .clipShape(.rect(cornerRadius: 15))
            }
            .navigationTitle("Shine Effect")
        }
        
    }
}

extension View {
    
}
