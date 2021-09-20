import SwiftUI

struct ContentView: View {
    @EnvironmentObject var launchViewModel: LaunchViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if launchViewModel.launches.isEmpty {
                Text("Fetching content...")
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(launchViewModel.launches) { launch in
                            LaunchCard(launch: launch)
                        }
                    }
                }
            }
        }.firstAppear {
            launchViewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchViewModel())
    }
}
