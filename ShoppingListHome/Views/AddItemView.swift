import SwiftUI

struct AddItemView: View {
    @ObservedObject var listVM: ListViewModel
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var category: ItemCategory = .outros
    @State private var quantity = ""
    @State private var unit = ""
    @FocusState private var nameFocused: Bool

    let units = ["", "un", "kg", "g", "L", "ml", "cx", "pct", "dz"]

    var body: some View {
        NavigationStack {
            Form {
                Section("Produto") {
                    TextField("Nome do produto", text: $name)
                        .focused($nameFocused)
                }

                Section("Categoria") {
                    Picker("Categoria", selection: $category) {
                        ForEach(ItemCategory.allCases, id: \.self) { cat in
                            Label(cat.rawValue, systemImage: cat.icon).tag(cat)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }

                Section("Quantidade (opcional)") {
                    HStack {
                        TextField("Ex: 2", text: $quantity)
                            .keyboardType(.decimalPad)
                        Divider()
                        Picker("Unidade", selection: $unit) {
                            ForEach(units, id: \.self) { u in
                                Text(u.isEmpty ? "—" : u).tag(u)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                }
            }
            .navigationTitle("Novo item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Adicionar") {
                        let trimmed = name.trimmingCharacters(in: .whitespaces)
                        guard !trimmed.isEmpty else { return }
                        listVM.addItem(
                            name: trimmed,
                            category: category,
                            quantity: quantity.isEmpty ? nil : quantity,
                            unit: unit.isEmpty ? nil : unit
                        )
                        dismiss()
                    }
                    .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                    .fontWeight(.semibold)
                }
            }
            .onAppear { nameFocused = true }
        }
    }
}
