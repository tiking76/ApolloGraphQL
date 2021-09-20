import SwiftUI

struct LaunchCard: View {
    var launch: Launches.Launch
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center, spacing: 0) {
                Text("LAUNCH ID: \(launch.id)")
                    .font(.title2)
                    .bold()
            }
            .padding(.vertical, 8)
            .padding(.bottom, 8)
         
            Text("LAUNCH SITE: \(launch.site)")
            Text("MISSION: \(launch.mission.name)")
            
            VStack(alignment: .leading, spacing: 0) {
                Text("ROCKET:")
                VStack(alignment: .leading, spacing: 0) {
                    Text("ID: \(launch.rocket.id)")
                    Text("ROCKET NAME: \(launch.rocket.name)")
                    Text("ROCKET TYPE: \(launch.rocket.type)")
                }
                .padding(.horizontal, 8)
            }
            Text("IS BOOKED: \(String(launch.isBooked))")
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.white)
        .background(Color.pink)
        .cornerRadius(30)
        .padding()
    }
}

struct LaunchCard_Previews: PreviewProvider {
    static var previews: some View {
        LaunchCard(launch: previewLaunchData)
    }
}
