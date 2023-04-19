import SwiftUI
@available(iOS 16.0, *)
@main
struct MyApp: App {
    @StateObject var gameState = GameState()
    
    var body: some Scene {
        WindowGroup {
            InfoView()
                .environmentObject(gameState)
        }
    }
}
