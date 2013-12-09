//
//  AboutViewController.m
//  BullEye
//
//  Created by yasofon on 12/9/13.
//  Copyright (c) 2013 aven. All rights reserved.
//

#import "AboutViewController.h"

@implementation AboutViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path= [[[NSBundle mainBundle]bundlePath ]stringByAppendingPathComponent:@"BullsEye.html"];
    NSLog(@"path %@", path);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [self.webview loadRequest:request];
}

-(IBAction)close
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
