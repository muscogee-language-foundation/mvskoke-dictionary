import 'package:flutter/material.dart';
import 'package:mvskoke_dictionary/managers/home_manager.dart';
import 'package:mvskoke_dictionary/models/search_result.dart';
import 'package:mvskoke_dictionary/widgets/details_screen.dart';
import 'package:mvskoke_dictionary/widgets/lexeme_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final manager = HomeManager();

  @override
  void initState() {
    super.initState();
    manager.init();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            },
            suggestionsBuilder:
                (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                },
          ),
          _buildListView(),
        ],
      ),
    );
  }

  Expanded _buildListView() {
    return Expanded(
      child: ValueListenableBuilder<List<SearchResult>>(
        valueListenable: manager.termsNotifier,
        builder: (context, results, child) {
          return LexemeList(
            results: results,
            onItemTap: (termId) async {
              // manager.addToSearchHistory(termId);
              final term = await manager.getTerm(termId);
              if (term == null || !context.mounted) return;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return DetailsScreen(term: term);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
