import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.color
                    .ignoresSafeArea()
                VStack {
                    Text("tik tok toes")
                        .font(.system(size:36))
                        .fontWeight(.heavy)
                    NavigationLink {
                        GameView()
                    } label: {
                        Text("start")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                }
        }
        }
    }
}

#Preview {
    ContentView()
}
