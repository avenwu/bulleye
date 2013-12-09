//
//  ViewController.h
//  BullEye
//
//  Created by yasofon on 12/9/13.
//  Copyright (c) 2013 aven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *targetLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (weak, nonatomic) IBOutlet UILabel *roundLable;

-(IBAction)showAlert;
-(IBAction)sliderMoved:(UISlider *)slider;
-(IBAction)startOver;

@end
