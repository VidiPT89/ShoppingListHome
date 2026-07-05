import Foundation
import SwiftData

@Model
final class ShoppingItem {
    var id: UUID
    var name: String
    var category: ItemCategory
    var quantity: String?
    var unit: String?
    var isChecked: Bool
    var createdAt: Date

    init(id: UUID = UUID(), name: String, category: ItemCategory, quantity: String? = nil,
         unit: String? = nil, isChecked: Bool = false, createdAt: Date = .now) {
        self.id = id
        self.name = name
        self.category = category
        self.quantity = quantity
        self.unit = unit
        self.isChecked = isChecked
        self.createdAt = createdAt
    }
}

enum ItemCategory: String, Codable, CaseIterable {
    case carnePeixe = "Carne & Peixe"
    case vegetaisFruta = "Vegetais & Fruta"
    case laticinios = "Laticínios"
    case padaria = "Padaria"
    case conservasSecos = "Conservas & Secos"
    case limpeza = "Limpeza"
    case higiene = "Higiene"
    case bebidas = "Bebidas"
    case snacks = "Snacks"
    case outros = "Outros"

    var icon: String {
        switch self {
        case .carnePeixe: return "fork.knife"
        case .vegetaisFruta: return "leaf"
        case .laticinios: return "cup.and.saucer"
        case .padaria: return "birthday.cake"
        case .conservasSecos: return "archivebox"
        case .limpeza: return "bubbles.and.sparkles"
        case .higiene: return "drop"
        case .bebidas: return "wineglass"
        case .snacks: return "popcorn"
        case .outros: return "shippingbox"
        }
    }
}
