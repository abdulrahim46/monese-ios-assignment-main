Monese iOS home assignment template
==========
![Platform](https://img.shields.io/badge/Platform-iOS-orange.svg)
![Languages](https://img.shields.io/badge/Language-Swift-orange.svg)
[![CI](https://github.com/abdulrahim46/monese-ios-assignment-main/actions/workflows/CI.yml/badge.svg)](https://github.com/abdulrahim46/monese-ios-assignment-main/actions/workflows/CI.yml)

## The purpose of this test

The purpose of this test is to see what is your approach to problem solving and how you conduct it.
The requirements for this test are simple so no need for elaborate solutions.
Some parts of the application are already implemented for you but feel free to improve them how you see fit.
Use `make` to generate the project file.

### Business Requirements

Implement SpaceX launches informative application:

The application should use Open Source REST API that can be found here: https://github.com/r-spacex/SpaceX-API

As a user, I want to see the list of launches, when I open the application.
- For each launch in the list, next attributes should be displayed: mission name and launch date.

As a user, I want to have the ability to refresh the list to see new launches.

As a user, I want to have possibility to filter the list and see only successful launches.
- Parameter “success” should be used for filtering data

As a user, when I press on the launch in the list I want to see the next screen with rocket description

The application should display a loading indicator when it is fetching relevant data.

### Submitting the homework

Please send us the link to your private repository with the source code.

## Installation
- open Assignment.xcodeproj. 
- Select the iphone simulator of your choice & run it. 
- Tested on iOS 14.3, iOS 14.5, iOS 15 ( iphone SE, iphone 12 pro etc), XCode 13, 12.3.

## Design Pattern: Model-View-ViewModel (MVVM)
is a structural design pattern that separates objects into three distinct groups:
- #### Models 
  - hold application data. They’re usually structs or simple classes.
- #### Views 
  - display visual elements and controls on the screen. They’re typically subclasses of UIView.
- #### View models
  - transform model information into values that can be displayed on a view. They’re usually classes, so they can be passed around as references.
  
  ## Improvements / Need to be done
  - Due to limited time constraints, wrote only few unit Tests and UI tests by using XCTest. Need to cover all unit test.
  - UI improvements for HomeView
  - Date format for the launches
  - UI Improvements for DetailView
  
  ## Technology/Tools

  - iOS 10
  - Xcode 12.3
  - Swift 5
  - UIKit
  - Github Actions CI
  - Programmaticlly UI
  - AutoLayout
  - MVVM
  - XCTestCase for unit tests and UI Tests.
  - Xcode Instruments for memory leaks and allocations.
  - Atomic git commit flow

## 📱 Screenshots

<p float="left"> 
<img src="/Documentation/sim1.png" width="200">
<img src="/Documentation/sim2.png" width="200">
<img src="/Documentation/sim3.png" width="200">
<img src="/Documentation/sim4.png" width="200">
</p>
