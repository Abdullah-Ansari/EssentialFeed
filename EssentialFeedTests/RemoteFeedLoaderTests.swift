//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Abdullah Ansari on 04/03/21.
//

import XCTest

class RemoteFeedLoader {
    
    let client: HTTPClient
    let url: URL
    init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    func load() {
        client.get(from: url)
    }
}

class HTTPClient {
    func get(from url: URL) {}
}



class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        //ACT
        let (_, client) = makeSUT()
        //Arrange
        //Assert
        XCTAssertNil(client.requestedURL)
    }
    
    
    func test_load_requestDataFromURL() {
        //ACT
        let url = URL(string: "https://a-given-url.com")!
        let (sut,client) = makeSUT(url:url)
        //Arrange
        sut.load()
        //Assert
        XCTAssertEqual(client.requestedURL,url)
    }
    
    //MARK:- Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        override func get(from url: URL) {
            requestedURL = url
        }
    }

}
