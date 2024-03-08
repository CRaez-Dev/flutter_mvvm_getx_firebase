import 'package:get/get.dart';
import 'package:flutter_mvvm_getx_firebase/ui/screens/navigation/models/destination_items.dart';
import 'package:flutter/material.dart';

class NavigationController extends GetxController
    with GetTickerProviderStateMixin {
  
  NavigationController();

  RxInt selectedIndex = 0.obs;

  final List<DestinationItems> allDestinations = <DestinationItems>[
    const DestinationItems(
        0, 'Home', Icons.home_outlined, Color(0xFFACACE5), Color(0xFF70B38F)),
    const DestinationItems(1, 'Folder', Icons.folder_outlined,
        Color(0xFFACACE5), Color(0xFF70B38F)),
    const DestinationItems(2, 'Folder', Icons.person_outline, Color(0xFFACACE5),
        Color(0xFF70B38F)),
    const DestinationItems(
        3, 'Pets', Icons.pets, Color(0xFFACACE5), Color(0xFF70B38F)),
  ];

  AnimationController buildFaderController() {
    final AnimationController controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    controller.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.dismissed) {
          update(); // Rebuild unselected destinations offstage.
        }
      },
    );
    return controller;
  }

  late final List<GlobalKey<NavigatorState>> navigatorKeys;
  late final List<AnimationController> destinationFaders;
  late final List<Widget> destinationViews;

  @override
  Future<void> onInit() async {
    super.onInit();

    navigatorKeys = List<GlobalKey<NavigatorState>>.generate(
      allDestinations.length,
      (int index) => GlobalKey(),
    ).toList();

    destinationFaders = List<AnimationController>.generate(
      allDestinations.length,
      (int index) => buildFaderController(),
    ).toList();

    destinationFaders[selectedIndex.value].value = 1.0;

    destinationViews = allDestinations.map<Widget>(
      (DestinationItems destination) {
        return FadeTransition(
          opacity: destinationFaders[destination.index].drive(CurveTween(curve: Curves.fastOutSlowIn)),
          child: DestinationView(
            destination: destination,
            navigatorKey: navigatorKeys[destination.index],
          ),
        );
      },
    ).toList();
  }

  updateIndex(int index) {
    selectedIndex.value = index;
  }

  handleOnPop() {
    final NavigatorState navigator =
        navigatorKeys[selectedIndex.value].currentState!;
    navigator.pop();
  }
}

class DestinationView extends StatelessWidget {
  final DestinationItems destination;
  final Key navigatorKey;

  const DestinationView({
    super.key,
    required this.destination,
    required this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case '/':
                return RootPage(destination: destination,);
              case '/list':
                return ListPage(destination: destination,);
              case '/text':
                return SafeArea(child: Container(color: Colors.greenAccent ,child: const Placeholder()));
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key, required this.destination});

  final DestinationItems destination;

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      title: Text('${destination.title} AlertDialog'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headlineSmall = Theme.of(context).textTheme.headlineSmall!;
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: destination.color,
      foregroundColor: Colors.white,
      visualDensity: VisualDensity.comfortable,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      textStyle: headlineSmall,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${destination.title} RootPage - /'),
        backgroundColor: destination.color,
        foregroundColor: Colors.white,
      ),
      backgroundColor: destination.color,
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: const Text('Push /list'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                showDialog<void>(
                  context: context,
                  useRootNavigator: false,
                  builder: _buildDialog,
                );
              },
              child: const Text('Local Dialog'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: buttonStyle,
              onPressed: () {
                showDialog<void>(
                  context: context,
                  useRootNavigator:
                      true, // ignore: avoid_redundant_argument_values
                  builder: _buildDialog,
                );
              },
              child: const Text('Root Dialog'),
            ),
            const SizedBox(height: 16),
            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {
                    showBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          child: Text(
                            '${destination.title} BottomSheet\n'
                            'Tap the back button to dismiss',
                            style: headlineSmall,
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Local BottomSheet'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key, required this.destination});

  final DestinationItems destination;

  @override
  Widget build(BuildContext context) {
    const int itemCount = 50;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: colorScheme.onSurface.withOpacity(0.12),
        ),
      ),
      foregroundColor: destination.color,
      fixedSize: const Size.fromHeight(64),
      textStyle: Theme.of(context).textTheme.headlineSmall,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${destination.title} ListPage - /list'),
        backgroundColor: destination.color,
        foregroundColor: Colors.white,
      ),
      backgroundColor: destination.color,
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: OutlinedButton(
                style: buttonStyle.copyWith(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                    Color.lerp(destination.color, Colors.white,
                        index / itemCount)!,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/text');
                },
                child: Text('Push /text [$index]'),
              ),
            );
          },
        ),
      ),
    );
  }
}