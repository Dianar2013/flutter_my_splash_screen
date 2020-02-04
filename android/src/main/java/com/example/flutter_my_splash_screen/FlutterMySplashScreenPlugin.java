package com.example.flutter_my_splash_screen;
import android.app.Activity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
public class FlutterMySplashScreenPlugin implements MethodCallHandler {
    private final Activity activity;

    private FlutterMySplashScreenPlugin(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "flutter_my_splash_screen");
        channel.setMethodCallHandler(new FlutterMySplashScreenPlugin(registrar.activity()));
    }

    @Override
    public void onMethodCall(MethodCall methodCall, Result result) {
        switch (methodCall.method) {
            case "show":
                show();
                break;
            case "hide":
                hide();
                break;
            default:
                result.notImplemented();
        }
    }

    /**
     * 打开启动屏
     */
    private void show() {
        SplashScreen.show(activity);
    }

    /**
     * 关闭启动屏
     */
    private void hide() {
        SplashScreen.hide(activity);
    }


}
