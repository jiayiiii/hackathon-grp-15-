import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                ZStack {
                    Color.color
                        .ignoresSafeArea()
                    VStack {
                        Text("Tik Tok Toes")
                            .font(.system(size: 45))
                            .fontWeight(.heavy)
                            .padding(.bottom, 10)
                        Text("Our team has developed a new Tic Tac Toe game different from the traditional Tic Tac Toe game!")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                            .padding()
                        Text("Unique Features:")
                            .foregroundColor(.black)
                            .padding(.top)
                            .fontWeight(.semibold)
                            .font(.system(size: 27))
                        VStack() {
                            Text("• Each player has three pieces (X, O), and after placing them, they can move the pieces to an adjacent square.")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .padding()
                        }
                        Spacer()
                        NavigationLink {
                            RomanTicTacToeView()
                        } label: {
                            Text("Start")
                                .padding()
                                .frame(maxWidth: 230)
                                .background(Color.black.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
    }
#Preview {
    ContentView()
}
