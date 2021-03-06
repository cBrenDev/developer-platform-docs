---
layout: page
title: Troubleshooting iOS Player Issues
subcat: SDK 2.0 - iOS
weight: 341
---

This article provides troubleshooting solutions for common iOS Player issues.

## iOS: App Transport Security (ATS)  

iOS 9 and above include a security feature that, by default, blocks all non-TLS connections. However, since many servers still do not support TLS, there are exclusion keys that can be set in the app's `Info.plist` file.

The most permissive setting is to disable ATS entirely. This is done by setting `NSAppTransportSecurity:NSAllowsArbitraryLoads` to `YES`:

```xml
<plist version="1.0">
<dict>
	...
	<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSAllowsArbitraryLoads</key>
		<true/>
	</dict>
	...
</dict>
</plist>
```

> Note: If there's a known limited set of domains that must to be accessed without TLS, it is advised to whitelist them explicitly. 
For more information about fine-grained control of ATS see:
* [Cocoa Keys - App Transport Security]( https://developer.apple.com/library/ios/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/plist/info/NSAppTransportSecurity)
* [Working with Apple’s App Transport Security]( http://www.neglectedpotential.com/2015/06/working-with-apples-application-transport-security/)

## iOS: Bitcode  

Starting with [Xcode 7](https://developer.apple.com/library/ios/releasenotes/DeveloperTools/RN-Xcode/Chapters/xc7_release_notes.html), bitcode is enabled by default. However, building an application with bitcode requires that all of the static libraries that are being used are also built with bitcode.

The Widevine Classic library (`libWViPhoneAPI.a`) included with the Kaltura SDK is not built with bitcode; as a result, your application will need to disable bitcode in its own linker settings.
