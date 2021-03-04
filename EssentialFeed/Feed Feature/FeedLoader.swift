//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Abdullah Ansari on 04/03/21.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
