//
//  ChartData.swift
//  TelegramCharts
//
//  Created by Lukisha, Ilya on 20/03/2019.
//  Copyright © 2019 IL&MB. All rights reserved.
//

struct ChartData<T>: Decodable {

    let columns: [ChartColumnLabel: [ChartColumnValue<T>]]
    let types: [ChartColumnLabel: ChartType]
    let colors: [ChartColumnLabel: ChartColor]
    let names: [ChartColumnLabel: ChartName]

    enum CodingKeys: String, CodingKey {
        case columns = "columns"
        case types = "types"
        case colors = "colors"
        case names = "names"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let columns = try container.decode(Array<Array<AnyObject.self>>.self, forKey: .columns)

    }
}

struct ChartColumnLabel: Hashable {
    let label: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.label)
    }
}

struct ChartColumnValue<T> {
    let value: T
}

enum ChartType: String, Decodable {
    case line
    case xAxis
}

struct ChartColor {
    let colorName: String
}

struct ChartName {
    let name: String
}
