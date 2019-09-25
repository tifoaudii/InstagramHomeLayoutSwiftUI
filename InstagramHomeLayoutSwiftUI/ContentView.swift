//
//  ContentView.swift
//  FacebookLayout-SwiftUI
//
//  Created by Tifo Audi Alif Putra on 25/09/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import SwiftUI

struct Story {
    let id: Int
    let image: String
    let name: String
}

struct Feed {
    let id: Int
    let image: String
    let name: String
}

struct StoriesView: View {
    
    let stories: [Story] = [
        .init(id: 0, image: "1", name: "Viola"),
        .init(id: 1,image: "2", name: "Alicia"),
        .init(id: 2,image: "3", name: "Kristina"),
        .init(id: 3,image: "4", name: "Monica"),
        .init(id: 4,image: "5", name: "Shasha"),
        .init(id: 0, image: "1", name: "Viola"),
        .init(id: 1,image: "2", name: "Alicia"),
        .init(id: 2,image: "3", name: "Kristina"),
        .init(id: 3,image: "4", name: "Monica"),
        .init(id: 4,image: "5", name: "Shasha")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stories")
                .font(.headline)
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(stories, id: \.id) {
                        StoryView(story: $0)
                    }
                }
                
            }.frame(height: 100)
        }
    }
}

struct StoryView: View {
    
    var story: Story
    
    var body: some View {
        VStack(alignment: .center) {
            Image(story.image)
                .resizable()
                .frame(width: 60,height: 60)
                .clipShape(Circle())
            Text(story.name)
        }
    }
}

struct FeedsView: View {
    
    var feed: Feed
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderFeedsView()
            Image(feed.image)
                .resizable()
                .frame(height: 150)
                .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
            Text(feed.name)
                .padding(.top, 12)
                .lineLimit(nil)
        }
    }
}

struct HeaderFeedsView: View {
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Image("1")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 10)
                VStack(alignment: .leading) {
                    Text("Andrea")
                        .font(.headline)
                        .bold()
                    Text("Posted 8 hours ago")
                        .font(.system(size: 12))
                }
            }.padding(.bottom, 6)
        }
    }
}

struct ContentView: View {
    
    let feeds: [Feed] = [
        .init(id: 0, image: "9", name: "I just bought a macbook pro from iBox and want to developing an iOS App"),
        .init(id: 1, image: "10", name: "I just bought a macbook pro from iBox and want to developing an iOS App, I just bought a macbook pro from iBox and want to developing an iOS App"),
        .init(id: 2, image: "11", name: "I just bought a macbook pro from iBox and want to developing an iOS App"),
        .init(id: 3, image: "12", name: "I just bought a macbook pro from iBox and want to developing an iOS App"),
        .init(id: 4, image: "12", name: "I just bought a macbook pro from iBox and want to developing an iOS App"),
        .init(id: 5, image: "12", name: "I just bought a macbook pro from iBox and want to developing an iOS App")
    ]
    
    var body: some View {
        NavigationView {
            List {
                StoriesView()
                ForEach(feeds, id: \.id) {
                    FeedsView(feed: $0)
                }
            }.navigationBarTitle("Home", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


