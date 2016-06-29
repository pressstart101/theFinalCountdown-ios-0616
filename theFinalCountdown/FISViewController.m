//
//  FISViewController.m
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()
@property (weak, nonatomic) IBOutlet UIButton *startLabel;
@property (weak, nonatomic) IBOutlet UIButton *pauseLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelLabel;

@end

@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.timeLabel.text = @"";
    self.cancelLabel.hidden =YES;

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{


}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonTapped:(id)sender {
    self.pauseLabel.enabled = YES;
    self.startLabel.hidden = YES;
    self.cancelLabel.hidden =NO;
    self.timeLabel.hidden = NO;
    
   self.datePickerLabel.hidden = YES;
    


    countInt = self.datePickerLabel.countDownDuration;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(counter) userInfo:nil repeats:YES];

}

- (IBAction)pauseButtonTapped:(id)sender {
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(counter) userInfo:nil repeats:YES];
    } else {
        [timer invalidate];
        timer = nil;
    }

}


- (IBAction)cancelButtonTapped:(id)sender {
    self.timeLabel.text = [NSString stringWithFormat:@""];
    self.pauseLabel.enabled = NO;
    self.startLabel.hidden = NO;
    self.cancelLabel.hidden =YES;
    self.timeLabel.hidden = YES;
    self.datePickerLabel.hidden = NO;
    [timer invalidate];


}

-(void)counter{
     countInt -=1;
    
    int hours = countInt/3600;
    int minutes = (countInt%3600)/60;
    int seconds = (countInt%60)%60;
    
//    hours = seconds / 3600;
//    minutes = (seconds % 3600) / 60;
//    seconds = (seconds %3600) % 60;
    if (hours == 0) {
        self.timeLabel.text = [NSString stringWithFormat:@"%i:%i", minutes, seconds];

    }else{
    self.timeLabel.text = [NSString stringWithFormat:@"%i:%i:%i", hours, minutes, seconds];
    }
    NSLog(@"%@", self.timeLabel.text);
}
@end
