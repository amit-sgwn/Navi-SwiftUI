//
//  PullRequestRow.swift
//  NaviSwiftUI
//
//  Created by Amit Kumar on 26/01/23.
//

import SwiftUI
import URLImage
struct PullRequestRow: View {
    var element: PullElement
    
    init(element: PullElement) {
      self.element = element
    }
    
    var body: some View {
        VStack{
            //File -> Package -> update to latest
            HStack {
                VStack(alignment: .center) {
                    Text("Author").font(.system(size: 12, weight: .thin))
 
                        VStack(alignment: .leading) {
                            URLImage(URL(string: element.user.avatarURL)!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }.frame(width: 80,height: 80)
                                .cornerRadius(8)
                            Text(element.user.login).font(.system(size: 16, weight: .semibold))
                        }
 
                }
                 VStack(alignment: .leading, spacing: 10) {
                    Text(element.title).font(.system(size: 16, weight: .bold))
                    HStack{
                        Text("status by:").font(.system(size: 12, weight: .thin))
                        Text(element.state).font(.system(size: 12, weight: .thin))
                    }
                    HStack{
                        Text("createdAt:  \(Date.convertDateFormatter(date: element.createdAt))").font(.system(size: 12, weight: .thin))
                    }
                    
                    HStack{
                        Text("closedAt:  \(Date.convertDateFormatter(date: element.closedAt))").font(.system(size: 12, weight: .thin))
                    }
                   
                    Text("commitSHA: \(element.mergeCommitSHA)").font(.system(size: 12, weight: .thin))
                    Text("#\(element.number) merged \(Date.dateFrom(date: element.mergedAt ?? "").timeAgoDisplay()) by \(element.user.login)").font(.system(size: 12, weight: .semibold))
                }
               
               
               
            }
        }
        
    }
}
 
