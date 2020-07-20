//
//  LJtGhWYVBNTOVZlDfnl.m
//  CocoPodsCombination
//
//  Created by ZhiF_Zhu on 2020/4/7.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import "LJtGhWYVBNTOVZlDfnl.h"

@interface LJtGhWYVBNTOVZlDfnl ()<UICollisionBehaviorDelegate>
@property(nonatomic, strong) UIDynamicAnimator *animator;
@property(nonatomic, strong) UIAttachmentBehavior *attachmentBeh;
@property(nonatomic, strong) UIPushBehavior *pushBeh;
@end

@implementation LJtGhWYVBNTOVZlDfnl
{
    UIImageView *frogImageView;
    UIImageView *dragonImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self ExampleAnimator];
//    [self testExample];
}

- (void)ExampleAnimator{
    frogImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 100+12, 50, 50)];
    frogImageView.userInteractionEnabled = YES;
    UIPanGestureRecognizer *frogPanTapG = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(FrogTransFormCenter:)];
    [frogImageView addGestureRecognizer:frogPanTapG];
    
    dragonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width-12-80, 100+12, 80, 80)];
    dragonImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *DragonTapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(DragonTransFormCenter:)];
    [dragonImageView addGestureRecognizer:DragonTapG];
    
    frogImageView.layer.cornerRadius = frogImageView.bounds.size.width*0.5;
    dragonImageView.layer.cornerRadius = dragonImageView.bounds.size.width*0.5;

    frogImageView.backgroundColor = [UIColor purpleColor];
    dragonImageView.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:frogImageView];
    [self.view addSubview:dragonImageView];

//    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
//    //重力
//    UIGravityBehavior *gravityBeh = [[UIGravityBehavior alloc] initWithItems:@[frogImageView]];
//    //碰撞
//    UICollisionBehavior *collisionBeh = [[UICollisionBehavior alloc] initWithItems:@[frogImageView,dragonImageView]];
//    [collisionBeh setCollisionMode:UICollisionBehaviorModeBoundaries];
//    collisionBeh.translatesReferenceBoundsIntoBoundary = YES;
//    collisionBeh.collisionDelegate = self;
//
//    //连接
//    CGPoint frogCenter = CGPointMake(frogImageView.center.x, frogImageView.center.y);
//    self.attachmentBeh = [[UIAttachmentBehavior alloc] initWithItem:dragonImageView attachedToAnchor:frogCenter];
//
//    //弹簧
//    [self.attachmentBeh setFrequency:1.0];
//    [self.attachmentBeh setDamping:0.1];
//    [self.attachmentBeh setLength:100];
//
//    //推力-瞬间推力
//    UIPushBehavior *pushBeh = [[UIPushBehavior alloc] initWithItems:@[dragonImageView] mode:UIPushBehaviorModeInstantaneous];
//    pushBeh.angle = 0.0;
//    pushBeh.magnitude = 0.0;
//    self.pushBeh = pushBeh;
//    [self.animator addBehavior:self.pushBeh];
    
//    [self.animator addBehavior:gravityBeh];
//    [self.animator addBehavior:collisionBeh];
//    [self.animator addBehavior:self.attachmentBeh];
    
    //物体属性
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[dragonImageView,frogImageView]];
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[dragonImageView,frogImageView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    UIDynamicItemBehavior *propertiesBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[dragonImageView,frogImageView]];
    
    propertiesBehavior.elasticity = 0.95;//物体碰撞时的弹性
    propertiesBehavior.allowsRotation = NO;//物体受力时是否旋转
    propertiesBehavior.angularResistance = 0.0;//旋转阻力，值越大旋转速度下降的越快
    propertiesBehavior.density = 3.0;//物体密度，调整密度值降影响重力和碰撞效果
    propertiesBehavior.friction = 0.5;//滑动阻力/摩擦力
    propertiesBehavior.resistance = 0.5;//空气阻力
    
    [self.animator addBehavior:propertiesBehavior];
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
    
}

- (void)FrogTransFormCenter:(UIPanGestureRecognizer *)frogGesture{
    NSLog(@"触发了手势");
    CGPoint frogGesturePoint = [frogGesture locationInView:self.view];
    frogImageView.center = frogGesturePoint;
//    NSLog(@"%f--%f",dragonImageView.center.x,dragonImageView.center.y);
    [self.attachmentBeh setAnchorPoint:frogGesturePoint];
}

- (void)DragonTransFormCenter:(UITapGestureRecognizer *)dragonGesture{
//    CGPoint dragonGesturePoint = [dragonGesture locationInView:self.view];
//    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
//    //吸附
//    UISnapBehavior *snapBeh = [[UISnapBehavior alloc] initWithItem:dragonImageView snapToPoint:dragonGesturePoint];
//    snapBeh.damping = 0.75;
//    [self.animator addBehavior:snapBeh];
    
    //推力
    CGPoint point = [dragonGesture locationInView:self.view];
    
    CGPoint origin = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    
    CGFloat distance = sqrtf(powf(point.x-origin.x, 2.0)+powf(point.y-origin.y, 2.0));
    CGFloat angle = atan2(point.y-origin.y, point.x-origin.x);
    
    distance = MIN(distance, 100.0);
    [self.pushBeh setMagnitude:distance/100.0];
    [self.pushBeh setAngle:angle];
    [self.pushBeh setActive:YES];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    NSLog(@"点击了屏幕");
//    CGPoint point = CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5);
//
//    CGPoint origin = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
//
//    CGFloat distance = sqrtf(powf(point.x-origin.x, 2.0)+powf(point.y-origin.y, 2.0));
//    CGFloat angle = atan2(point.y-origin.y, point.x-origin.x);
//
//    distance = MIN(distance, 100.0);
//    [self.pushBeh setMagnitude:distance/100.0];
//    [self.pushBeh setAngle:angle];
//    [self.pushBeh setActive:YES];
//}

#pragma mark - UICollisionBehavior - delegate

/// 4个毁掉方法，2个开始时调用，2个结束时调用

- (void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2 atPoint:(CGPoint)p{
    
}
- (void)collisionBehavior:(UICollisionBehavior *)behavior endedContactForItem:(id <UIDynamicItem>)item1 withItem:(id <UIDynamicItem>)item2{
    
}

// The identifier of a boundary created with translatesReferenceBoundsIntoBoundary or setTranslatesReferenceBoundsIntoBoundaryWithInsets is nil
- (void)collisionBehavior:(UICollisionBehavior*)behavior beganContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier atPoint:(CGPoint)p{
    if ([item isEqual:frogImageView]) {
        NSLog(@"Frog");
    }
    if ([item isEqual:dragonImageView]) {
        NSLog(@"Dragon");
    }
}
- (void)collisionBehavior:(UICollisionBehavior*)behavior endedContactForItem:(id <UIDynamicItem>)item withBoundaryIdentifier:(nullable id <NSCopying>)identifier{
    NSLog(@"碰撞结束");
}

- (void)testExample{
    NSLog(@"垃圾代码测试用");
    
    NSNumber *ermgNum = [NSNumber numberWithDouble:154.1567];
    [ermgNum stringValue];
    
    NSString *tsfop = [NSString stringWithFormat:@"%d.%d",64,87];
    
    NSDecimalNumber *weogjapwle = [[NSDecimalNumber alloc] init];
    
    //涉及金钱的计算
    NSDecimalNumber* bb = [NSDecimalNumber decimalNumberWithString:@"11.6565"];
    
    NSDecimalNumber* cc = [NSDecimalNumber decimalNumberWithString:@"1986.987"];
    
    //加法运算函数 decimalNumberByAdding
    NSDecimalNumber* A = [bb decimalNumberByAdding:cc];
    NSLog(@"NSDecimalNumber精确结果:%@",A);
    //减法运算
    NSDecimalNumber* B = [cc decimalNumberBySubtracting:bb];

    //乘法运算
    NSDecimalNumber* C = [bb decimalNumberByMultiplyingBy:cc];

    //除法运算
    NSDecimalNumber* D = [bb decimalNumberByDividingBy:cc];

    //指数运算
    NSDecimalNumber* E = [bb decimalNumberByMultiplyingByPowerOf10:2];

    //次方运算
    NSDecimalNumber* F = [bb decimalNumberByRaisingToPower:2];

    NSArray *arr = [NSArray array];
    if ([tsfop containsString:@"."]) {
        arr = [tsfop componentsSeparatedByString:@"."];
    }
    
    NSInteger index = arc4random()%([arr[1] length]);
    NSInteger index2 = arc4random()%([[arr lastObject] length]);

    //四舍五入
    NSDecimalNumberHandler *behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:index raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *numResult1 = [NSDecimalNumber decimalNumberWithString:@"1.6350"];
    NSLog(@"%@", [numResult1 decimalNumberByRoundingAccordingToBehavior:behavior]);
    NSDecimalNumber *numResult2 = [NSDecimalNumber decimalNumberWithString:@"1.6250"];
    NSLog(@"%@", [numResult2 decimalNumberByRoundingAccordingToBehavior:behavior]);
    
    
    
}

@end
