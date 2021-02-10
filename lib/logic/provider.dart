import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];


// 独立している(依存していない)Model
List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (_) => databaseManager(),
  ),
];


// 上に依存しているやつ
List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, UserRepository>(
    updata: (_, dbManager, repo) => UserRepository(dbManager: dbManager),
  ),
];


// view models
List<SingleChildWidget> viewModels = [
  ChangeNoftifierProvider<xxViewModel>(
    create: (context) => xxViewModel(
      userRepository: Provider.of<UserRepository>(context, listen: false),
    ),
  ),
];
