//
//  BojjiView.m
//  Poggi
//

#import "BojjiView.h"

@implementation BojjiView


- (void)layoutSubviews {
    
    [self initBojjiPayer:self.BojjiFilePath];
    
}


- (void)initBojjiPayer: (NSString *)filePath {
    
    // 判断波吉的视频文件，是否存在
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSLog(@"文件存在");
        NSURL *url=[NSURL fileURLWithPath:filePath];
        AVAsset *asset = [AVAsset assetWithURL:url];
        self.item=[AVPlayerItem playerItemWithAsset:asset];
        
        //设置AVPlayer中的AVPlayerItem
        self.player=[AVPlayer playerWithPlayerItem:self.item];
        
        //初始化layer 传入player
        AVPlayerLayer *layer=[AVPlayerLayer playerLayerWithPlayer:self.player];
        
        //设置layer的属性
        layer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        layer.contentsScale = [UIScreen mainScreen].scale;
        layer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        layer.backgroundColor=[UIColor greenColor].CGColor;
        //将视频的layer添加到视图的layer中
        [self.layer addSublayer:layer];
        
        //监听status属性，注意监听的是AVPlayerItem
        [self.item addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
        //监听loadedTimeRanges属性
        [self.item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    else {
        NSLog(@"文件不存在");
    }
    
}


//AVPlayerItem监听的回调函数
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    AVPlayerItem *playerItem = (AVPlayerItem *)object;
    
    if ([keyPath isEqualToString:@"loadedTimeRanges"]){
        
    }else if ([keyPath isEqualToString:@"status"]){
        if (playerItem.status == AVPlayerItemStatusReadyToPlay){
            NSLog(@"playerItem is ready");
            
            //如果视频准备好 就开始播放
            [self.player play];
            
        } else if(playerItem.status==AVPlayerStatusUnknown){
            NSLog(@"playerItem Unknown错误");
        }
        else if (playerItem.status==AVPlayerStatusFailed){
            NSLog(@"playerItem 失败");
        }
    }
}




@end
