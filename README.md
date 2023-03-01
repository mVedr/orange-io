
Note : I have added only the lib folder for proper organization, changes made in files belonging to other folders will be explained wherever necessary.

Technologies Used:

#)FlutterFire , which consists of:
1) Flutter (For Frontend)
2) Google Firebase (For Backend and User Authentication)

#) OpenAI's API 

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
