//
//  ViewController.m
//  OurNet_Test
//
//  Created by Anton on 2/5/15.
//  Copyright (c) 2015 DoubleDigital. All rights reserved.
//

#import "ViewController.h"
#import "MapInfo.h"
#import "MapPinView.h"

@interface ViewController ()<MapPinClickDelegate>
{
    UIScrollView   *m_scrollView;
    NSMutableArray *m_arrPinViews;
    NSMutableArray *m_arrPinButtons;
    UIImageView    *m_SelectedImg;
    

}
@property (nonatomic, strong) IBOutlet UIView   *viewMapBackground;
@property (nonatomic, strong) UIDynamicAnimator *animationEffect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSTimer *aTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self InitMapView];
    
}
#pragma mark --------- Init Map View---------
-(void) InitMapView
{
    UIImageView * imgMapBackground = [[UIImageView alloc] initWithFrame:self.viewMapBackground.bounds];
    imgMapBackground.image = [UIImage imageNamed:@"Map.png"];
    [self.viewMapBackground addSubview:imgMapBackground];
    
    //-------------------------12 Map Pin Initialze------------------------
    
    m_arrPinViews = [[NSMutableArray alloc] init];
    m_arrPinButtons = [[NSMutableArray alloc] init];
    
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.3, 0.3) withTag:0]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.5, 0.5) withTag:1]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.25, 0.43) withTag:2]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.6, 0.7) withTag:3]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.8, 0.8) withTag:4]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.81, 0.4) withTag:5]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.38, 0.35) withTag:6]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.77, 0.15) withTag:7]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.4, 0.27) withTag:8]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.65, 0.3) withTag:9]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.55, 0.82) withTag:10]];
    [m_arrPinButtons addObject:[self createPinWithPosition:CGPointMake(0.1, 0.3) withTag:11]];
    
    
    m_scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10 * MULTIPLY_VALUE, SCREEN_HEIGHT - SCROLL_HEIGHT - 5 * MULTIPLY_VALUE, SCREEN_WIDTH - 20 * MULTIPLY_VALUE, SCROLL_HEIGHT)];
    m_scrollView.backgroundColor = [UIColor clearColor];
    m_scrollView.scrollEnabled = YES;
    [m_scrollView setShowsHorizontalScrollIndicator:YES];
    m_scrollView.contentSize = CGSizeMake(m_scrollView.frame.size.height * 12, m_scrollView.frame.size.height);
    [self.view addSubview:m_scrollView];
    
    for (NSInteger i = 0; i < 12; i ++) {
        
        MapPinDataModel * tmpPinData = [[MapPinDataModel alloc] init];
        tmpPinData.Title = @"UK Headquarters";
        tmpPinData.Address = @"11 New Field Budiness Part";
        tmpPinData.Street = @"Stinsford Road, Poole";
        tmpPinData.City = @"Dorset, BH17 ONF";
        tmpPinData.State = @"United Kingdom";
        tmpPinData.PhoneNumber = @"+44 (0) 1202 621511";
        
        MapPinView * tmpPinView = [[MapPinView alloc] initWithFrame:CGRectMake(0, 0, SCROLL_WIDTH, SCROLL_HEIGHT)];
        tmpPinView.center = CGPointMake(tmpPinView.frame.size.width * (i + 0.5), tmpPinView.frame.size.height / 2);
        tmpPinView.n_pinNum = i;
        tmpPinView.delegate = self;
        [tmpPinView setContentPinData:tmpPinData];
        [m_scrollView addSubview:tmpPinView];
        [m_arrPinViews addObject:tmpPinView];
        
        //        [self setSelectWithIndex:i];
        
    }
    
    m_SelectedImg = [[UIImageView alloc] initWithFrame:CGRectMake(-100, 0, Pin_WIDTH, Pin_HEIGHT)];
    m_SelectedImg.image = [UIImage imageNamed:@"Oval 12.png"];
    [self.viewMapBackground addSubview:m_SelectedImg];
    
}
- (UIButton *) createPinWithPosition:(CGPoint) Point withTag:(NSInteger) tag
{
    UIButton * btnPin = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 15 * MULTIPLY_VALUE, 15 * MULTIPLY_VALUE)];
    btnPin.center = CGPointMake(Point.x * self.viewMapBackground.frame.size.width, Point.y * self.viewMapBackground.frame.size.height);
    [btnPin setBackgroundImage:[UIImage imageNamed:@"Fill 519.png"] forState:UIControlStateNormal];
    btnPin.tag = tag;
    [btnPin addTarget:self action:@selector(onClickPin:) forControlEvents:UIControlEventTouchUpInside];
    [self.viewMapBackground addSubview:btnPin];
    
    return btnPin;
}

-(void) onTimer
{
    UIButton * tmpButton = (UIButton*)[m_arrPinButtons objectAtIndex:(self.n_curPinNumer)];
    [UIView animateWithDuration:0.5 animations:^{
        CGAffineTransform scaleTrans1  = CGAffineTransformMakeScale(0.5, 0.5);
        tmpButton.transform =scaleTrans1;
        
    } completion:^(BOOL finished) {
        CGAffineTransform scaleTrans1  = CGAffineTransformMakeScale(1, 1);
        tmpButton.transform =scaleTrans1;
    }];
 
}
#pragma mark -----------------Click Process-----------------------
- (void) onClickPin:(UIButton *) tmpButton
{
    self.n_curPinNumer = tmpButton.tag;
    [self setSelectWithIndex:tmpButton.tag];

}

- (Boolean) setSelectWithIndex:(NSInteger) selectedID
{
    m_SelectedImg.center = ((UIButton *)m_arrPinButtons[selectedID]).center;
    
    Boolean isClicked = false;
    for (MapPinView * theView in m_arrPinViews) {
        if (theView.n_pinNum == selectedID) {
            [theView setSelectedWithFlag:YES];
            isClicked = true;
            
            
            [UIView animateWithDuration:0.5 animations:^{
                [m_scrollView setContentOffset:CGPointMake([m_arrPinViews indexOfObject:theView] * theView.frame.size.width, 0) animated:YES];
            } completion:^(BOOL finished) {
                
            }];
        }
        else
        {
            [theView setSelectedWithFlag:false];
        }
    }
    return isClicked;
}


#pragma mark --------- ScrollView Animation---------

-(void)animation_scrollViewWithIndex:(NSInteger) index{
    
    [self.animationEffect removeAllBehaviors];
    Boolean f_Direction;
    CGFloat boundaryPointX = m_scrollView.contentOffset.x - index * SCROLL_HEIGHT;
    if (boundaryPointX > 0) {
        f_Direction = true;
    }
    else
    {
        f_Direction = false;
    }
    CGFloat gravityDirectionX = (f_Direction) ? 1.0 : -1.0;
    CGFloat pushMagnitude = (f_Direction) ? 20.0 : -20.0;
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[m_scrollView]];
    gravityBehavior.gravityDirection = CGVectorMake(gravityDirectionX, 0.0);
    [self.animationEffect addBehavior:gravityBehavior];
    
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[m_scrollView]];
    [collisionBehavior addBoundaryWithIdentifier:@"menuBoundary"
                                       fromPoint:CGPointMake(boundaryPointX, m_scrollView.center.y)
                                         toPoint:CGPointMake(boundaryPointX, m_scrollView.center.y)];
    [self.animationEffect addBehavior:collisionBehavior];
    
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[m_scrollView]
                                                                    mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.magnitude = pushMagnitude;
    [self.animationEffect addBehavior:pushBehavior];
    
    
    UIDynamicItemBehavior *menuViewBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[m_scrollView]];
    menuViewBehavior.elasticity = 0.5;
    [self.animationEffect addBehavior:menuViewBehavior];
    
}

#pragma mark - Delegate-

- (void) onClickPins:(int) n_PinNumber
{
    
    [self setSelectWithIndex:n_PinNumber];
}

@end
