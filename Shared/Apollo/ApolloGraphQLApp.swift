import SwiftUI

@main
struct ApolloGraphQLApp: App {
    @StateObject var launchViewModel = LaunchViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(launchViewModel)
        }
    }
}
