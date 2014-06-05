//
//  RSSettingTableItemType.h
//  RenrenSixin
//
//  Created by lxl on 12-8-14.
//  Copyright (c) 2012年 renren. All rights reserved.
//

#ifndef RenrenSixin_RSSettingItemType_h
#define RenrenSixin_RSSettingItemType_h

typedef enum
{
    // setting view
    RSPersonSettingItemType = 0, 
    RSSystemSettingItemType,
    RSBindingAccountItemType,
    RSBindingFBAccountItemType,
    RSInviteByFaceBookItemType,
    RSInviteBySmsItemType,
    RSInviteByEmailItemType,
    RSShareFaceBookItemType,
    RSShareToRenrenItemType,
    RSPrivacySettingItemType,
    RSNewUserGuideItemType,
    RSAboutItemType,
    RSUserFeedBackItemType,
    RSEvaluateItemType,
    RSMyRPSettingItemType, //人品
    RSEmotionSettingItemType, //表情下载
    
    
    // system setting view
    RSSoundPromptSettingItemType,
    RSSharkPromptSettingItemType,
    RSPushWarnSettingItemType,
    RSMulitLanguageSettingItemType,
    RSCleanCacheSettingItemType,//清除缓存
    RSChangeSkinItemType,//换肤
    RSAccountSettingItemType,//账号设置
    RSPrivateSettingItemType,//隐私设置
    RSGeneralSettingItemType,//通用设置
    RSAddressBookMatchingItemType,//手机通讯录匹配
    RSSkinEmotionItemType,//皮肤表情
    RSEmotionItemType,//表情
    RSNightModeItemType,//夜间模式开关
    RSNearbyItemType,//附近
    RSAppCenterItemType,//应用中心
    RSPluginSettingItemType,//插件管理
    RSAdviceFeedbackItemType,//意见反馈
    RSVersionInfoItemType,//版本信息
#if TEST_MCP_MODE
    RSAPPDebugSettingItemType,
    RSFolderManagerItemType,
#endif
    //帐号设置
    RSMyProfileSettingItemType,
    RSMyQRCodeSettingItemType,
    RSChangePwdSettingItemType,
    RSPhoneBindingSettingItemType,

    //friends item types
    RSNewFriendsItemType,  //新的好友
    RSNearFriendsItemType,  //附近好友
    RSFindGroupItemType,   //发现群组
    RSFindFriendItemType, //个人主页
    RSQRCodeItemType,      //二维码
    RSPublicPageItemType,  //公共主页
    RSPublicAccountItemType, //公众号
    RSGameCenterItemType, // 游戏中心
    RSVIPCenterItemType, // 会员中心
    RSNearAllItemType,//附近
    RSSpringFestivalGossipItemType, //春晚吐槽
    RSSonicFriendsItemType,//声波加好友

    // contact option view
    RSContactOptionSearchByAddressBookItemType,
    RSContactOptionRenrenAuthItemType,
    RSContactOptionBindMobileItemType,
    // 完善用户资料页面
    RSInfoCompleteNameItem,
    RSInfoCompleteGenderItem,
    RSInfoCompleteBirthdayItem,
    RSInfoCompleteSchoolItem,
    RSInfoCompleteSchoolDpmItem,
    RSInfoCompleteSchoolEnrollItem,

    //用户隐私设置页面
    RSNewsFeedBlackListItemType,
    RSFriedRequestItemType,
    RSDisparkProfileItemType,
    RSBlackListItemType,
    RSFollowItemType,

    //消息控制页面
    RSMessageSettingItemType,
    RSDisturbModeItemType,
    RSTimeIntevalItemType,
    RSShakeItemType,
    RSSpecialFeedItemType,
    RSRingingItemType,
    RSStrangerMsgItemType,
    RSPhotosUploadItemType,

    //图片上传质量
    RSPictureHDItemType,
    RSPictureCMItemTye,

    //图片浏览模式
    RSViewIntelligenceItemType,
    RSViewBigItemType,
    RSViewSmallItemType,
    RSViewNOPictureItemType,

    //通用设置
    RSSendQueueItemType,
    RSPasswordModifyItemType,
    RSInfoModifyItemType,
    RSPictureViewModeItemType,
    RSPictureUploadQualityItemType,
    RSPictureTitleType,
    RSPictureExplainType,
    
    RSFriendRequestSameItemType,
    RSFriendRequestAllItemType,

    //缓存清除类型
    RSPictureCacheClearItemType,

    //图片设置
    RSPictureSettingItemType,
    
    //插件管理的类型
    RSYellowBirdItemType,
    RSDIYEmotionItemType,
    RSShowLogItemType,
    
    // add by wei.liu3 VOIP的设置入口
    //VoIP设置
    RSVoIPSettingItemType,
    RSVoIPOpenFeatureItemType,
    RSVoIPOpenFeatureExplainType,
    // ~add by wei.liu3 VOIP的设置入口

    //通讯录导头像设置
    RSABHeadBirthdayItemType,
    RSABHeadSchoolItemType,
    RSABHeadHometownItemType,
    RSABHeadQQItemType,
    RSABHeadPersonalPageItemType
}RSSettingTableItemType;

#endif
