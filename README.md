# Open Links - Modular macOS App

A modern, modular macOS application for opening multiple URLs at once with advanced configuration options.

## 🏗️ Architecture

The app has been completely modularized following modern SwiftUI patterns and macOS design guidelines:

### 📁 Project Structure

```
open-links/
├── Models/
│   ├── ProcessedLink.swift      # Data models for links and groups
│   └── AppSettings.swift        # Settings and preferences management
├── Services/
│   ├── LinkProcessor.swift      # URL processing and validation logic
│   └── URLService.swift         # URL opening and batch processing
├── Views/
│   ├── ConfigurationView.swift  # Settings/preferences interface
│   ├── LinkInputView.swift      # Text input and options
│   ├── ProcessedLinksView.swift # Links display (grouped/simple)
│   ├── ActionButtonsView.swift  # Action buttons (Paste, Open All, Clear)
│   └── ButtonStyles.swift       # Custom button styles
├── ContentView.swift            # Main view coordinator
└── open_linksApp.swift          # App entry point
```

## ✨ Features

### 🎨 Modern UI/UX
- **Material Design**: Uses `.regularMaterial` for modern macOS appearance
- **Responsive Layout**: Adaptive sizing with proper spacing and typography
- **Accessibility**: Full VoiceOver support and keyboard navigation
- **Animations**: Smooth transitions and micro-interactions

### ⚙️ Configuration View
- **General Settings**: Remove duplicates, group by domain, auto-open
- **Performance Settings**: Configurable open delay and batch size
- **Appearance**: Theme selection (System/Light/Dark)
- **Reset Options**: Restore default settings

### 🔧 Advanced Features
- **Batch Processing**: Configurable link opening with delays
- **Smart Grouping**: Group links by domain for better organization
- **Duplicate Removal**: Automatic duplicate detection and removal
- **Keyboard Shortcuts**: Full keyboard support (Cmd+V, Cmd+Return, Cmd+Delete, Cmd+,)
- **Settings Persistence**: User preferences saved automatically

## 🚀 Usage

### Basic Usage
1. Paste or type URLs in the text area (one per line)
2. Configure options using the gear icon (⚙️) in the top-right
3. Click "Open All" to open all valid URLs

### Keyboard Shortcuts
- `Cmd+V` - Paste from clipboard
- `Cmd+Return` - Open all links
- `Cmd+Delete` - Clear all links
- `Cmd+,` - Open settings
- `Cmd+Q` - Quit application

### Settings
- **Remove Duplicates**: Automatically remove duplicate URLs
- **Group by Domain**: Organize links by their domain
- **Auto-open Links**: Automatically open links as they're processed
- **Open Delay**: Delay between opening links (0-2 seconds)
- **Max Links per Batch**: Limit concurrent link opening (1-50)
- **Theme**: Choose between System, Light, or Dark appearance

## 🏛️ Architecture Benefits

### Separation of Concerns
- **Models**: Pure data structures with business logic
- **Services**: Reusable business logic and external integrations
- **Views**: Focused, single-responsibility UI components
- **Coordination**: Main view acts as coordinator, not business logic holder

### Maintainability
- **Modular Components**: Easy to test and modify individual pieces
- **Clear Dependencies**: Explicit dependency injection through initializers
- **Reusable Code**: Services and models can be easily reused
- **Type Safety**: Strong typing throughout the application

### Scalability
- **Easy Extension**: New features can be added as new services or views
- **Configuration**: Settings system supports adding new preferences easily
- **Testing**: Each component can be unit tested independently

## 🔧 Technical Details

### State Management
- Uses `@StateObject` and `@ObservedObject` for reactive state management
- Settings persist automatically using `UserDefaults`
- Services are injected as dependencies to maintain loose coupling

### Performance
- Lazy loading for large link lists
- Configurable batch processing to prevent system overload
- Efficient URL validation and processing

### macOS Integration
- Proper window management with quit-on-close behavior
- Native menu bar integration with keyboard shortcuts
- System appearance integration with theme support
- Accessibility compliance for screen readers

## 🎯 Future Enhancements

The modular architecture makes it easy to add:
- URL validation rules and custom schemes
- Export/import functionality for link lists
- Custom themes and appearance options
- Advanced filtering and sorting options
- Integration with other macOS apps
- Cloud sync for settings and link lists

## 📱 Requirements

- macOS 12.0+
- Xcode 14.0+
- Swift 5.7+
