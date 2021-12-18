//
//  Tweak.h
//  Poggi
//
//  Created by 郑守海 on 2021/12/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BojjiView.h"

@interface SBReachabilityBackgroundViewController : UIViewController
@end

@interface SBReachabilityManager : NSObject
+ (id)sharedInstance;
@property (nonatomic,readonly) BOOL reachabilityModeActive;    //@synthesize reachabilityModeActive=_reachabilityModeActive - In the implementation block
@property (assign,nonatomic) BOOL reachabilityEnabled;
@property (nonatomic,readonly) double effectiveReachabilityYOffset;    //@synthesize effectiveReachabilityYOffset=_effectiveReachabilityYOffset - In the implementation block
@end


@interface SBReachabilityWindow : UIWindow

@end

@interface SBReachabilityBackgroundView : UIView
-(void)_setupChevron;
@end


#define Bojji1 @"/Library/Application Support/ReachBojji.bundle/Bojji1.mov"
#define Bojji2 @"/Library/Application Support/ReachBojji.bundle/Bojji2.mov"
#define Bojji3 @"/Library/Application Support/ReachBojji.bundle/Bojji3.mov"
#define Bojji4 @"/Library/Application Support/ReachBojji.bundle/Bojji4.mov"
#define Bojji5 @"/Library/Application Support/ReachBojji.bundle/Bojji5.mov"





