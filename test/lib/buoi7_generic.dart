// class Phone<S, T> {
//   final String name;
//   const Phone({required this.name});
// }

// class Iphone<S extends Phone, T extends String> extends Phone<S, T> {
//   final String modelName;
//   const Iphone({required name, required this.modelName}) : super(name: name);
// }

// class ListView<E>{}

// class PhoneStore<T extends Phone> with Action<T> {}

// mixin Action<T> {
//   T add(T item) {
//     item.toString();
//     return item;
//   } // TODO(toannm): thêm logic xử lý khi add 1 item

//   T update(T item) => item; // TODO(toannm): thêm logic xử lý khi update 1 item
//   T delete(T item) => item; // TODO(toannm): thêm logic xử lý khi delete 1 item
// }

// void main(List<String> args) {
//   test();
//   PhoneStore<Phone> phoneStore = PhoneStore();
//   Phone item = phoneStore.add(const Phone(name: "Samsung"));
//   print(
//       "item added -> ${item.name},  ${item.runtimeType}"); // sẽ in ra: item added -> Samsung

//   PhoneStore<Iphone> iphoneStore = PhoneStore();
//   Iphone itemIphone = iphoneStore.add(const Iphone(
//     name: "iphone",
//     modelName: "iPhone 14",
//   ));
//   print(
//       "itemIphone added -> ${itemIphone.name} - ${itemIphone.modelName}, ${itemIphone.runtimeType}"); // sẽ in ra: itemIphone added -> iphone - iPhone 14

//   print('____END');
// }

// Future test() async {
//   await Future.delayed(const Duration(seconds: 3));
//   print('done test');
// }

class DemoSingleton {
  // tạo named constructor
  const DemoSingleton._();
  // tạo 1 biến static giữ instance
  static const DemoSingleton _instance = DemoSingleton._();
  // tạo 1 hàm factory, giả cú pháp new
  factory DemoSingleton() => _instance;
}

  const a = 10;


void main(List<String> args) {
  DemoSingleton s1 = DemoSingleton();
  DemoSingleton s2 = DemoSingleton();

  final aa = 10;

  print(identical(s1, s2));
  print('_________');
  print(s1 == s2);
}
