import SwiftUI

enum Player {
    case x, o
}

struct ContentView: View {
    @State private var board: [[Player?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    @State private var currentPlayer: Player = .x
    @State private var winner: Player? = nil

    var body: some View {
        VStack {
            Text("Current Player: \(currentPlayer == .x ? "X" : "O")")
                .font(.largeTitle)
                .padding()

            VStack {
                ForEach(0..<3) { row in
                    HStack {
                        ForEach(0..<3) { col in
                            Button(action: {
                                makeMove(row: row, col: col)
                            }) {
                                Text(board[row][col]?.description ?? "")
                                    .frame(width: 100, height: 100)
                                    .background(Color.gray)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                            .disabled(board[row][col] != nil || winner != nil) // Disable button if cell is occupied or game is over
                        }
                    }
                }
            }
            .padding()

            if let winner = winner {
                Text("Winner: \(winner == .x ? "X" : "O")")
                    .font(.title)
                    .padding()
            }

            Button("Reset Game") {
                resetGame()
            }
            .padding()
        }
        .padding()
    }

    private func resetGame() {
        board = Array(repeating: Array(repeating: nil, count: 3), count: 3)
        currentPlayer = .x
        winner = nil
    }

    private func makeMove(row: Int, col: Int) {
        guard board[row][col] == nil && winner == nil else { return }
        board[row][col] = currentPlayer
        checkWinner()
        currentPlayer = (currentPlayer == .x) ? .o : .x
    }

    private func checkWinner() {
        // Check rows
        for i in 0..<3 {
            if let player = board[i][0], board[i][1] == player, board[i][2] == player {
                winner = player
                return
            }
        }
        // Check columns
        for i in 0..<3 {
            if let player = board[0][i], board[1][i] == player, board[2][i] == player {
                winner = player
                return
            }
        }
        // Check diagonals
        if let player = board[0][0], board[1][1] == player, board[2][2] == player {
            winner = player
            return
        }
        if let player = board[0][2], board[1][1] == player, board[2][0] == player {
            winner = player
            return
        }
    }
}

extension Player {
    var description: String {
        switch self {
        case .x:
            return "X"
        case .o:
            return "O"
        }
    }
}

#Preview {
    ContentView()
}
