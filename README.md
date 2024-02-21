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

### App Loading States

The app supports multiple states to provide a dynamic and informative user experience. Here is an overview of the supported states along with screenshots for reference:

| Initial State | Loading State | Empty State | Error State | Loaded State |
|---------------|---------------|-------------|-------------|--------------|
| Presented initially when the app is launched. Encourages users to discover photos on Flickr and enter keywords for browsing. | Displayed during data retrieval or any asynchronous operation. Shows a spinner to indicate ongoing loading. | Appears when a search or request returns no results. Displays a predefined search icon to indicate an empty result set. | Shown when an error occurs during data fetching or processing. An error icon and a localized error message provide details about the issue. | Presented when the cotent loads successfully. | 
| ![1 initial -state](https://github.com/mobiledge/flickr/assets/6307250/e96a14f5-702f-4904-ad7f-ffea70ba5509) | ![2 loading-state](https://github.com/mobiledge/flickr/assets/6307250/5bbaefd3-800a-4ed4-8d76-39bb483b4980) | ![3 empty-state](https://github.com/mobiledge/flickr/assets/6307250/c818b896-5598-45ee-a2ed-2d39ae878bd2) | ![4 error-state](https://github.com/mobiledge/flickr/assets/6307250/01c19b50-958d-4e42-a21a-3a41ffdd994b) | ![00 grid-view](https://github.com/mobiledge/flickr/assets/6307250/854f59ec-2687-4d2d-adc6-fa7a436c9308) |

### Dark Mode

The app supports dark mode, providing users with a visually comfortable experience in low-light environments.

https://github.com/mobiledge/flickr/assets/6307250/d4904eea-af9a-4350-a523-bf0666278040

### Dynamic Type

The app provides support for Dynamic Type, allowing users to adjust the text size based on their accessibility preferences.

https://github.com/mobiledge/flickr/assets/6307250/dcf4169e-5c58-46ff-a006-72bddef65401






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
