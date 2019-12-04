import 'package:angel_framework/angel_framework.dart';
import 'package:angel_hot/angel_hot.dart';

main() async {
  var hot = HotReloader(createServer,
      ["/Users/pawankumar/Desktop/dev/flutter/flutter_angel/backend"]);

  await hot.startServer("192.168.0.179", 8383);
}

Future<Angel> createServer() async {
  var app = Angel();

  app.get("/", (req, res) {
    res.write("Hello PK");
  });

  app.post("/createUser", (req, res) async {
    await req.parseBody();
    var name = req.bodyAsMap["name"] as String;
    res.write("Hello $name");
  });

  app.fallback((req, res) =>
      throw AngelHttpException.badRequest(message: "Nothing found"));

  return app;
}
