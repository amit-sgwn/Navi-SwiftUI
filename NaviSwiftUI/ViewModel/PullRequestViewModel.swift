//
//  PullRequestViewModel.swift
//  NaviSwiftUI
//
//  Created by Amit Kumar on 26/01/23.
//

import SwiftUI
import Combine

class PullRequestViewModel: ObservableObject {
    @Published var dataSource: [PullElement] = []

    private let requestFetcher: PullRequestFeatchable
    private var disposables = Set<AnyCancellable>()

    
    init(requestFetcher: PullRequestFeatchable, scheduler: DispatchQueue = DispatchQueue(label: "PullRequestViewModel")) {
        
        self.requestFetcher = requestFetcher
        
    }
    
    func refresh() {
        requestFetcher.fetchPullrequest(forUrl: "").receive(on: DispatchQueue.main)
            .sink { [weak self]  value in
                guard let self = self else { return }
                print(value)
                switch value {
                case .failure:
                  self.dataSource = []
                case .finished:
                  break
                }
            } receiveValue: { [weak self] list in
                guard let self = self else { return }
                self.dataSource = list
                print(list)
            }
            .store(in: &disposables)
    }
    

}

extension PullRequestViewModel {
  var pullRequestView: some View {
    return PullRequestViewBuilder.makeCurrentPullRequestView(pullRequest: requestFetcher)
  }
}
