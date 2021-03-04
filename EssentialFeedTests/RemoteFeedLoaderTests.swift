//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Abdullah Ansari on 04/03/21.
//

import XCTest

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoader {
    
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        XCTAssertNil(client.requestedURL)
    }

}
