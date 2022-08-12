# Project Title

iOS-stockapp


# Contents Of This File

* Introduction

* Installation

* Features

* App UI

* Architecture

# Introduction

A sample project demonstrating the modern approach to building iOS apps using SwiftUI, Use the iOS-stockapp to track market activity, view the performance of stocks you follow, and get the latest Top news.

# Installation

Below is an example of how you can instruct your audience on installing and setting up your app. This template doesn't rely on any external dependencies or services.

1. Clone the repo

   ```sh

   https://github.com/RxMobile-Dummy/iOS-stockapp.git

   ```

2. Install packages

   ```sh

   pod install

   ```
# Features

- Splash screen

  - We have used stocks application's logo in splash screen to make it better.

- Quotes Screen

  - Add the stocks you follow to your watchlist to quickly view price, daily price and percentage changes, and market capitalization values.
  - In the search field, enter a company name and get search results.
  - Tap on Add Button and add new stocks into your watchlist.

- Top News Screen

  - Swipe up on Top News or Top Stories to view stories that highlight the current news driving the market.
  - Tap on particular news story and you will navigate to webBrowser.
 
- Search Screen

  - Add stock name into search field and click on done button we will get search results.
  - Tap on + button and add single stock into your watchlist.

# App UI

This app only works on iOS 13.0+
||||
|:--:|:--:|:--:|
|![Splash](https://user-images.githubusercontent.com/88186302/183576650-40f67c40-0479-4c7a-9cae-5969655d63ae.PNG)|![Quotes](https://user-images.githubusercontent.com/88186302/183376222-0207abc5-1e61-46b8-b9c3-dd4911c62681.PNG)|![TopNews](https://user-images.githubusercontent.com/88186302/183376274-25833377-d6f5-4ea5-8fc6-6dcb5d717576.PNG)
|![SearchScreen](https://user-images.githubusercontent.com/88186302/183577347-b49047cd-1019-4d0b-8911-c8b82ebb8805.PNG)|![SelectedSearchScreen](https://user-images.githubusercontent.com/88186302/183577544-a1d036bb-83c9-433c-9586-a342e800e552.PNG)|![SearchResult](https://user-images.githubusercontent.com/88186302/183577758-5ce8e145-1aeb-4511-91e8-0b04e0d957d5.PNG)

# Architecture

MVVM (Model-View-ViewModel) is derived from MVC(Model-View-Controller). It is introduced to solve existing problems of Cocoa's MVC architecture in iOS world. One of its feature is to make a better seperation of concerns so that it is easier to maintain and extend.

* Model: It is simillar to model layer in MVC (contains data business logic)
* View: UIViews + UIViewControllers (We treat both layout view and controllers as View)
* ViewModel: A mediator to glue two above layer together.

An important point in MVVM is that it uses a binder as communication tool between View and ViewModel layers. A technique named Data Binding is used.

![0_inCqLix0iJSg4Nj7](https://user-images.githubusercontent.com/68641766/181692402-495863ea-8743-4f1c-abb8-2ad0d4bfcc6a.png)
