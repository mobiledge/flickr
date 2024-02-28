import XCTest
@testable import FlickrClient

import Foundation

class APITests: XCTestCase {
    var api: API!

    override func setUp() {
        super.setUp()
        api = API(session: API.Session(dispatcher: dispatch(request:)))
    }

    override func tearDown() {
        api = nil
        super.tearDown()
    }

    var dispatchData: Data!
    func dispatch(request: URLRequest) async throws -> (Data, URLResponse) {
        (dispatchData, URLResponse())
    }

    func testSearchImages() async throws {
        // Given
        let url = Bundle.main.url(forResource: "testData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        dispatchData = data

        // When
        let images = try await api.searchImages(tag: "")

        // Then
        XCTAssertEqual(images.count, 20)
    }

    func testSearchImagesEmpty() async throws {
        // Given
        let empty = """
{
    "title": "Recent Uploads tagged porcupine",
    "link": "https://www.flickr.com/photos/tags/porcupine/",
    "description": "",
    "modified": "2024-02-19T16:26:04Z",
    "generator": "https://www.flickr.com",
    "items": []
}
"""
        dispatchData = empty.data(using: .utf8)

        // When
        let images = try await api.searchImages(tag: "")

        // Then
        XCTAssertEqual(images.count, 0)
    }
}
