import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:contact_state_app/kenny_speaks/api_services.dart';
import 'package:contact_state_app/kenny_speaks/chat_model.dart';
import 'package:contact_state_app/kenny_speaks/tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechToText = SpeechToText();

  var text = "Hold Button To Start Speaking ! ";
  var isListening = false;
  final List<ChatMessage> messages = [];
  var scrollController = ScrollController();
  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
          endRadius: 75.0,
          animate: isListening,
          duration: Duration(milliseconds: 2000),
          showTwoGlows: true,
          repeatPauseDuration: Duration(milliseconds: 100),
          glowColor: Colors.deepOrange,
          repeat: true,
          child: GestureDetector(
            onTapDown: (details) async {
              if (!isListening) {
                var available = await speechToText.initialize();
                if (available) {
                  setState(() {
                    isListening = true;
                    speechToText.listen(onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                      });
                    });
                  });
                }
              }
            },
            onTapUp: (details) async {
              setState(() {
                isListening = false;
              });
              await speechToText.stop();
              if(text.isNotEmpty && text!="Hold Button To Start Speaking ! ")
              {messages.add(ChatMessage(text: text, type: ChatMessageType.user));
              var msg = await ApiServices.sendMessage(text);
              msg= msg.trim();
              setState(() {
                messages.add(ChatMessage(text: msg, type: ChatMessageType.bot));
              });
              Future.delayed(const Duration(milliseconds: 500),(){
                TextToSpeech.speak(msg);
              });
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Try Again!")));
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.deepOrangeAccent,
              radius: 35,
              child: Icon(
                Icons.mic,
                color: Colors.white,
              ),
            ),
          )),

      body: Container(
        alignment: Alignment.center,
        //  color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 0),
         margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                color: isListening ? Colors.black87 : Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            Expanded(
                child: Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(22)),
                child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var chat = messages[index];
                    return ChatBubble(
                        chattext: chat.text, type: chat.type);
                  },
                ),
              ),
            )),

            Text("Please be patient, fetching answers might take time ...",
            style: GoogleFonts.lato(
              color: Colors.black87,
               fontSize: 14,

            ),)
          ],
        ),
      ),
    );
  }

  Widget ChatBubble({required chattext, required ChatMessageType? type}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          //backgroundColor: CupertinoColors.white,
         child: type==ChatMessageType.bot?Image.asset('assets/kenny2.png',
         height: 180,width: 90,):
          const Icon(Icons.person,color: Colors.orangeAccent,),
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Text(
              "$chattext",
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
