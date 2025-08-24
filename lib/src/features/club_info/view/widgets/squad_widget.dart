import 'package:flutter/material.dart';
import 'package:mvc_multi_screens/src/core/theme/colors.dart';
import 'package:mvc_multi_screens/src/core/theme/texts.dart';

enum SquadWidgetType { small, medium, large }

class SquadWidget extends StatelessWidget {
  final List<String> squad;
  final SquadWidgetType? type;
  final double? minItemWidth; // override manual (default 200)

  const SquadWidget({
    super.key,
    required this.squad,
    this.type,
    this.minItemWidth,
  });

  double _minWidthForType(SquadWidgetType? t) {
    switch (t) {
      case SquadWidgetType.small:
        return 160;
      case SquadWidgetType.medium:
        return 200;
      case SquadWidgetType.large:
        return 240;
      default:
        return 200; // padrão
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Elenco', style: titleText22),
        const SizedBox(height: 32),

        // Usa LayoutBuilder para calcular quantas colunas cabem
        LayoutBuilder(
          builder: (context, constraints) {
            final minWidth = minItemWidth ?? _minWidthForType(type);
            final totalWidth =
                constraints.maxWidth.isFinite
                    ? constraints.maxWidth
                    : MediaQuery.of(context).size.width;

            int crossAxisCount = (totalWidth / minWidth).floor();
            if (crossAxisCount < 1) crossAxisCount = 1;

            final itemWidth = totalWidth / crossAxisCount;
            const double itemHeight = 72; // altura fixa p/ todos os cards
            final double childAspectRatio = itemWidth / itemHeight;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: squad.length,
              itemBuilder: (context, index) {
                final player = squad[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: tableBorderColor),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.person, color: darkColor),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          player,
                          style: titleText16.copyWith(
                            color: darkColor,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
