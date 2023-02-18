//
//  Parsing.swift
//  NaviSwiftUI
//
//  Created by Amit Kumar on 26/01/23.
//

import Foundation


import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, GithubError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}

