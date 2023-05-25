import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixelarticons/pixel.dart';
import 'package:warded/config/app_layout.dart';
import 'package:warded/features/tormentor/application/tormentor_controller.dart';
import 'package:warded/features/tormentor/presentation/widgets/log_button.dart';

class TormentorScreen extends ConsumerWidget {
  const TormentorScreen({super.key});

  static const route = 'tormentor';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tormentorControllerProvider);
    return Scaffold(
      body: state.when(
        data: (data) => Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(data.assetString),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top:
                  MediaQuery.of(context).padding.top + AppLayout.defaultPadding,
              left: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppLayout.cardRadius),
                  bottomRight: Radius.circular(AppLayout.cardRadius),
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    getColor(ref.watch(tormentorControllerProvider).value!.rate)
                            ?.withAlpha(215) ??
                        Colors.white,
                    BlendMode.srcOut,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppLayout.defaultPadding,
                      vertical: AppLayout.defaultPadding,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      backgroundBlendMode: BlendMode.dstOut,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${(ref.watch(tormentorControllerProvider).value!.rate * 100).toStringAsFixed(2)} %',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Streak: ${ref.watch(tormentorControllerProvider).value!.streak}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.white.withAlpha(215),
                  BlendMode.srcOut,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppLayout.defaultPadding,
                    vertical: AppLayout.defaultPadding,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                  child: Text(
                    data.quote,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: AppLayout.defaultPadding,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LogButton(
                    iconData: Pixel.noteplus,
                    onPressed: () {
                      ref
                          .read(tormentorControllerProvider.notifier)
                          .addPositiveRecord();
                    },
                    color: Colors.lightGreen[700]!,
                  ),
                  const SizedBox(
                    height: AppLayout.defaultPadding,
                  ),
                  LogButton(
                    iconData: Pixel.notedelete,
                    onPressed: () {
                      ref
                          .read(tormentorControllerProvider.notifier)
                          .addNegativeRecord();
                    },
                    color: Colors.red[900]!,
                  ),
                ],
              ),
            ),
          ],
        ),
        error: (err, n) {
          if (kDebugMode) {
            print(err);
            print(n);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Color? getColor(double rate) {
    return Color.lerp(Colors.red[900], Colors.white, rate);
  }
}
