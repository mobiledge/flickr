import XCTest
@testable import FlickrClient

class FlickrAPITests: XCTestCase {

    var api: FlickrAPI!

    override func setUp() {
        super.setUp()
        let networkClient = MockNetworkClient()
        api = FlickrAPI(networkClient: networkClient)
    }

    override func tearDown() {
        api = nil
        super.tearDown()
    }

    func testFetchImagesWithValidTag() async throws {
        let validTag = "porcupine"
        let images = try await api.fetchImages(tag: validTag)
        XCTAssertFalse(images.isEmpty, "Images should not be empty")
        XCTAssertEqual(images.count, 20)
    }

    func testFetchImagesWithEmptyTag() async throws {
        let emptyTag = ""
        let images = try await api.fetchImages(tag: emptyTag)
        XCTAssertTrue(images.isEmpty, "Images should be empty for an empty tag")
    }
}

class MockNetworkClient: NetworkClient {
    override func data(from url: URL) async throws -> Data {
        guard let url = Bundle.main.url(forResource: "testData", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            throw "Failed to obtain testData!"
        }
        return data
    }
}
