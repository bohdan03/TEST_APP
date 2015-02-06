//
// MapInfo
//  OurNet_Test
//
//  Created by Anton on 2/5/15.
//  Copyright (c) 2015 DoubleDigital. All rights reserved.
//

#ifndef OurNet_Test_MapInfo_h
#define OurNet_Test_MapInfo_h

#import <Foundation/Foundation.h>


//--------------------------------Information Setting---------------------------------------

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0f)
#define IS_RETINA ([[UIScreen mainScreen] scale] == 2.0f)
#define MULTIPLY_VALUE          (IS_IPAD ? 2.0 : 1.0)

#define SCREEN_WIDTH			[[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT			[[UIScreen mainScreen] bounds].size.height

#define SCROLL_HEIGHT           (IS_IPAD ? 200 :100)
#define SCROLL_WIDTH            SCROLL_HEIGHT*1.5

#define Pin_WIDTH   20 * MULTIPLY_VALUE
#define Pin_HEIGHT  20 * MULTIPLY_VALUE

#define Pin_X       15 * MULTIPLY_VALUE
#define Pin_Y       15 * MULTIPLY_VALUE

#endif
