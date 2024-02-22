import XCTest
@testable import FlickrClient

import Foundation

/// A testing subclass of FlickrAPI that allows controlling the returned data for testing purposes.
class TestFlickrAPI: FlickrAPI {
    /// The data that will be returned when the `dispatch` method is called.
    var data = Data()
    override func dispatch(request: URLRequest) async throws -> Data {
        return data
    }
}

class FlickrAPITests: XCTestCase {
    var api: TestFlickrAPI!

    override func setUp() {
        super.setUp()
        api = TestFlickrAPI()
    }

    override func tearDown() {
        api = nil
        super.tearDown()
    }

    func testConstructURL() {
        // Given
        let path = "/path1/path2/"
        let queryItems = [URLQueryItem(name: "queryItemName", value: "queryItemValue")]

        // When
        do {
            let url = try api.constructURL(path: path, queryItems: queryItems)

            // Then
            XCTAssertEqual(url.absoluteString, "https://www.flickr.com/path1/path2/?format=json&nojsoncallback=1&queryItemName=queryItemValue")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testSearchImages() async throws {
        // Given
        let url = Bundle.main.url(forResource: "testData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        api.data = data

        // When
        let images = try await api.searchImages(tag: "")

        // Then
        XCTAssertEqual(images.count, 20)
    }
}
