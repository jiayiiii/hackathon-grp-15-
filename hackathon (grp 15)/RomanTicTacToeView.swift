import SwiftUI

struct RomanTicTacToeView: View {
    @State private var board: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @State private var currentPlayer: String = "X"
    @State private var playerPiecesCount: [String: Int] = ["X": 0, "O": 0]
    @State private var selectedPiece: (Int, Int)? = nil
    @State private var winner: String? = nil

    var body: some View {
        ZStack {
            Color.color
                .ignoresSafeArea()
            VStack {
                Text("Tic Tac Toe")
                    .font(.largeTitle)
                    .padding()
                    .fontWeight(.heavy)

                Text(statusText)
                    .font(.title2)
                    .padding(.bottom, 20)

                boardView

                if winner != nil {
                    Button("Restart") {
                        resetGame()
                    }
                    .padding(.top, 20)
                }
            }
        }
    }

    private var boardView: some View {
        VStack {
            ForEach(0..<3) { row in
                HStack {
                    ForEach(0..<3) { column in
                        boardButton(row: row, column: column)
                    }
                }
            }
        }
    }

    private func boardButton(row: Int, column: Int) -> some View {
        Button(action: {
            handleTap(row: row, column: column)
        }) {
            Text(board[row][column])
                .font(.system(size: 60))
                .frame(width: 80, height: 80)
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected(row: row, column: column) ? Color.white : Color.clear, lineWidth: 3)
                )
        }
    }

    private var statusText: String {
        if let winner = winner {
            return "\(winner) wins!"
        } else {
            return "Current Player: \(currentPlayer)"
        }
    }

    private func isSelected(row: Int, column: Int) -> Bool {
        if let selectedPiece = selectedPiece {
            return selectedPiece == (row, column)
        }
        return false
    }

    private func handleTap(row: Int, column: Int) {
        if winner != nil { return }

        if let selectedPiece = selectedPiece {
            let (selectedRow, selectedColumn) = selectedPiece

            if selectedRow == row && selectedColumn == column {
                self.selectedPiece = nil
                return
            }

            if (row == selectedRow && abs(column - selectedColumn) == 1) || (column == selectedColumn && abs(row - selectedRow) == 1) {

                if board[row][column] == "" {
                    board[selectedRow][selectedColumn] = ""
                    board[row][column] = currentPlayer
                    self.selectedPiece = nil
                    checkWinCondition()
                    switchPlayer()
                }
            }
        } else if board[row][column] == currentPlayer {

            selectedPiece = (row, column)
        } else if board[row][column] == "" && playerPiecesCount[currentPlayer]! < 3 {

            board[row][column] = currentPlayer
            playerPiecesCount[currentPlayer]! += 1
            checkWinCondition()
            switchPlayer()
        }
    }

    private func checkWinCondition() {

        for i in 0..<3 {
            if board[i][0] == currentPlayer && board[i][1] == currentPlayer && board[i][2] == currentPlayer ||
                board[0][i] == currentPlayer && board[1][i] == currentPlayer && board[2][i] == currentPlayer {
                winner = currentPlayer
                return
            }
        }

        if board[0][0] == currentPlayer && board[1][1] == currentPlayer && board[2][2] == currentPlayer ||
            board[0][2] == currentPlayer && board[1][1] == currentPlayer && board[2][0] == currentPlayer {
            winner = currentPlayer
        }
    }

    private func switchPlayer() {
        currentPlayer = (currentPlayer == "X") ? "O" : "X"
    }

    private func resetGame() {
        board = Array(repeating: Array(repeating: "", count: 3), count: 3)
        currentPlayer = "X"
        playerPiecesCount = ["X": 0, "O": 0]
        selectedPiece = nil
        winner = nil
    }
}

struct RomanTicTacToeView_Previews: PreviewProvider {
    static var previews: some View {
        RomanTicTacToeView()
    }
}
