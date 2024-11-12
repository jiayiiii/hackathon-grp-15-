import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.color
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    Text("Tik Tok Toes")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .padding(.bottom, 10)

                    Text("Our team has developed a new Tic Tac Toe game different from the traditional Tic Tac Toe game!")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .padding()

                    Text("Unique Features:")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.top)

                    VStack() {
                        Text("• Each player has three pieces (X, O), and after placing them, they can move them around.")
                        Text("• 50/50 chance to get a perk, such as an extra turn or a skip turn.")
                    }
                    Spacer()
                    NavigationLink {
                        GameView()
                    } label: {
                        Text("Start")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(10)
                    }
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
