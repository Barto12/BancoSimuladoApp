//
//  APIService.swift
//  BancoSimulado
//
//  Created by MACBOOK on 23/06/24.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchAccountData(completion: @escaping (Double, [Movimiento]) -> Void) {
        // Simulamos una respuesta de una API
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let saldo = 1250.75
            let movimientos = [
                Movimiento(fecha: "2024-06-01", descripcion: "Compra Supermercado", monto: -50.25),
                Movimiento(fecha: "2024-06-02", descripcion: "Depósito", monto: 300.00),
                Movimiento(fecha: "2024-06-03", descripcion: "Retiro Cajero", monto: -100.00)
            ]
            completion(saldo, movimientos)
        }
    }
}
