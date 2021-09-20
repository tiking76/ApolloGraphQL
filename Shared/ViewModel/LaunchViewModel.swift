import Foundation

final class LaunchViewModel: ObservableObject {
    @Published var launches: [Launches.Launch] = []
    
    func fetch() {
        Network.shared.apollo.fetch(query: LaunchListQuery()) { result in 
          switch result {
          case let .success(graphQLResult):
            if let launches = graphQLResult.data?.launches {
                self.launches = self.process(data: launches)
            } else if let errors = graphQLResult.errors {
                print("GraphQL errors \(errors)")
            }
          case let .failure(error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
    private func process(data: LaunchData) -> [Launches.Launch] {
        return Launches(data).launches
    }
    
}
