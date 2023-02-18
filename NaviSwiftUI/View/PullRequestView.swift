//
//  PullRequestView.swift
//  NaviSwiftUI
//
//  Created by Amit Kumar on 26/01/23.
//

import SwiftUI

struct PullRequestView: View {
    @ObservedObject var viewModel: PullRequestViewModel

    init(viewModel: PullRequestViewModel) {
      self.viewModel = viewModel
    }

    var body: some View {
        VStack(content: content)
          .onAppear(perform: viewModel.refresh)
          .navigationBarTitle("List")
          .listStyle(GroupedListStyle())
    }
}

 
private extension PullRequestView {
    func content() -> some View {
        if viewModel.dataSource.count > 0 {
        return AnyView(details(for: viewModel))
      } else {
        return AnyView(loading)
      }
    }

    func details(for viewModel: PullRequestViewModel) -> some View {
        List(viewModel.dataSource) { element in
            PullRequestRow(element: element)
        }
    }

    var loading: some View {
      Text("Loading pull request...")
        .foregroundColor(.gray)
    }
}



