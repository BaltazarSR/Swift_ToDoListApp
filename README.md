# ToDoApp - SwiftUI Learning Project

A fully functional To-Do list application built with SwiftUI as a learning project, demonstrating modern iOS development patterns and best practices.

## 📱 Project Overview

This is a native iOS application that allows users to create, manage, and track their to-do items with due dates. The app includes user profile management and persistent data storage.

## ✨ Features

- ✅ Create new to-do items with title, description, and due date
- ✅ Mark tasks as complete/incomplete
- ✅ Delete to-do items with confirmation
- ✅ Visual overdue indicator (red text for past-due items)
- ✅ User profile management
- ✅ Persistent data storage using JSON
- ✅ Clean, modern UI with tab-based navigation

## 🏗️ Architecture

### Project Structure

```
ToDoApp/
├── ToDoAppApp.swift          # App entry point
├── ContentView.swift          # Main view with TabView navigation
├── Models/
│   └── ToDoList.swift        # Data model and business logic
└── Views/
    ├── ToDoView.swift        # List of all to-dos
    ├── AddToDoView.swift     # Form to create new to-dos
    ├── ToDoDetail.swift      # Detail view for individual to-do
    ├── UserView.swift        # User profile display
    └── ChangeUserView.swift  # User profile editing
```

### Key Components

#### Models
- **`ToDo`**: Codable struct representing a single to-do item
  - Properties: id (UUID), title, description, dueDate, isCompleted
- **`ToDoList`**: ObservableObject class managing the entire to-do collection
  - Handles CRUD operations
  - Manages JSON persistence
  - Uses Combine for reactive updates

#### Views
- **Tab-based navigation** with three sections:
  1. To-Do List view
  2. Add new To-Do
  3. User Profile

## 🎓 Key Learning Outcomes

### 1. **SwiftUI Fundamentals**
- Built complex UIs using declarative syntax
- Understood the view lifecycle and body property
- Used common UI components: `VStack`, `HStack`, `ScrollView`, `NavigationStack`
- Implemented custom views (`ToDoBanner`) for reusability

### 2. **State Management**
- **`@State`**: Local view state (title, description, dueDate, selectedToDo)
- **`@StateObject`**: Lifecycle-managed observable object (toDoList in App)
- **`@EnvironmentObject`**: Dependency injection for shared state across views
- **`@Binding`**: Two-way data binding (ToDoDetail editing)
- **`@AppStorage`**: Persistent key-value storage (user profile data)

### 3. **Data Persistence**
- Implemented JSON encoding/decoding with `Codable`
- Used `FileManager` to save/load data from the document directory
- Automatic save on data changes using `didSet` property observer

### 4. **Navigation Patterns**
- **`TabView`**: Bottom tab navigation between main screens
- **`.sheet(item:)`**: Modal presentation for to-do details
- **`@Environment(\.dismiss)`**: Programmatic view dismissal

### 5. **Forms and User Input**
- `TextField` and `TextEditor` for text input
- `DatePicker` for date selection
- Input validation with conditional button states
- `.scrollDismissesKeyboard()` for better UX

### 6. **List Management**
- `ForEach` with Identifiable items
- Dynamic list updates with `@Published` property
- Reactive UI updates when data changes

### 7. **UI/UX Design**
- Custom styling with colors, fonts, and spacing
- Shadows and overlays for depth
- Conditional styling (red text for overdue items)
- Consistent padding and layout structure
- `.tint()` modifier for accent colors

### 8. **Date Handling**
- Working with `Date` objects
- Custom date formatting with `DateFormatter`
- Date comparison logic for overdue detection
- `Calendar.current.startOfDay()` for accurate date comparison

### 9. **Alert Dialogs**
- Confirmation alerts for destructive actions
- Alert with multiple buttons and roles

### 10. **The Combine Framework**
- Understanding `@Published` property wrapper
- Reactive programming patterns
- ObservableObject protocol

### 11. **Swift Language Features**
- Structs vs Classes
- Protocols (`Identifiable`, `Codable`)
- Optionals and optional binding
- Guard statements
- Closures (button actions, list filtering)
- Property wrappers

### 12. **Error Handling**
- Try-catch blocks for file operations
- Graceful error handling with print statements

## 🔧 Technical Highlights

### Persistence Implementation
```swift
// Automatic save when data changes
@Published var toDos: [ToDo] = [] {
    didSet { save() }
}

// JSON serialization
func save() {
    let data = try JSONEncoder().encode(toDos)
    try data.write(to: fileURL, options: [.atomic])
}
```

### Conditional Styling
```swift
.foregroundStyle(
    Calendar.current.startOfDay(for: toDo.dueDate) < 
    Calendar.current.startOfDay(for: Date()) && !toDo.isCompleted
    ? Color.red
    : Color.black
)
```

### Environment Object Pattern
```swift
// App level
@StateObject var toDoList: ToDoList = ToDoList()
ContentView().environmentObject(toDoList)

// View level
@EnvironmentObject var toDoList: ToDoList
```

## 💭 Reflections

This project provided hands-on experience with:
- The complete iOS app development workflow
- SwiftUI's declarative approach vs UIKit
- State management patterns in modern iOS apps
- Persistent storage strategies
- Common UI/UX patterns in iOS applications

