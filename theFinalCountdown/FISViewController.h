//
//  FISViewController.h
//  theFinalCountdown
//
//  Created by Joe Burgess on 7/9/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISViewController : UIViewController {
    
    NSTimer *timer;
    int countInt;
}

- (IBAction)startButtonTapped:(id)sender;
- (IBAction)pauseButtonTapped:(id)sender;
- (IBAction)cancelButtonTapped:(id)sender;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePickerLabel;


@end
