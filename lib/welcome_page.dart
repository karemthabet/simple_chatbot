import 'package:flutter/material.dart';
import 'package:simple_chatbot/chat_bot_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFFD),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '👋 أهلاً بيك في البوت التعليمي',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3A2C91),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    '📚 في البوت ده، هنعيش مواقف حقيقية بتقابل أهالي مرضى الاضطراب الوجداني ثنائي القطب، '
                    'ونشوف ردود مختلفة... ونتعلم سوا إزاي نختار رد يساعد، مش يعقّد 🧠💬',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF3A2C91),
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 50),

                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ChatBotScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6A5AE0),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 4,
                    ),
                    icon: const Icon(Icons.chat_bubble_outline),
                    label: const Text(
                      '🚀 ابدأ الرحلة',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
