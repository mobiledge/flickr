import XCTest
@testable import FlickrClient

class TestFlickrAPI: FlickrAPI {
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
        let url = Bundle.main.url(forResource: "testData", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        api.data = data
    }

    override func tearDown() {
        api = nil
        super.tearDown()
    }

    func testSearchImages() async throws {
        let images = try await api.searchImages(tag: "")
        XCTAssertEqual(images.count, 20)
    }
}
//    func testFetchImagesWithValidTag() async throws {
//
//        api.dispatch(request:) = { req in
//
//
//        }
//
//        let validTag = "porcupine"
//        let images = try await api.fetchImages(tag: validTag)
//        XCTAssertFalse(images.isEmpty, "Images should not be empty")
//        XCTAssertEqual(images.count, 20)
//    }
//
//    func testFetchImagesWithEmptyTag() async throws {
//        let emptyTag = ""
//        let images = try await api.fetchImages(tag: emptyTag)
//        XCTAssertTrue(images.isEmpty, "Images should be empty for an empty tag")
//    }
//}
//
//class MockNetworkClient: NetworkClient {
//    override func data(from url: URL) async throws -> Data {
//        guard let url = Bundle.main.url(forResource: "testData", withExtension: "json"),
//              let data = try? Data(contentsOf: url) else {
//            throw "Failed to obtain testData!"
//        }
//        return data
//    }
//}
