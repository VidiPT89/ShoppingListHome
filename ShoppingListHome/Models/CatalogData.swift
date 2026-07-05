import Foundation

struct CatalogItem: Identifiable, Hashable {
    let id   = UUID()
    let name: String
    let category: ItemCategory
}

enum CatalogData {
    static let all: [CatalogItem] = carnePeixe + vegetaisFruta + laticinios
                                  + padaria + conservasSecos + limpeza
                                  + higiene + bebidas + snacks + outros

    // MARK: Carne & Peixe
    static let carnePeixe: [CatalogItem] = items(.carnePeixe,
        "Frango inteiro", "Peito de frango", "Coxas de frango", "Asas de frango",
        "Carne picada de vaca", "Carne picada de porco", "Bife de vaca",
        "Entrecosto de porco", "Lombo de porco", "Costelas de porco",
        "Salpicão", "Chouriço", "Linguiça", "Morcela", "Alheira",
        "Fiambre", "Presunto", "Bacon", "Salsicha de porco",
        "Salmão", "Pescada", "Filetes de pescada", "Bacalhau",
        "Sardinha fresca", "Camarão", "Polvo", "Lulas", "Amêijoas",
        "Atum fresco", "Dourada", "Robalo", "Perca"
    )

    // MARK: Vegetais & Fruta
    static let vegetaisFruta: [CatalogItem] = items(.vegetaisFruta,
        "Tomate", "Tomate cherry", "Alface", "Rúcula", "Espinafres",
        "Cebola", "Cebola roxa", "Alho", "Cenoura", "Batata",
        "Batata-doce", "Courgette", "Pepino", "Pimento vermelho",
        "Pimento verde", "Pimento amarelo", "Brócolos", "Couve-flor",
        "Couve portuguesa", "Alho francês", "Cogumelos", "Beringela",
        "Abóbora", "Ervilhas", "Feijão verde", "Grelos", "Nabo",
        "Beterraba", "Aipo", "Maçã", "Pera", "Banana", "Laranja",
        "Limão", "Uvas", "Morango", "Kiwi", "Abacate", "Melão",
        "Manga", "Abacaxi", "Pêssego", "Nectarina", "Ameixa",
        "Framboesa", "Mirtilo", "Melancia", "Figo", "Tangerina"
    )

    // MARK: Laticínios
    static let laticinios: [CatalogItem] = items(.laticinios,
        "Leite meio-gordo", "Leite magro", "Leite gordo",
        "Iogurte natural", "Iogurte grego", "Iogurte de fruta",
        "Queijo flamengo", "Queijo fresco", "Requeijão",
        "Mozarela", "Queijo da Serra", "Queijo ralado",
        "Queijo parmesão", "Manteiga", "Natas", "Natas de cozinha",
        "Ovos M", "Ovos L", "Kefir", "Bebida de aveia"
    )

    // MARK: Padaria
    static let padaria: [CatalogItem] = items(.padaria,
        "Pão de forma branco", "Pão de forma integral",
        "Baguete", "Pão de mistura", "Pão integral",
        "Pão de centeio", "Broa de milho", "Pão ralado",
        "Croissant", "Tostas", "Bolacha Maria",
        "Bolacha de água e sal", "Bolacha de aveia",
        "Bolachas de chocolate", "Bolo de iogurte",
        "Tarte de nata", "Pão de leite"
    )

    // MARK: Conservas & Secos
    static let conservasSecos: [CatalogItem] = items(.conservasSecos,
        "Arroz agulha", "Arroz carolino", "Arroz integral",
        "Massa esparguete", "Massa penne", "Massa fusilli",
        "Massa lasanha", "Massa tagliatelle", "Macarrão",
        "Feijão cozido", "Feijão encarnado", "Grão de bico",
        "Lentilhas", "Ervilhas em lata", "Milho em lata",
        "Atum em lata", "Sardinha em lata", "Cavala em lata",
        "Tomate pelado", "Polpa de tomate", "Concentrado de tomate",
        "Azeitonas", "Cogumelos em lata", "Ananás em lata",
        "Azeite", "Óleo alimentar", "Vinagre", "Vinagre balsâmico",
        "Sal fino", "Sal grosso", "Açúcar branco", "Açúcar amarelo",
        "Farinha de trigo", "Farinha de milho", "Fermento",
        "Bicarbonato de sódio", "Amido de milho",
        "Cacau em pó", "Chocolate para culinária",
        "Mel", "Doce de morango", "Doce de laranja",
        "Manteiga de amendoim", "Tahini",
        "Caldo de galinha", "Caldo de legumes",
        "Molho de tomate", "Ketchup", "Mostarda",
        "Maionese", "Molho de soja", "Molho inglês",
        "Orégãos", "Louro", "Pimentão doce", "Cominhos",
        "Canela", "Noz-moscada", "Açafrão das Índias"
    )

    // MARK: Limpeza
    static let limpeza: [CatalogItem] = items(.limpeza,
        "Detergente loiça", "Detergente máquina loiça",
        "Cápsulas máquina loiça", "Sal máquina loiça",
        "Detergente máquina roupa", "Cápsulas máquina roupa",
        "Suavizante", "Lixívia", "Água oxigenada",
        "Limpador multiusos", "Limpador casa de banho",
        "Produto WC", "Desengordurante",
        "Limpador vidros", "Limpa-metais",
        "Esponjas de cozinha", "Esfregão",
        "Luvas de borracha", "Pano de microfibra",
        "Sacos de lixo grandes", "Sacos de lixo pequenos",
        "Rolo de papel de cozinha", "Papel higiénico",
        "Guardanapos de papel", "Toalhetes húmidos",
        "Inseticida", "Ambientador"
    )

    // MARK: Higiene
    static let higiene: [CatalogItem] = items(.higiene,
        "Champô", "Champô anticaspa", "Condicionador",
        "Máscara de cabelo", "Gel de banho", "Sabonete",
        "Gel de limpeza facial", "Creme hidratante rosto",
        "Leite corporal", "Creme de mãos",
        "Pasta de dentes", "Escova de dentes",
        "Elixir bocal", "Fio dentário",
        "Desodorizante spray", "Desodorizante stick",
        "Protetor solar", "After-sun",
        "Espuma de barbear", "Gel de barbear",
        "Máquinas de barbear", "Lâminas de barbear",
        "Pensos higiénicos", "Tampões", "Pensos diários",
        "Cotonetes", "Algodão", "Banda-d'adesivo",
        "Gel desinfetante", "Toalhetes desmaquilhantes"
    )

    // MARK: Bebidas
    static let bebidas: [CatalogItem] = items(.bebidas,
        "Água sem gás", "Água com gás",
        "Sumo de laranja", "Sumo de maçã", "Sumo de uva",
        "Sumo de pêssego", "Sumo de tomate",
        "Limonada", "Ice tea", "Refrigerante cola",
        "Refrigerante laranja", "Tónica",
        "Cerveja", "Cerveja sem álcool",
        "Vinho tinto", "Vinho branco", "Vinho rosé",
        "Espumante", "Sangria",
        "Café grão", "Café moído", "Cápsulas de café",
        "Descafeinado", "Chá verde", "Chá preto",
        "Chá de camomila", "Chá de hortelã",
        "Leite vegetal de aveia", "Leite vegetal de amêndoa",
        "Kombucha", "Bebida energética"
    )

    // MARK: Snacks
    static let snacks: [CatalogItem] = items(.snacks,
        "Batatas fritas", "Chips de milho",
        "Pipocas", "Amendoins", "Cajus",
        "Amêndoas", "Nozes", "Passas",
        "Mix de frutos secos", "Tâmaras",
        "Barra de cereais", "Barra de proteína",
        "Granola", "Muesli",
        "Chocolate de leite", "Chocolate negro",
        "Chocolate branco", "Gomas", "Rebuçados",
        "Bolachas de arroz", "Crackers",
        "Palitos de queijo", "Nachos",
        "Gelado", "Iogurte líquido"
    )

    // MARK: Outros
    static let outros: [CatalogItem] = items(.outros,
        "Papel de alumínio", "Película aderente",
        "Papel vegetal", "Sacos de congelação",
        "Sacos de fecho zip", "Palitos",
        "Filtros de café", "Cápsulas Nespresso",
        "Baterias AA", "Baterias AAA",
        "Velas", "Palhinhas", "Papel de embrulho",
        "Detergente louça à mão"
    )

    // MARK: Helper
    private static func items(_ category: ItemCategory, _ names: String...) -> [CatalogItem] {
        names.map { CatalogItem(name: $0, category: category) }
    }
}
