import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("colorSchemePreference") private var colorSchemePreference: Int = 0
    @AppStorage("languagePreference") private var languagePreference: String = "pt-PT"

    private var localizedTitle: String {
        languagePreference == "en" ? "Settings" : "Definições"
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    appearanceCard
                    languageCard
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle(localizedTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { dismiss() } label: {
                        ZStack {
                            Circle()
                                .fill(Color(.systemGray5))
                                .frame(width: 32, height: 32)
                            Image(systemName: "xmark")
                                .font(.system(size: 12, weight: .bold))
                                .foregroundStyle(.secondary)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        // Apply locale here — propagates to all child views including the NavigationStack
        .environment(\.locale, Locale(identifier: languagePreference))
    }

    // MARK: Appearance card
    var appearanceCard: some View {
        cardSection(title: LocalizedStringKey("settings.appearance")) {
            VStack(alignment: .leading, spacing: 12) {
                Text(LocalizedStringKey("settings.theme"))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                HStack(spacing: 0) {
                    themeButton(key: "settings.theme.system", icon: "circle.lefthalf.filled", value: 0)
                    themeButton(key: "settings.theme.light",  icon: "sun.max",               value: 1)
                    themeButton(key: "settings.theme.dark",   icon: "moon.stars",            value: 2)
                }
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }

    // MARK: Language card
    var languageCard: some View {
        cardSection(title: LocalizedStringKey("settings.language")) {
            HStack(spacing: 0) {
                langButton(label: "🇵🇹  Português", code: "pt-PT")
                langButton(label: "🇬🇧  English",   code: "en")
            }
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }

    // MARK: Card wrapper
    func cardSection(title: LocalizedStringKey, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.secondary)
                .textCase(.uppercase)
                .padding(.horizontal, 4)

            content()
                .padding(16)
                .background(Color(.secondarySystemGroupedBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }

    // MARK: Theme button
    func themeButton(key: LocalizedStringKey, icon: String, value: Int) -> some View {
        let selected = colorSchemePreference == value
        return Button {
            colorSchemePreference = value
        } label: {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .medium))
                Text(key)
                    .font(.caption.weight(.medium))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(selected ? Color.accentColor : Color.clear)
            .foregroundStyle(selected ? .white : .secondary)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .animation(.easeInOut(duration: 0.15), value: selected)
        }
        .buttonStyle(.plain)
    }

    // MARK: Language button
    func langButton(label: String, code: String) -> some View {
        let selected = languagePreference == code
        return Button {
            languagePreference = code
        } label: {
            Text(label)
                .font(.subheadline.weight(.medium))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(selected ? Color.accentColor : Color.clear)
                .foregroundStyle(selected ? .white : .secondary)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .animation(.easeInOut(duration: 0.15), value: selected)
        }
        .buttonStyle(.plain)
    }
}
