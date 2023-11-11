package com.example.mobi_esim

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity() {

    private  val  channelname = "nativecode";


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        var  channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelname);
        channel.setMethodCallHandler { call, result ->

            if (call.method == "showToast"){
                Toast.makeText(this,"hello this is toast",Toast.LENGTH_LONG).show();
            }

        }
    }


}