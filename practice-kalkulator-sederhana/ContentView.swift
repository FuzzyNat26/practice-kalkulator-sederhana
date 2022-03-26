//
//  ContentView.swift
//  practice-kalkulator-sederhana
//
//  Created by Jonathan Lee on 23/03/22.
//

import SwiftUI

let lightGrey = Color(red: 230/255, green: 230/255, blue: 230/255);

struct ContentView: View {
    
    @State private var angkaPertama = "";
    @State private var angkaKedua = "";
    
    @State private var showAlert: Bool = false;
    @State private var setAksi: String = "";
    
    func resetValue() {
        angkaPertama = "";
        angkaKedua = "";
    }
    
    func perhitunganAngka() -> String {
        if(angkaPertama.isEmpty || angkaKedua.isEmpty) {
            return "Terdapat input yang kosong";
        }
        
        let satu = Int(angkaPertama) ?? 0;
        let dua = Int(angkaKedua) ?? 0;
        let defaultText = "Hasil " + setAksi + " adalah : "
        
        switch setAksi {
        case "penambahan":
            return  defaultText + String(satu + dua);
        case "pengurangan":
            return defaultText + String(satu - dua);
        case "perkalian":
            return defaultText + String(satu * dua);
        case "pembagian":
            if(dua != 0) {
                return defaultText + String(satu / dua);
            }
            return "Tidak bisa dibagi oleh 0"
         default:
            return String("Ada kesalahan aksi");
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Kalkulator yang hanya untuk latihan")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
            TextField("Masukkan angka pertama", text: $angkaPertama)
                .padding()
                .keyboardType(.decimalPad)
                .background(lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                
            
            TextField("Masukkan angka kedua", text: $angkaKedua)
                .padding()
                .keyboardType(.decimalPad)
                .background(lightGrey)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            Button("Tambah Angka", action: {
                showAlert = true;
                setAksi = "penambahan";
            })
            .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            
            Button("Kurang Angka", action: {
                showAlert = true;
                setAksi = "pengurangan";
            })
            .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            
            Button("Kali Angka", action: {
                showAlert = true;
                setAksi = "perkalian";
            })
            .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            
            Button("Bagi Angka", action: {
                showAlert = true;
                setAksi = "pembagian";
            })
            .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(10)
            
            Spacer()
        }.alert(perhitunganAngka(), isPresented: $showAlert) {
            Button("OK", role: .cancel) {
                if !(angkaPertama.isEmpty || angkaKedua.isEmpty) {
                    resetValue();
                }
            }
        }.padding()
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
