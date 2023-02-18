//
//  PullRequestViewBuilder.swift
//  NaviSwiftUI
//
//  Created by Amit Kumar on 26/01/23.
//

import Foundation
import SwiftUI

enum PullRequestViewBuilder {
    static func makeCurrentPullRequestView(
      pullRequest: PullRequestFeatchable
    ) -> some View {
      let viewModel = PullRequestViewModel(requestFetcher: pullRequest)
      return PullRequestView(viewModel: viewModel)
    }
}
