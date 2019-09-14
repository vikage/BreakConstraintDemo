//
//  PINView.m
//  BreakConstraintDemo
//
//  Created by thanhvu on 9/14/19.
//  Copyright © 2019 thanhvu. All rights reserved.
//

#import "PINView.h"
#define kPINSize 10
@implementation PINView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    [self initSubviews];
}

- (void)initSubviews {
    UIView *previousItem = nil;
    for (int i = 0; i < 4; i++)
    {
        UIView *pinItem = [[UIView alloc] initWithFrame:CGRectZero];
        pinItem.translatesAutoresizingMaskIntoConstraints = NO;
        pinItem.backgroundColor = [UIColor blackColor];
        pinItem.layer.cornerRadius = kPINSize/2;
        pinItem.layer.masksToBounds = YES;
        [self addSubview:pinItem];
        
        [pinItem.widthAnchor constraintEqualToConstant:kPINSize].active = YES;
        [pinItem.heightAnchor constraintEqualToConstant:kPINSize].active = YES;
        [pinItem.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
        
        if (previousItem)
        {
            [pinItem.leadingAnchor constraintEqualToAnchor:previousItem.trailingAnchor constant:10].active = YES;
        }
        else
        {
            [pinItem.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
        }
        
        previousItem = pinItem;
    }
    
    [previousItem.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
}
@end
