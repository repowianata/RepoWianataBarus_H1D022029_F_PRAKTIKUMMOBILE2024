import 'dart:io';

class Laptop {
  String name;
  String brand;
  double price;

  Laptop({required this.name, required this.brand, required this.price});
}

void main() {
  List<Laptop> laptops = [
    Laptop(name: 'MacBook Pro', brand: 'Apple', price: 2000),
    Laptop(name: 'XPS 13', brand: 'Dell', price: 1500),
    Laptop(name: 'Aspire 5', brand: 'Acer', price: 700),
    Laptop(name: 'ThinkPad X1', brand: 'Lenovo', price: 1800),
    Laptop(name: 'ROG Strix', brand: 'Asus', price: 2200),
  ];

  while (true) {
    print("\n==== Daftar Laptop ====");
    laptops.forEach((laptop) => print(
        'Nama: ${laptop.name}, Merek: ${laptop.brand}, Harga: \$${laptop.price}'));
    
    print("\nPilih fitur: ");
    print("1. Tampilkan semua laptop");
    print("2. Filter laptop berdasarkan merek");
    print("3. Cari laptop berdasarkan nama");
    print("4. Keluar");
    
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        tampilkanSemuaLaptop(laptops);
        break;
      case '2':
        filterLaptop(laptops);
        break;
      case '3':
        cariLaptop(laptops);
        break;
      case '4':
        exit(0);
      default:
        print('Pilihan tidak valid, coba lagi.');
    }
  }
}

void tampilkanSemuaLaptop(List<Laptop> laptops) {
  print("\n--- Semua Laptop ---");
  laptops.forEach((laptop) {
    print('Nama: ${laptop.name}, Merek: ${laptop.brand}, Harga: \$${laptop.price}');
  });
}

void filterLaptop(List<Laptop> laptops) {
  print("\nMasukkan merek laptop yang ingin difilter: ");
  String? brand = stdin.readLineSync();

  List<Laptop> filtered = laptops.where((laptop) => laptop.brand == brand).toList();

  if (filtered.isEmpty) {
    print('Tidak ada laptop dengan merek $brand.');
  } else {
    print("\n--- Hasil Filter ---");
    filtered.forEach((laptop) {
      print('Nama: ${laptop.name}, Merek: ${laptop.brand}, Harga: \$${laptop.price}');
    });
  }
}

void cariLaptop(List<Laptop> laptops) {
  print("\nMasukkan nama laptop yang ingin dicari: ");
  String? name = stdin.readLineSync();

  List<Laptop> found = laptops.where((laptop) => laptop.name.toLowerCase().contains(name!.toLowerCase())).toList();

  if (found.isEmpty) {
    print('Laptop dengan nama $name tidak ditemukan.');
  } else {
    print("\n--- Hasil Pencarian ---");
    found.forEach((laptop) {
      print('Nama: ${laptop.name}, Merek: ${laptop.brand}, Harga: \$${laptop.price}');
    });
  }
}
