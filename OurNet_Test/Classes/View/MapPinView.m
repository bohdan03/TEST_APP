//
//  MapView.m
//  OurNet_Test
//
//  Created by Anton on 2/5/15.
//  Copyright (c) 2015 DoubleDigital. All rights reserved.
//

#import "MapPinView.h"
#import "MapInfo.h"


@implementation MapPinView


- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        //-------------------------------UI Initialize ----------------------------------
        
        self.backgroundColor = [UIColor clearColor];
        m_imgBackGround = [[UIImageView alloc] initWithFrame:self.bounds];
        m_imgBackGround.image = [UIImage imageNamed:@"Selected Highlight.png"];
        [self addSubview:m_imgBackGround];
        
        m_imgSelectedPin  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Pin_WIDTH, Pin_HEIGHT)];
        m_imgSelectedPin.center = CGPointMake(frame.size.width - Pin_X, Pin_Y);
        m_imgSelectedPin.image = [UIImage imageNamed:@"Oval 12.png"];
        [self addSubview:m_imgSelectedPin];
       
        m_imgSelectedPinBound = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15 * MULTIPLY_VALUE, 15 * MULTIPLY_VALUE)];
        m_imgSelectedPinBound.center = CGPointMake(m_imgSelectedPin.frame.size.width / 2, m_imgSelectedPin.frame.size.height / 2);
        m_imgSelectedPinBound.image = [UIImage imageNamed:@"Fill 519.png"];
        [m_imgSelectedPin addSubview:m_imgSelectedPinBound];
        
        m_lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(5 * MULTIPLY_VALUE, 5 * MULTIPLY_VALUE, frame.size.width - 10 * MULTIPLY_VALUE, 15 * MULTIPLY_VALUE)];
        m_lblTitle.text = @"OK";
        m_lblTitle.textColor = [UIColor whiteColor];
        m_lblTitle.textAlignment = NSTextAlignmentLeft;
        m_lblTitle.font = [UIFont systemFontOfSize:12 * MULTIPLY_VALUE];
        [self addSubview:m_lblTitle];
        
        m_lblDescription = [[UILabel alloc] initWithFrame:CGRectMake(5 * MULTIPLY_VALUE, 25 * MULTIPLY_VALUE, frame.size.width - 10 * MULTIPLY_VALUE, frame.size.height - 30 * MULTIPLY_VALUE)];
        m_lblDescription.text = @"OK";
        m_lblDescription.font = [UIFont systemFontOfSize:10 * MULTIPLY_VALUE];
        m_lblDescription.textColor = [UIColor whiteColor];
        m_lblDescription.textAlignment = NSTextAlignmentLeft;
        m_lblDescription.numberOfLines = 0;
        m_lblDescription.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:m_lblDescription];
        
        m_btnBackButton = [[UIButton alloc] initWithFrame:self.bounds];
        [m_btnBackButton setBackgroundImage:nil forState:UIControlStateNormal];
        [m_btnBackButton addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:m_btnBackButton];
        
        
        m_imgBackGround.hidden = true;
        m_imgSelectedPin.hidden = true;
        
    }
    return self;
}
- (void) setContentPinData:(MapPinDataModel *) pinData
{
    m_lblTitle.text = pinData.Title;
    m_lblDescription.text = [NSString stringWithFormat:@"%@,\n%@,\n%@,\n%@,\n%@", pinData.Address, pinData.Street, pinData.City, pinData.State, pinData.PhoneNumber];
    
}
- (void) setSelectedWithFlag:(Boolean) isSelected
{
    
    m_imgBackGround.hidden = false;
    m_imgSelectedPin.hidden = false;
    [UIView animateWithDuration:1 animations:^{
        m_imgBackGround.alpha = isSelected;
        m_imgSelectedPin.alpha = isSelected;
    } completion:^(BOOL finished) {
        m_imgBackGround.hidden = !isSelected;
        m_imgSelectedPin.hidden = !isSelected;
    }];
    
}
- (void) onClick
{
    [self.delegate onClickPins:self.n_pinNum];
}

@end
