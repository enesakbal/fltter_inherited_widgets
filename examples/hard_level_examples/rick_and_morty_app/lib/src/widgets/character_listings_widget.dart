part of '../views/home_view.dart';

class _CharacterListingsWidget extends StatelessWidget {
  const _CharacterListingsWidget();

  @override
  Widget build(BuildContext context) {
    final state = CharacterState.of(context);

    log('character listings build');

    if (state.characters.isEmpty) {
      return const Center(child: Text('No characters found'));
    }

    return ListView.separated(
      controller: state.scrollController,
      padding: const EdgeInsets.all(8),
      itemCount: state.characters.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final character = state.characters[index];
        return ListTile(
          onTap: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          title: Text(character.name ?? ''),
          subtitle: Text(character.status ?? ''),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(character.image ?? ''),
          ),
        );
      },
    );
  }
}
