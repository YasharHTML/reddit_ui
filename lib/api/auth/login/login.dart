import 'package:reddit_ui/responses/login_response.dart';
import 'package:reddit_ui/service/enums/api_level.dart';
import 'package:reddit_ui/service/enums/api_schema.dart';
import 'package:reddit_ui/service/helpers/endpoint_builder.dart';
import 'package:requests/requests.dart';

class Login {
  EndpointBuilder myBuilder = EndpointBuilder();

  Login() {
    myBuilder
        .setBaseUrl(apiLevel: ApiLevel.DEVELOPMENT)
        .setSchema(schema: ApiSchema.HTTPS)
        .setApiIdentifier()
        .addPersistentParam("login")
        .saveCurrentParams()
        .build();
  }

  Future<LoginResponse> login(String email, String password) async {
    return Requests.post(
      myBuilder.build(),
      body: {
        "email": email,
        "password": password,
      },
    ).then(
      (value) {
        if (value.statusCode == 200) {
          return LoginResponse(
              {"status": "success", "token": value.json()["token"]});
        }
        return LoginResponse({"status": "failed", "token": ""});
      },
    );
  }
}
