
#import "Tweak.h"

NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
NSArray *BojjiArray = @[Bojji1, Bojji2, Bojji3, Bojji4, Bojji5];




%group reachbojji
%hook SBReachabilityBackgroundView


- (void)_setupChevron {
    %orig;
}


%end

%hook SBReachabilityWindow

- (void)layoutSubviews {
    BojjiView *test = [[BojjiView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    // 读取缓存，定位上次播放的波吉
    NSInteger index = [defaults integerForKey:@"BojjiIndex"];
    
    // 播放下一个波吉
    index++;
    if (index >= [BojjiArray count]) {
        index = 0;
    }
    test.BojjiFilePath = BojjiArray[index];
    // 缓存当前播放的波吉
    [defaults setInteger:index forKey:@"BojjiIndex"];
    
    CGFloat height = [[NSClassFromString(@"SBReachabilityManager") sharedInstance] effectiveReachabilityYOffset];
    test.frame = CGRectMake(self.frame.origin.x, -height, self.frame.size.width, height);
    test.backgroundColor = [UIColor clearColor];
    [self addSubview:test];
    
}

%end

%hook SBReachabilityManager

-(void)_pingKeepAliveWithDuration:(double)arg1 interactedBeforePing:(BOOL)arg2 initialKeepAliveTime:(double)arg3 {
    
    arg3 = 150000.00;
    NSLog(@"CHANGE arg3: %f", arg3);
    %orig(arg1, arg2, arg3);
    
}

%end


%end


%ctor {
    NSLog(@"---Snail Hook SBReachbility---");
    %init(reachbojji);
    
    // 最开始播放第一个波吉
    [defaults setInteger:0 forKey:@"BojjiIndex"];
    
}

    
    


