import 'package:blooddonarapp/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProvider() {
  return [
    ChangeNotifierProvider(lazy: false, create: (context) => AuthProvider())
  ];
}
