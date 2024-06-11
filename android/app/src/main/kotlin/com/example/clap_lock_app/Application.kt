package com.example.clap_lock_app

import io.flutter.app.FlutterApplication
import com.transistorsoft.tsbackgroundfetch.BackgroundFetch

class Application : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        BackgroundFetch.getInstance(this).configure(BackgroundFetchConfig.Builder().build(), { taskId ->
            BackgroundFetch.finish(taskId)
        }, { taskId ->
            BackgroundFetch.finish(taskId)
        })
    }
}
