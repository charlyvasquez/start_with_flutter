#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AgoraRtcChannelPlugin.h"
#import "AgoraRtcEnginePlugin.h"
#import "AgoraSurfaceViewFactory.h"
#import "AgoraTextureViewFactory.h"
#import "RtcEnginePlugin.h"
#import "RtcEnginePluginRegistrant.h"
#import "RtcEngineRegistry.h"
#import "CallApiMethodCallHandler.h"
#import "FlutterIrisEventHandler.h"

FOUNDATION_EXPORT double agora_rtc_engineVersionNumber;
FOUNDATION_EXPORT const unsigned char agora_rtc_engineVersionString[];

