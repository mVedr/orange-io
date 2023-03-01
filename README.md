<h1>Official Documentation</h1>

Hello there, this is the official documentation of the <strong>orange.io</strong> github repo, orange.io is a complete functionality AI assistant, it is equipped with both text generation and image generation. Icing on the cake is you need not even type anything, it can be controlled by voice commands.

You can download the app from <a href="https://play.google.com/store/apps/details?id=com.mvedr.orangeio" >here</a> .

Before trying the application, if possible please refer to this document for smooth functioning and a good experience while using the application.

<h3>tl;dr</h3>
The above document contained few bugs in the app and their possible fixes, it also had a list of newer features which I would love to implement in the future. Feel free to mention any new ideas .


<hr/>

Note : I have added only the lib folder for proper organization, changes made in files belonging to other folders are be explained wherever necessary.

<h2>Technologies Used:</h2>

<b>FlutterFire , which consists of:</b>
1) <b>Flutter</b> (For Frontend)
2) <b> Google Firebase </b>(For Backend and User Authentication)

<b> OpenAI's API </b>

Packages and Dependencies Used:

 <table style="font-family: arial, sans-serif;
  border-collapse: collapse;
  ">
  <tr>
    <th>Dependencies And Packages</th>
 
  </tr>
  <tr>
    <td> <a href="https://pub.dev/packages/cupertino_icons">cupertino_icons</a></td>

  </tr>
  <tr>
    <td><a href="https://pub.dev/packages/cloud_firestore">cloud_firestore</a></td>

  </tr>
  <tr>
    <td><a href="https://pub.dev/packages/firebase_auth">firebase_auth</a></td>

  </tr>
  <tr>
    <td> <a href="https://pub.dev/packages/firebase_core">firebase_core</a></td>

  </tr>
  <tr>
    <td><a href="https://pub.dev/packages/fluttertoast">fluttertoast</a></td>

  </tr>
  <tr>
    <td>  <a href="https://pub.dev/packages/google_fonts">google_fonts</a></td>

  </tr>
  <tr>
  <td>  <a href="https://pub.dev/packages/http">http</a></td>
  </tr>

  <tr>
  <td>  <a href="https://pub.dev/packages/path_provider">path_plus</a></td>
  </tr>

  <tr>
  <td>  <a href="https://pub.dev/packages/share_plus" >share_plus</a></td>
  </tr>

  <tr>
  <td> <a href="https://pub.dev/packages/avatar_glow">avatar_glow</a></td>
  </tr>
  <tr>
  <td>  <a href="https://pub.dev/packages/speech_to_texts">speech_to_text</a></td>
  </tr>
  <tr>
  <td> <a href="https://pub.dev/packages/flutter_tts">flutter_tts</a> </td>
  </tr>
</table>
  
You can click <a href="https://github.com/mVedr/orange-io/blob/main/Depencies.md">here</a> for additional info about some of the packages used.

Project Structure:

I coded the entire project as 3 seperate modules :

<h2>Authentication Using Firebase:</h2>
<h3>Code/Changes not present in the git repo:</h3>

In this module I first made a new project on the firebase console, we then get an auto generated json called google-services.json.

Add this google-services.json to androird/app/ folder, please store it carefully, in this case I didn't have the need to add because I have not added the android folder to git.

<h2>Voice Assistant:</h2>
<h3>Code/Changes not present in the git repo:</h3>

This was a bit challenging part to code, as we require many functionalities and permissions which are not allowed by default.

<h4>We need to add the following xml to android/app/src/main/Manifest.xml :</h4>

    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.BLUETOOTH"/>
    <uses-permission android:name="android.permission.BLUETOOTH_ADMIN"/>
    <uses-permission android:name="android.permission.BLUETOOTH_CONNECT"/>
    <queries>
        <intent>
            <action android:name="android.speech.RecognitionService" />
        </intent>
        <intent> <action android:name="android.intent.action.TTS_SERVICE" /></intent>
    </queries>
We need the permission of the user inorder to record and respond to their audio, thus be sure to make the following change to the file.

<h2>AI Image Generator:</h2>
<h3>Code/Changes not present in the git repo:</h3>

<h4>We need to add the following xml to android/app/src/main/Manifest.xml :</h4>

    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

<h4>Why?</h4>

<h5>We require this permissions because, whenever a user wishes to a share a photo we capture a screenshot of the photo, temporarily store this photo in the local memmory using the <a href="https://pub.dev/packages/screenshot">screenshot</a> package. Then we retrieve the image and then share it.</h5>
<img width="458" alt="image" src="https://user-images.githubusercontent.com/94962003/222246536-084158b9-7da8-4508-a4e2-ecbcb7ca5edc.png">

<h3>Modularity</h3>

<h4>You may have noticed that many files are named as main.dart,main2.dart etc, this is because I coded all the functionalities as a seperate app in itself and help me resolve issuses and let me debug more easily.</h4>

<img src="https://user-images.githubusercontent.com/94962003/222249987-530ef9ad-c178-4bdb-b5fd-8c553837b52c.png" height="300px" width="300px"/>

<h2>Installation and Setup</h2>
<h3>Follow these steps for installation and setup in your local environment</h3>
<h4> 1) Install Flutter </h4>
Run the following command : 
 
 flutter doctor
<hr/>
If command is not being recognised, install flutter from <a href="https://docs.flutter.dev/get-started/install">here</a>.
If the command is working it will list out all the requirements for flutter to run, if they are fulfilled, you are good to go!
<img width="468"  alt="image" src="https://user-images.githubusercontent.com/94962003/222253184-8b2f63c2-8cec-46a9-b575-b7f1072d010a.png">

<h4> 2) Create a new Flutter App In Your Required Directory</h4>
Run the following command : 

flutter create your_app
<hr/>

<h4> 3) Clone <a href="https://github.com/mVedr/orange-io/">this</a> repo , then replace the <b>original lib</b> folder in your app with this <b>new lib</b> folder.

<h4> 4) Download All The Packages Listed  </h4>

You can do this by individually running this command all packages: 
 flutter pub add package_name <hr/>

Or you can copy paste all these dependencies in your pubspec.yaml file and then run :
 flutter pub get <hr/>
<h5>Copy these dependencies and paste them in your pubspec.yaml file : </h5>

  cupertino_icons: ^1.0.2
  
  cloud_firestore: ^4.3.1
  
  firebase_auth: ^4.2.5
  
  firebase_core: ^2.4.1
  
  fluttertoast: ^8.1.2
  
  google_fonts: ^3.0.1
  
  http: ^0.13.5
  
  path_provider: ^2.0.11
  
  share_plus: ^6.3.0
  
  screenshot: ^1.3.0
  
  avatar_glow: ^2.0.2
  
  speech_to_text: ^6.1.1
  
  flutter_tts: ^3.6.3

<h4> 5) Now add all the user permissions shown in the <b>modules</b> section of this document. </h4>

<h4> 6) Create a new firebase project for android, select <a href="https://firebase.google.com/docs/auth/web/password-auth">email authentication</a> option and place the google-services file in the android/app/ folder. </h4>

<h4> 7) Get your own api key from <a href="https://platform.openai.com/docs/introduction">here </a> . </h4>
<hr/>
Store the API key very safely, if possible using a .env file.

<h4> 8) Ok, now you're all set, select an appropriate device and then run the application to witness the magic😉 .

