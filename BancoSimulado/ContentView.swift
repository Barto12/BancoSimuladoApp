//
//  ContentView.swift
//  BancoSimulado
//
//  Created by MACBOOK on 23/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tarjetaActiva: Bool = true
    @State private var saldoActual: Double = 0.0
    @State private var movimientos: [Movimiento] = []
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Saldo Actual:")
                        .font(.headline)
                    Spacer()
                    Text("$\(saldoActual, specifier: "%.2f")")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                .padding()
                
                Toggle(isOn: $tarjetaActiva) {
                    Text("Tarjeta \(tarjetaActiva ? "Activa" : "Inactiva")")
                        .foregroundColor(tarjetaActiva ? .green : .red)
                }
                .padding()
                
                List(movimientos) { movimiento in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(movimiento.descripcion)
                                .font(.headline)
                            Text(movimiento.fecha)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Text("$\(movimiento.monto, specifier: "%.2f")")
                            .foregroundColor(movimiento.monto < 0 ? .red : .green)
                    }
                    .padding(.vertical, 5)
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Banco Simulado")
            }
            .onAppear {
                loadData()
            }
        }
    }
    
    func loadData() {
        APIService.shared.fetchAccountData { saldo, movimientos in
            self.saldoActual = saldo
            self.movimientos = movimientos
        }
    }
}

struct Movimiento: Identifiable {
    let id = UUID()
    let fecha: String
    let descripcion: String
    let monto: Double
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
