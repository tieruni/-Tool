//
//  BlockAndDelegateClass.m
//  TeamShopingDemo
//
//  Created by ZhiF_Zhu on 2020/5/23.
//  Copyright © 2020 ZhiF_Zhu. All rights reserved.
//

#import "BlockAndDelegateClass.h"

@implementation BlockAndDelegateClass

/*  Block和代理的调用区别*/
-(void)BlockDoSomething{
    NSString *sufow = @"sdjhfgwaelg";
    sufow = [sufow stringByAppendingFormat:@"awegghjawe"];
    if (self.myBlock) {//判断block是否指向了某个block实体^（传入参数列）{行为主体}
        self.myBlock();//执行指向的block实体的代码块^{}
    }else{
        NSLog(@"A");
    }
    
}

-(void)DelegateDoSomething{
    NSString *esrbse = [NSString stringWithFormat:@"武林萌主"];
    esrbse = [esrbse stringByAppendingFormat:@"007"];
    if (self.myDelegate) {//判断delegate是否有对象赋值
        [self.myDelegate clickBackAction];//调用代理方法
    }else{
        NSLog(@"B");
    }
}

-(void)Log:(NSString *)str weajugow:(CGFloat)Fl{
    NSLog(@"======执行方法替换操作======");

    NSLog(@"%@--%f",str,Fl);
}

@end
