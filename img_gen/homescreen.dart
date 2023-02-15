import 'dart:io';   // for File
 // for FilePickerResult
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'api_services.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  State<HomeScreen2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {
  var sizes = ["Small", "Medium", "Large"];
  var values = ["256x256", "512x512", "1024x1024"];
  String? dropValue;
  String image = '';
  var isLoaded = false;
  var textContoller = TextEditingController();

  ScreenshotController screenshotController = ScreenshotController();
  shareImage() async{
    await screenshotController.capture(delay: Duration(milliseconds: 100),
    pixelRatio: 1.0).then((Uint8List? img) async {
      if(img!=null){
           final directory = (await getApplicationDocumentsDirectory()).path;
           final filename ="share.png";
           final imgpath = await File("$directory/$filename").create();
           await imgpath.writeAsBytes(img);
           Share.shareFiles([imgpath.path],
           text: "Generated By Kenny.ai ~(mVedr)");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: TextFormField(
                          controller: textContoller,
                          decoration: InputDecoration(
                              hintText: "Type Something",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 44,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          icon: Icon(Icons.expand),
                          value: dropValue,
                          items: List.generate(
                              sizes.length,
                              (index) => DropdownMenuItem(
                                    child: Text(sizes[index]),
                                    value: values[index],
                                  )),
                          hint: const Text("Select A Size"),
                          onChanged: (value) {
                            setState(() {
                              dropValue = value.toString();
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height:20,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrangeAccent,
                            shape: StadiumBorder()),
                        onPressed: () async {
                          if (textContoller.text.isNotEmpty &&
                              dropValue!.isNotEmpty) {
                            setState(() {
                              isLoaded = false;
                            });
                            image = await Api.generateImage(
                                textContoller.text, dropValue!);
                            setState(() {
                              isLoaded = true;
                            });
                          }else if(textContoller.text.isNotEmpty &&
                              dropValue!.isEmpty){
                            setState(() {
                              isLoaded = false;
                            });
                            image = await Api.generateImage(
                                textContoller.text, "256x256");
                            setState(() {
                              isLoaded = true;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Please enter the text and size again.")));
                          }
                        },
                        child: const Text("Generate"))),
              ],
            )),
            Expanded(
                flex: 4,
                child: isLoaded?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),

                      ),
                      child: Screenshot(
                        controller: screenshotController,
                        child: Image.network(image,
                        fit:BoxFit.contain),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Row(children: [
                      Expanded(child: ElevatedButton.icon(
                        icon: const Icon(Icons.share),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(8),
                          backgroundColor: Colors.orange
                        ),
                        onPressed: ()async{
                          await shareImage();
                          ScaffoldMessenger.of(context).
                          showSnackBar(const SnackBar(content: Text("Image Shared")));
                        },
                        label: const Text("Share",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      )
                      )
                    ],)
                  ],
                )
                    :Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/ZNeT.gif",
                      height: 100,),
                      const Text("Waiting for Image ...",
                      style: TextStyle(fontSize: 24,
                      ),
                      )
                    ],
                  ),
                ),
            ),
            const Text("Developed by mVedr",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 14.0
            ),)
          ],
        ),
      ),
    );
  }
}
