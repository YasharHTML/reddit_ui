import 'package:reddit_ui/service/enums/api_level.dart';
import 'package:reddit_ui/service/enums/api_schema.dart';
import 'package:reddit_ui/service/helpers/endpoint_builder.dart';
import 'package:reddit_ui/models/fake_user.dart';
import 'package:reddit_ui/responses/user_response.dart';
import 'package:requests/requests.dart';

class GetUsers {
  EndpointBuilder myBuilder = EndpointBuilder();
  final List<FakeUser> _users = [];

  GetUsers() {
    myBuilder
        .setBaseUrl(apiLevel: ApiLevel.DEVELOPMENT)
        .setSchema(schema: ApiSchema.HTTP)
        .setApiIdentifier()
        .build();
  }

  Future<List<FakeUser>> getAllUsers() async {
    
    UserResponse r = UserResponse(
      List<Map<String, dynamic>>.from((await Requests.get(myBuilder.addParam("users").build())).json()),
    );
    for (Map<String, dynamic> element in r.data) {
      _users.add(
        FakeUser(
          id: element["id"],
          firstName: element["first_name"],
          lastName: element["last_name"],
          avatar: myBuilder.addParam("img").addParam("faces").addParam(element["avatar"]).build(),
          email: element["email"],
        ),
      );
    }
    return _users;
  }
}
