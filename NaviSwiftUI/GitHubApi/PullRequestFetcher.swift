//
//  PullRequestFetcher.swift
//  NaviSwiftUI
//
//  Created by Amit Kumar on 26/01/23.
//

import Foundation
import Combine

protocol PullRequestFeatchable {
    func fetchPullrequest(forUrl url: String) -> AnyPublisher<PullList, GithubError>
}

class PullRequestFetcher {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
}


extension PullRequestFetcher: PullRequestFeatchable {
    
    func fetchPullrequest(forUrl url: String) -> AnyPublisher<PullList, GithubError> {
        return forecast(with: pullRequestUrlComponent())
    }
    
    
    private func forecast<T>(with components: URLComponents) -> AnyPublisher<T, GithubError> where T: Decodable {
        guard let url = components.url else {
            let error = GithubError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { error in
                    .network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { pair in
                decode(pair.data)
            }
            .eraseToAnyPublisher()
    }
}


private extension PullRequestFetcher {
    func pullRequestUrlComponent() -> URLComponents {
       
        var components = URLComponents(string: "https://api.github.com/repos/amit-sgwn/Movie-App/pulls")!
        components.queryItems = [
            URLQueryItem(name: "Accept", value: "application/vnd.github.v3+json"),
            URLQueryItem(name: "state", value: "closed")
      
        ]
        return components
    }
}
