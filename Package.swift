// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JioMeetSDKs_iOS",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "Core", targets: ["JioMeetCoreSDKTarget"]),
        .library(name: "ScreenShare", targets: ["JioMeetScreenShareSDKTarget"]), 
        .library(name: "UIFoundation", targets: ["JioMeetUIFoundationTarget"]), 
        .library(name: "CoreUI", targets: ["JioMeetUIKitTarget"]), 
        .library(name: "Chat", targets: ["JioMeetChatUIKitTarget"]), 
        .library(name: "ParticipantPanel", targets: ["JioMeetParticipantPanelSDKTarget"]), 
        .library(name: "VirtualBackground", targets: ["JioMeetVBGUIKitTarget"]), 
        .library(name: "Reactions", targets: ["JioMeetReactionsTarget"]), 
    ],
    dependencies: [
		.package(
			name: "JioMeetRtcEngine_iOS",
			url: "https://github.com/JioMeet/JioMeet-rtc-engine-ios.git",
			.exact("3.7.2")
		),
		.package(
			name: "JioMeetMediaStackSDK",
			url: "https://github.com/JioMeet/JMMediaStackSDK_iOS.git",
			.upToNextMajor(from: "1.0.0")
		),
        .package(
			name: "Lottie",
			url: "https://github.com/airbnb/lottie-spm.git",
			from: "4.4.3"
		)
	],
    targets: [
        .binaryTarget(
            name: "JioMeetCoreSDK",
            path: "XCFrameworks/JioMeetCoreSDK.xcframework"
        ),
        .binaryTarget(
            name: "JioMeetScreenShareSDK",
            path: "XCFrameworks/JioMeetScreenShareSDK.xcframework"
        ),
        .binaryTarget(
            name: "JioMeetUIFoundation",
            path: "XCFrameworks/JioMeetUIFoundation.xcframework"
        ),
        .binaryTarget(
            name: "JioMeetUIKit",
            path: "XCFrameworks/JioMeetUIKit.xcframework"
        ),
        .binaryTarget(
            name: "JioMeetChatUIKit",
            path: "XCFrameworks/JioMeetChatUIKit.xcframework"
        ),
        .binaryTarget(
            name: "JioMeetParticipantPanelSDK",
            path: "XCFrameworks/JioMeetParticipantPanelSDK.xcframework"
        ),
        .binaryTarget(
            name: "JioMeetVBGUIKit",
            path: "XCFrameworks/JioMeetVBGUIKit.xcframework"
        ),
        .binaryTarget(
            name: "JioMeetReactions",
            path: "XCFrameworks/JioMeetReactions.xcframework"
        ),
        .target(
			name: "JioMeetCoreSDKTarget",
			dependencies: [
				.target(name: "JioMeetCoreSDK"),
				.product(name: "RTC", package: "JioMeetRtcEngine_iOS"),
				.product(name: "RTM", package: "JioMeetRtcEngine_iOS"),
				.product(name: "JioMeetMediaStackSDK", package: "JioMeetMediaStackSDK")
			],
			path: "CoreSDK",
			exclude: []
		),
        .target(
			name: "JioMeetScreenShareSDKTarget",
			dependencies: [
				.target(name: "JioMeetScreenShareSDK"),
				.product(name: "RTC", package: "JioMeetRtcEngine_iOS"),
				.product(name: "RTM", package: "JioMeetRtcEngine_iOS"),
				.product(name: "JioMeetMediaStackSDK", package: "JioMeetMediaStackSDK")
			],
			path: "ScreenShareSDK",
			exclude: []
		),
        .target(
			name: "JioMeetUIFoundationTarget",
			dependencies: [
                .target(name: "JioMeetCoreSDKTarget"),
				.target(name: "JioMeetUIFoundation")
			],
			path: "UIFoundationSDK",
			exclude: []
		),
        .target(
			name: "JioMeetUIKitTarget",
			dependencies: [
                .target(name: "JioMeetCoreSDKTarget"),
                .target(name: "JioMeetUIFoundationTarget"),
				.target(name: "JioMeetUIKit")
			],
			path: "CoreUISDK",
			exclude: []
		),
        .target(
			name: "JioMeetChatUIKitTarget",
			dependencies: [
                .target(name: "JioMeetCoreSDKTarget"),
                .target(name: "JioMeetUIFoundationTarget"),
				.target(name: "JioMeetChatUIKit")
			],
			path: "ChatUISDK",
			exclude: []
		),
        .target(
			name: "JioMeetParticipantPanelSDKTarget",
			dependencies: [
                .target(name: "JioMeetCoreSDKTarget"),
                .target(name: "JioMeetUIFoundationTarget"),
				.target(name: "JioMeetParticipantPanelSDK")
			],
			path: "ParticipantsUISDK",
			exclude: []
		),
        .target(
			name: "JioMeetVBGUIKitTarget",
			dependencies: [
                .target(name: "JioMeetCoreSDKTarget"),
                .target(name: "JioMeetUIFoundationTarget"),
				.target(name: "JioMeetVBGUIKit")
			],
			path: "VirtualBackgroundSDK",
			exclude: []
		),
        .target(
			name: "JioMeetReactionsTarget",
			dependencies: [
                .target(name: "JioMeetCoreSDKTarget"),
                .target(name: "JioMeetUIFoundationTarget"),
				.target(name: "JioMeetReactions"),
                .product(name: "Lottie", package: "Lottie"),
			],
			path: "ReactionsUISDK",
			exclude: []
		)
    ]
)