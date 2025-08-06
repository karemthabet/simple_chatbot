import 'package:flutter/material.dart';
import 'package:simple_chatbot/model/scenario.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  int currentScenarioIndex = 0;
  int? selectedResponseIndex;

  void selectResponse(int index) {
    setState(() {
      selectedResponseIndex = index;
    });
  }

  void nextScenario() {
    setState(() {
      currentScenarioIndex =
          (currentScenarioIndex + 1) % Scenario.scenarios.length;
      selectedResponseIndex = null;
    });
  }

  void resetScenario() {
    setState(() {
      selectedResponseIndex = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final scenario = Scenario.scenarios[currentScenarioIndex];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F4FF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  scenario.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3A2C91),
                      ),
                ),
                const SizedBox(height: 24),
                _botBubble("🧠 المريض بيقولك:\n${scenario.patientLine}"),
                const SizedBox(height: 24),
                if (selectedResponseIndex == null) ...[
                  _hintText("💬 هترد تقول إيه؟"),
                  const SizedBox(height: 10),
                  ...List.generate(
                    scenario.responses.length,
                    (index) => _userOptionButton(
                      scenario.responses[index],
                      () => selectResponse(index),
                    ),
                  ),
                ] else ...[
                  _userBubble(scenario.responses[selectedResponseIndex!]),
                  const SizedBox(height: 16),
                  _feedbackBubble(scenario.feedbacks[selectedResponseIndex!]),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton.icon(
                        onPressed: resetScenario,
                        icon: const Icon(Icons.refresh),
                        label: const Text("عيد السيناريو"),
                      ),
                      ElevatedButton.icon(
                        onPressed: nextScenario,
                        icon: const Icon(Icons.arrow_forward_ios),
                        label: const Text("سيناريو تاني"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6A5AE0),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _botBubble(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFD9D6F9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Color(0xFF2D1E6B)),
        ),
      ),
    );
  }

  Widget _userBubble(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFEEE9FF),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Color(0xFF3A2C91)),
        ),
      ),
    );
  }

  Widget _feedbackBubble(String feedback) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0F0),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Row(
        children: [
          const Icon(Icons.close, color: Colors.redAccent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              feedback,
              style: const TextStyle(fontSize: 15, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userOptionButton(String label, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6A5AE0),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 3,
        ),
        child: Text(label, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _hintText(String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF3A2C91),
        ),
      ),
    );
  }
}
