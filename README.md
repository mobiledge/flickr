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

These screenshots show the Search Grid View and Detail View of the application.

| Grid View | Detail View |
| -------- | ------- |
| <img width="565" alt="Screenshot 2024-02-20 at 10 57 00 PM" src="https://github.com/mobiledge/flickr/assets/6307250/02f06c0d-af22-4b5b-94e5-34c4a972f67c"> | <img width="565" alt="Screenshot 2024-02-20 at 10 58 02 PM" src="https://github.com/mobiledge/flickr/assets/6307250/2ccc6ce8-4cb9-48e7-a3a5-888803db2b4c"> |

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

### Landscape Mode

The grid view's column count is adjusted in response to changes in device orientation. When the device transitions between portrait and landscape modes, the application dynamically updates the columns to either 3 or 2, ensuring usability in both orientations.

| Portrait Mode                                | Landscape Mode                                |
| -------------------------------------------- | --------------------------------------------- |
| <img width="565" alt="Screenshot 2024-02-20 at 10 44 37 PM" src="https://github.com/mobiledge/flickr/assets/6307250/40b6a31c-8aa0-43a7-a2d0-f8978f215f3f"> | <img width="1006" alt="Screenshot 2024-02-20 at 10 43 49 PM" src="https://github.com/mobiledge/flickr/assets/6307250/10ae3b13-801c-485e-9315-b1e20f5bcfcc"> |




### Technologies Used

- Swift
- SwiftUI
- async/await

**HTML Content Rendering**

The app utilizes the [RichText](https://github.com/NuPlay/RichText) third-party framework to display HTML content within Flickr image descriptions. 

### Installation

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the app on your iOS device or simulator.

### TODO
- [x] Display a progress indicator when loading without blocking the UI
- [x] Support displaying error states
- [x] Display formatted published date
- [x] Support Dynamic Type & Dark Mode
- [x] Acessibility support (for Images)
- [x] Support landscape orientations 
- [ ] Additional Unit tests & UI tests
- [ ] and more...

### Contributions

Contributions are welcome! Feel free to submit bug reports, feature requests, or pull requests.

### License

This project is licensed under the MIT License - see the [LICENSE](/LICENSE) file for details.
