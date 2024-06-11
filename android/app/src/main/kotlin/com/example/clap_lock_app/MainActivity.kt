package com.example.clap_lock_app

import android.os.Bundle
import androidx.work.Configuration
import androidx.work.WorkManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity(), Configuration.Provider {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun getWorkManagerConfiguration(): Configuration {
        return Configuration.Builder()
            .setMinimumLoggingLevel(android.util.Log.INFO)
            .build()
    }
}
