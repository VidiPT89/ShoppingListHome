# 🛒 ShoppingListHome — Your Shopping List, No Strings Attached

> A free SwiftUI shopping list app for iOS — no sign-up, no server, no account. Just open it and start adding items.

Keep track of what you need to buy without any of the usual friction. ShoppingListHome lets you add items manually or pick them straight from a built-in product catalog grouped by category, track quantity and unit, and check things off as you shop. Everything is stored locally on the device with SwiftData — there's no backend to configure, no login screen, and no internet connection required. Built entirely in SwiftUI with a clean, native iOS interface and full Portuguese/English localization.

## 📦 What's Inside

- ➕ Add items manually with name, category, quantity, and unit
- 📖 Built-in product catalog, grouped by category, with quick tap-to-add
- 🏷️ Ten shopping categories — meat & fish, vegetables & fruit, dairy, bakery, canned & dry goods, cleaning, hygiene, drinks, snacks, other
- ✅ Check items off as you shop, with a separate "in cart" section
- 🧹 Clear all checked items in one tap
- 🔍 Search the catalog by product name
- 🎨 Light, dark, and system appearance modes
- 🇬🇧🇵🇹 English and Portuguese localization
- 💾 100% offline, on-device storage via SwiftData — no account, no server, no setup
- 🚀 Animated splash screen on launch

## 🛠️ Tech Stack

![Swift](https://img.shields.io/badge/Swift-FA7343?style=flat&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-0071E3?style=flat&logo=swift&logoColor=white)
![SwiftData](https://img.shields.io/badge/SwiftData-0071E3?style=flat&logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=flat&logo=xcode&logoColor=white)
![iOS](https://img.shields.io/badge/iOS_17+-000000?style=flat&logo=apple&logoColor=white)

## 🏗️ Architecture

```
ShoppingListHome/
├── ShoppingListHomeApp.swift         # App entry point, SwiftData model container setup
├── Models/
│   ├── ShoppingItem.swift            # SwiftData model + item category definitions
│   └── CatalogData.swift             # Built-in product catalog, grouped by category
├── ViewModels/
│   └── ListViewModel.swift           # SwiftData-backed CRUD operations for list items
├── Views/
│   ├── SplashView.swift              # Animated launch screen
│   ├── HomeView.swift                # Main shopping list — categories, items, cart
│   ├── CatalogView.swift             # Browse/search the product catalog, add with quantity
│   ├── AddItemView.swift             # Manual item entry form
│   └── SettingsView.swift            # Appearance and language settings
├── en.lproj / pt-PT.lproj            # Localised strings
└── Assets.xcassets                   # App icon and accent colour
```

## 📱 Screens

| Screen | Description |
|--------|-------------|
| 🚀 **Splash** | Animated launch screen before entering the app |
| 🏠 **Home** | Shopping list split into "To buy" and "In cart", with category filter chips |
| 📖 **Catalog** | Searchable product catalog grouped by category, tap to add with quantity |
| ➕ **Add Item** | Manual form to add a custom product with category, quantity, and unit |
| ⚙️ **Settings** | Appearance (system/light/dark) and language (PT/EN) toggles |

## 🔄 How It Works

1. **Launch** — The splash screen animates in while the app initialises
2. **Model Setup** — `ShoppingListHomeApp` attaches a SwiftData `modelContainer` for `ShoppingItem`
3. **List Loading** — `HomeView` configures `ListViewModel` with the environment's `ModelContext` and fetches items sorted by creation date
4. **Adding Items** — Items are added either from the catalog (`CatalogView`) or a manual form (`AddItemView`); both insert directly into the SwiftData context
5. **State Changes** — Checking an item, deleting it, or clearing the cart mutates the model and re-fetches instantly — no network round-trip, ever
6. **Persistence** — SwiftData handles storage on-device automatically; the list survives app restarts with zero configuration

## 🚀 How to Run

```bash
# 1. Clone the repository
git clone https://github.com/VidiPT89/ShoppingListHome.git

# 2. Open in Xcode
open ShoppingListHome.xcodeproj

# 3. Select your own signing team under Signing & Capabilities
#    (the project ships with automatic signing and no team configured)

# 4. Select an iOS 17+ simulator or device

# 5. Build and run (⌘R)
```

There is no backend to configure and no API key to add — the app works immediately.

## 📝 Notes

- All data lives **only on the device** — there's no server, no account, and nothing ever leaves the phone
- SwiftData was chosen over a cloud backend specifically to make the app a true zero-setup, zero-cost experience for anyone who clones it
- The product catalog is a static, hand-picked list — no external API involved
- Because there's no login, there's also no cross-device sync — each install has its own independent list
- 🤖 Android version — planned, to be built with **Kotlin** in **Android Studio**, following the same free/offline approach

---

Developed by **David Arsénio Martins** — *"Vidi"*
