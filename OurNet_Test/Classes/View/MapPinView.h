//
//  MapView.h
//  OurNet_Test
//
//  Created by OK MAC on 2/5/15.
//  Copyright (c) 2015 DoubleDigital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapPinDataModel.h"


//------Protocal(Delegate)---------

@protocol MapPinClickDelegate <NSObject>
@optional
-(void) onClickPins:(int) n_PinNumber;
@end

//--------MapPinView Class----------

@interface MapPinView : UIView

{
    UIButton * m_btnBackButton;
    
    UILabel * m_lblTitle;
    UILabel * m_lblDescription;

    UIImageView *m_imgSelectedPin;
     UIImageView *m_imgSelectedPinBound;
    UIImageView *m_imgBackGround;
   
}

@property (nonatomic, strong) id <MapPinClickDelegate>  delegate;

@property int n_pinNum;

- (instancetype) initWithFrame:(CGRect)frame;
- (void) setContentPinData:(MapPinDataModel *) pinData;
- (void) setSelectedWithFlag:(Boolean) isSelected;

@end

