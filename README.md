# ex1

Introduction

Gadget Mart is a simple and interactive shopping application built using Flutter and Dart. It allows users to browse a collection of electronic gadgets and add selected items to a virtual shopping cart. The app is designed without any database or external storage instead, it uses a simple Dart list to manage the catalog and shopping cart state.
The main screen displays a grid of gadgets such as USB drives, smartphones, laptops, and Bluetooth speakers. Each gadget is represented with an image, name, and price. Users can add items to their cart using the “Add to Cart” button. The cart section, shown at the bottom of the screen, dynamically displays the number of items added and the total price. A “Clear” button is also provided to reset the cart.
This app uses responsive design principles to adapt the layout based on screen size:
•	2 columns on small screens
•	3 columns on medium-sized screens
•	4 columns on large screens
The application runs smoothly on both Android (mobile) and Chrome (web), maintaining the same functionalities and consistent UI across platforms. The user interface is styled with a dark theme and modern card-based layout to enhance the visual appeal.
This project demonstrates the use of:
•	Stateful widgets (StatefulWidget)
•	Basic state management using setState()
•	GridView for dynamic layouts
•	Local image assets
•	Theming and custom styling
Gadget Mart fulfills the goals of the exercise by providing a working prototype of a mobile shop interface with clear structure, responsiveness, and user interaction, without relying on advanced tools or persistent storage.
Technologies Used

•	Flutter SDK (Latest stable version)
•	Dart
•	Android Studio / VS Code
•	Image Assets (PNG)
•	LayoutBuilder and GridView for responsiveness
•	Standard Dart List for item and cart management
Requirements	
	System Requirements
•	Flutter SDK (3.x or later recommended)
•	Dart SDK
•	IDE: Android Studio / VS Code
•	Android/iOS Emulator or real device

	Dependencies
 

	Assets
Make sure these image assets are placed under the assets/ directory and declared in pubspec.yaml:

 

Functionalities Implemented

•	Product Grid View: Display of multiple gadgets using a responsive GridView.

•	Add to Cart: Each product has a button to add it to the cart.

•	Shopping Cart Summary: Total items and price are updated in real-time.

•	Clear Cart Button: Users can clear all selected items.

•	Responsive Design: The number of columns adjusts (2, 3, or 4) based on screen size.

•	Dark Mode Theme: Modern UI with consistent styling.

•	Asset Handling: Gadget images are loaded from the assets/ folder.

Application Logic

Core Components
•	Gadget: A simple class representing each product (name, image, price)
•	HomePage: Main screen with GridView of products and cart summary
•	cart: A dynamic list that stores added Gadget instances
•	total: Getter method that sums up gadget prices in the cart
•	addToCart and clearCart: State-altering methods to manage cart contents
•	LayoutBuilder: Determines how many grid columns to display based on screen width.
Code Overview (main.dart)
Main Widgets
•	MyApp:
Root of the application. Sets the dark theme and launches the HomePage.
•	HomePage:
The primary screen showing a grid of gadget items. Includes functionality to add items to a cart and view a summary bar at the bottom.


Responsive Design

 


User Experience Flow

1.	Launch app → Displays product grid in dark-themed layout.
2.	Click "Add to Cart" → Adds selected gadget to the cart.
3.	Cart summary bar updates → Reflects current item count and total.
4.	Press "Clear" → Empties the cart instantly.
Screenshots

        



 
