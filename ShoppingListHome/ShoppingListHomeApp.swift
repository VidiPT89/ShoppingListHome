import SwiftUI
import SwiftData

@main
struct ShoppingListHomeApp: App {
    @AppStorage("colorSchemePreference") private var colorSchemePreference: Int = 0
    @AppStorage("languagePreference") private var languagePreference: String = "pt-PT"
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplash {
                    SplashView()
                        .transition(.opacity)
                } else {
                    HomeView()
                        .transition(.opacity)
                }
            }
            .animation(.easeOut(duration: 0.35), value: showSplash)
            .environment(\.locale, Locale(identifier: languagePreference))
            .onAppear {
                applyColorScheme(colorSchemePreference)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    showSplash = false
                }
            }
            .onChange(of: colorSchemePreference) { _, v in applyColorScheme(v) }
        }
        .modelContainer(for: ShoppingItem.self)
    }

    private func applyColorScheme(_ preference: Int) {
        let style: UIUserInterfaceStyle
        switch preference {
        case 1: style = .light
        case 2: style = .dark
        default: style = .unspecified
        }
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .forEach { $0.overrideUserInterfaceStyle = style }
    }
}
