import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mindr/app/notes/services.dart';
import 'package:audio_waveforms/audio_waveforms.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  RecorderController controller = RecorderController();

  Widget bottomSheet() => Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2, blurStyle: BlurStyle.outer, color: Colors.grey)
            ]),
        child: SizedBox(
            height: 300,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AudioWaveforms(
                        size: Size(MediaQuery.of(context).size.width, 200.0),
                        recorderController: controller,
                        enableGesture: true,
                        waveStyle: const WaveStyle(
                          waveColor: Colors.blue,
                          spacing: 8.0,
                          extendWaveform: true,
                          showMiddleLine: false,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            NoteServices().recordEventStop(controller);
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.mic_off))
                    ]),
              ),
            )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindr'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(
              context: context, builder: (context) => bottomSheet());
          NoteServices().recordEvent(controller);
        },
        child: const Icon(Iconsax.microphone),
      ),
      backgroundColor: Colors.grey[100],
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: List.generate(3, (index) {
          return InkWell(
            onTap: () => context.push('/singleview/$index'),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Headingssssssssss',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "This is gonna be the paragragh of the sentence. There for please act acording",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                        maxLines: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                print('Deleted');
                              },
                              icon: const Icon(Iconsax.trash, size: 20))
                        ],
                      )
                    ],
                  ),
                )),
          );
        }),
      ),
    );
  }
}
