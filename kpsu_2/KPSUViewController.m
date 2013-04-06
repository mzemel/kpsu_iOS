//
//  KPSUViewController.m
//  kpsu_2
//
//  Created by mike on 10/26/12.
//  Copyright (c) 2012 mike. All rights reserved.
//

#import "KPSUViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface KPSUViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) MPMoviePlayerController *streamPlayer;
@property (weak, nonatomic) IBOutlet UIButton *play_button;
@property (weak, nonatomic) IBOutlet UIButton *pause_button;
@property (readwrite, assign) BOOL been_clicked;



@end

@implementation KPSUViewController

-(void)has_been_clicked {
    _been_clicked=YES;
}

-(void)has_been_unclicked {
    _been_clicked=NO;
}


@synthesize streamPlayer = _streamPlayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self has_been_unclicked];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *streamURL = [NSURL URLWithString:@"http://stream.kpsu.org:1138/ios/ts/listen_audiomp3_64k.m3u8"];
    
    _streamPlayer = [[MPMoviePlayerController alloc] initWithContentURL:streamURL];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play_streaming:(id)sender {

    if (!_been_clicked){
        //[self.streamPlayer.view setFrame: self.view.bounds ];
        //self.streamPlayer.controlStyle = MPMovieControlStyleEmbedded;
        //[self.view addSubview: self.streamPlayer.view];
        
        [self.streamPlayer prepareToPlay];

        [self.streamPlayer play];
        [_play_button setBackgroundImage:[UIImage imageNamed:@"stop.png"] forState:UIControlStateNormal];
        [self has_been_clicked];
        //NSLog(@"Action bold=%d", been_clicked);

    }
    else if (_been_clicked){
        [self.streamPlayer stop];
        [_play_button setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
        [self has_been_unclicked];
    }
}



@end
