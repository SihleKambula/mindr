import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
//Upon complete
  void _onIntroEnd(context) async {
    context.go('/wrapper');
  }

  //image builder
  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset(
      'assets/images/$assetName',
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      bodyTextStyle: TextStyle(color: Colors.grey, fontSize: 16),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    );
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: const Color.fromARGB(255, 6, 66, 116),
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
          ),
          baseBtnStyle: TextButton.styleFrom(foregroundColor: Colors.black),
          autoScrollDuration: 3000,
          showNextButton: false,
          onDone: () => _onIntroEnd(context),
          done: const Text('Done'),
          showSkipButton: true,
          skip: const Text('Skip'),
          pages: [
            PageViewModel(
              title: 'Remember the important stuff',
              body:
                  'Press, Talk and voila! An event is created in your calendar',
              image: _buildImage('calendar.gif'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Shower thoughts?",
              body:
                  "Record your thoughts and ideas on the go and let us script it out for you.",
              image: _buildImage('notes.gif'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Let Mindr help you",
              body:
                  "A central place to store important reminders that help your relationships grow",
              image: _buildImage('reminder.gif'),
              decoration: pageDecoration,
            ),
          ],
        ),
      ),
    );
  }
}
