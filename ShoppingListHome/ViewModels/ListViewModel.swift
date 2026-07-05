import Foundation
import SwiftData

@MainActor
class ListViewModel: ObservableObject {
    @Published var items: [ShoppingItem] = []

    private var context: ModelContext?

    func configure(_ context: ModelContext) {
        guard self.context == nil else { return }
        self.context = context
        fetchItems()
    }

    func fetchItems() {
        guard let context else { return }
        let descriptor = FetchDescriptor<ShoppingItem>(
            sortBy: [SortDescriptor(\.createdAt, order: .reverse)]
        )
        items = (try? context.fetch(descriptor)) ?? []
    }

    func addItem(name: String, category: ItemCategory, quantity: String?, unit: String?) {
        guard let context else { return }
        let item = ShoppingItem(name: name, category: category, quantity: quantity, unit: unit)
        context.insert(item)
        save()
    }

    func removeByName(_ name: String) {
        if let item = items.first(where: { $0.name.lowercased() == name.lowercased() && !$0.isChecked }) {
            deleteItem(item)
        }
    }

    func toggleItem(_ item: ShoppingItem) {
        item.isChecked.toggle()
        save()
    }

    func deleteItem(_ item: ShoppingItem) {
        guard let context else { return }
        context.delete(item)
        save()
    }

    func clearChecked() {
        guard let context else { return }
        for item in items.filter({ $0.isChecked }) {
            context.delete(item)
        }
        save()
    }

    private func save() {
        try? context?.save()
        fetchItems()
    }
}
