//
//  ViewController.m
//  BullEye
//
//  Created by yasofon on 12/9/13.
//  Copyright (c) 2013 aven. All rights reserved.
//

#import "ViewController.h"
#define MESSAGE "You scored %d points"
@interface ViewController ()

@end

@implementation ViewController
{
    int _currentValue;
    int _targetValue;
    int _score;
    int _round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewGame];
    [self updatelabels];
    [self customSlider];
}
-(void)customSlider
{
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"]
                               resizableImageWithCapInsets:UIEdgeInsetsMake(0,14,0,14)];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)showAlert
{
    int difference = abs(_currentValue - _targetValue);
    int points = 100 - difference;
    NSString *title;
    if (difference==0) {
        title = @"Perfect!";
        points += 100;
    }else if (difference < 5){
        title = @"You almost had it!";
        if (difference == 1) {
            points += 50;
        }
    }else if (difference < 10){
        title = @"Pretty good!";
    }else{
        title = @"Not even close...";
    }
    _score += points;
    NSString *message = [NSString stringWithFormat:@MESSAGE, points];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:title
                              message:message
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [alertView show];
}

-(IBAction)sliderMoved:(UISlider *)slider
{
    _currentValue = lround(slider.value);
}

-(void) updatelabels
{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue ];
    self.scoreLable.text = [NSString stringWithFormat:@"%d", _score];
    self.roundLable.text = [NSString stringWithFormat:@"%d", _round];
}

-(void)startNewRound
{
    _round += 1;
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

-(void)startNewGame
{
    _round = 0;
    _score = 0;
    [self startNewRound];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updatelabels];
}

-(IBAction)startOver
{
    CATransition *trasition = [CATransition animation];
    trasition.type = kCATransitionFade;
    trasition.duration = 1;
    trasition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    [self startNewGame];
    [self updatelabels];
    [self.view.layer addAnimation:trasition forKey:nil];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
