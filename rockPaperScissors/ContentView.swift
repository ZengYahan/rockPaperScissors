import SwiftUI

struct ContentView: View {
    @State var gameResult = "開始"
    @State var pcPlayer: String = ""
    @State var player: String = ""
    @State var index: Int = 0
    
    
    let moves = ["scissors", "stone", "paper"]
    
    func play() {
        index = Int.random(in: 0...2)
        pcPlayer = moves[index]
        
        if player == pcPlayer {
            gameResult = "平手!"
        } else if player == "stone" && pcPlayer == "scissors" ||
                    player == "paper" && pcPlayer == "stone" ||
                    player == "scissors" && pcPlayer == "paper" {
            gameResult = "你贏了!"
        } else {
            gameResult = "你輸了!"
        }
    }
    
    var body: some View {
        ZStack{
            Color.yellow
                .ignoresSafeArea()
            
            VStack {
                Image(pcPlayer)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFill()
                    .rotationEffect(.degrees(180))
                
                Text("pcPlayer： \(pcPlayer)")
                    .font(.headline)
                    .padding()
                
                Spacer()
                
                Text(gameResult)
                    .font(.title)
                    .bold()
                    .foregroundColor(.red)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        player = "scissors"
                        play()
                    }) {
                        MoveImage(name: "scissors", isSelected: player == "scissors")
                    }
                    
                    Button(action: {
                        player = "stone"
                        play()
                    }) {
                        MoveImage(name: "stone", isSelected: player == "stone")
                    }
                    
                    Button(action: {
                        player = "paper"
                        play()
                    }) {
                        MoveImage(name: "paper", isSelected: player == "paper")
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct MoveImage: View {
    let name: String
    let isSelected: Bool
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 200)
            .background(isSelected ? Color.blue : Color.clear)
    }
}
