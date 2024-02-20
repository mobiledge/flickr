## Flickr Image Search App

This iOS application allows users to search for images on Flickr and view them in a grid layout. Users can enter search terms in the search bar, and the app fetches images from the Flickr API based on the entered search terms.

### Features

- Search for images on Flickr using a keyword
- Display search results in a grid layout.
- View thumbnail images of search results.
- Tap on an image to view it in full size.

### API

The app uses the Flickr API to fetch images. The API endpoint used for fetching images is:

```
https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=<TAGS>
```

Replace `<TAGS>` with the search terms entered by the user.

You can learn more about the Flickr API [here](https://www.flickr.com/services/feeds/).

### Screenshots

| Screenshot 1    | Screenshot 2 |
| -------- | ------- |
| ![Simulator Screenshot - iPhone 15 - 2024-02-19 at 22 36 17](https://github.com/mobiledge/flickr/assets/6307250/b4c640ce-1b64-41e7-8475-9a242a645dc1) | ![Simulator Screenshot - iPhone 15 - 2024-02-19 at 22 36 34](https://github.com/mobiledge/flickr/assets/6307250/97ad8c49-2af7-4003-9e68-e2ff9f19e431) |

### Technologies Used

- Swift
- SwiftUI
- async/await

### Installation

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the app on your iOS device or simulator.

### TODO
- [ ] Support multiple tags
- [ ] Format pubilished date
- [ ] Acessibility support
- [ ] Additional Unit tests & UI tests
- [ ] and more...

### Contributions

Contributions are welcome! Feel free to submit bug reports, feature requests, or pull requests.

### License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.
