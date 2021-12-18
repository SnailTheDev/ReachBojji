//
//  BojjiView.h
//  Poggi
//
//  Created by 郑守海 on 2021/12/12.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <time.h>


@interface BojjiView : UIView
@property (strong,nonatomic) NSString *BojjiFilePath;
@property (strong,nonatomic) AVPlayerViewController *moviePlayer;
@property (strong,nonatomic) AVPlayer *player;
@property (strong,nonatomic) AVPlayerItem *item;

- (void)initBojjiPayer: (NSString *)filePath;
@end

