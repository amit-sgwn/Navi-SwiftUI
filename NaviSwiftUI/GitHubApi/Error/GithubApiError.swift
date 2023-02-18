//
//  GithubApiError.swift
//  NaviSwiftUI
//
//  Created by Amit Kumar on 26/01/23.
//

import Foundation

enum GithubError: Error {
  case parsing(description: String)
  case network(description: String)
}
