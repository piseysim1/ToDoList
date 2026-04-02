// import 'package:dio/dio.dart';
// import 'package:get/get.dart' hide Response;
// import 'package:todolist_app/app/config/app_config.dart';

// class ApiProvider extends GetxService {
//   late Dio _dio;

//   @override
//   void onInit() {
//     //intital values of object to
//     initializadio();
//     super.onInit();
//   }

//   void initializadio() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: KBaseUrl,
//         followRedirects: false,
//         validateStatus: (status) {
//           return status! < 500;
//         },
//         headers: {
//           'Content-Type': "applicaiton/json",
//           'Accept': "applicaiton/json",
//         },
//       ),
//     );
//   }

//   // reqest to server get data  then need to use get.put
//   Future<Response> fetchNews() async {
//     try {
//       final res = await _dio.get(
//         "https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=us&max=10&apikey=${KApiKey}",
//       );
//       return res;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
