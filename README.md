<img src="./readme/title1.svg"/>

<br><br>

<!-- project philosophy -->
<img src="./readme/title2.svg"/>

> The Predicate Pro is a web application specifically designed for supermarkets, in order to track and evaluate customer behavior. Its primary objective is to generate accurate forecasts to get the optimal product placement on shelves, recommendations for increased stock quantities, and identification of items that require inventory reduction. Furthermore, this application gives supermarkets access to detailed monthly reports and visual graphs, allowing them to closely monitor purchase trends and assess profitability. and that will be done using machine learning and artificial intelligence.

### User Stories
- As a Supermarket owner, I want to categorize Customers so that I can filter behavior data.
- As a Supermarket owner, I want to get Seasonal Predictions so that I can plan the inventory.
- As a Store manager, I want Inventory Reduction Suggestions so that I can receive recommendations for minimizing waste and improving profit.
- As a user I want to Create a Profile so that I can save my work and data.
- As a user I want to Edit my Profile so that I can change my info.


<br><br>

<!-- Prototyping -->
<img src="./readme/title3.svg"/>

> We designed Predict Pro using wireframes and mockups, iterating on the design until we reached the ideal layout for easy navigation and a seamless user experience.

### Wireframes
| Login screen  | Register screen |  Main screen |
| ---| ---| ---|
| ![Landing](./readme/demo/Wphonesignin.png) | ![fsdaf](./readme/demo/Wphonesignup.png) | ![fsdaf](./readme/demo/Wphonedashboard.png) |

### Mockups
| Login screen  | Register screen |  Main screen |
| ---| ---| ---|
| ![Landing](./readme/demo/Login.png) | ![fsdaf](./readme/demo/Signup.png) | ![fsdaf](./readme/demo/phonedashboard.png) |

<br><br>

<!-- Implementation -->
<img src="./readme/title4.svg"/>

> Using the wireframes and mockups as a guide, we implemented the Predict Pro app with the following features:

### User Screens (Mobile)
| Login screen  | Register screen | Landing screen | Loading screen |
| ---| ---| ---| ---|
| ![Landing](./readme/demo/Rloginpage.jpg) | ![fsdaf](./readme/demo/RregisterScreen.jpg) | ![fsdaf](./readme/demo/Rlandingpage.jpg) | ![fsdaf](./readme/demo/Rloginpage.jpg) |
| Home screen  | Menu Screen | Order Screen | Checkout Screen |
| ![Landing](https://placehold.co/900x1600) | ![fsdaf](https://placehold.co/900x1600) | ![fsdaf](https://placehold.co/900x1600) | ![fsdaf](https://placehold.co/900x1600) |



<br><br>

<!-- Tech stack -->
<img src="./readme/title5.svg"/>

###  Predict Pro is built using the following technologies:

- This project uses the [Flutter app development framework](https://flutter.dev/). Flutter is a cross-platform hybrid app development platform which allows us to use a single codebase for apps on mobile, desktop, and the web.
- For persistent storage (database), the app uses the [Hive](https://hivedb.dev/) package which allows the app to create a custom storage schema and save it to a local database.
- To send local push notifications, the app uses the [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) package which supports Android, iOS, and macOS.
  - 🚨 Currently, notifications aren't working on macOS. This is a known issue that we are working to resolve!
- The app uses the font ["Work Sans"](https://fonts.google.com/specimen/Work+Sans) as its main font, and the design of the app adheres to the material design guidelines.

<br><br>

<!-- How to run -->
<img src="./readme/title6.svg"/>

> To set up Coffee Express locally, follow these steps:

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.
* npm
  ```sh
  npm install npm@latest -g
  ```

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services._

1. Get a free API Key at [https://example.com](https://example.com)
2. Clone the repo
   ```sh
   git clone https://github.com/your_username_/Project-Name.git
   ```
3. Install NPM packages
   ```sh
   npm install
   ```
4. Enter your API in `config.js`
   ```js
   const API_KEY = 'ENTER YOUR API';
   ```

Now, you should be able to run Coffee Express locally and explore its features.
