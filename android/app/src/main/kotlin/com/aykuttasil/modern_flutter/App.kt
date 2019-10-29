package com.aykuttasil.modern_flutter

import android.app.Activity
import android.content.Context
import androidx.annotation.CallSuper
import androidx.multidex.MultiDex
import io.flutter.app.FlutterApplication
import io.flutter.view.FlutterMain

class App : FlutterApplication() {

    private var mCurrentActivity: Activity? = null

    fun FlutterApplication() {}

    @CallSuper
    override fun onCreate() {
        super.onCreate()
        FlutterMain.startInitialization(this)
    }

    override fun getCurrentActivity(): Activity? {
        return this.mCurrentActivity
    }

    override fun setCurrentActivity(mCurrentActivity: Activity) {
        this.mCurrentActivity = mCurrentActivity
    }

    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }


}