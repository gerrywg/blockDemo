//
//  ViewController.m
//  BlockDemo
//
//  Created by wanggang on 2022/3/6.
//

#import "ViewController.h"

typedef void(^RequestResult) (int, NSDictionary *);

@interface ViewController ()

@property (copy, nonatomic) BOOL(^block1)(int, NSString *);
@property (copy, nonatomic) RequestResult block2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.block1 = ^BOOL(int age, NSString * name) {
        NSLog(@"blockName: block1, age: %d, name: %@", age, name);
        return YES;
    };
    
    self.block2 = ^(int age, NSDictionary * dict) {
        NSLog(@"blockName: block2, age: %d, param: %@", age, dict);
    };
    
    BOOL(^block3)(int, NSString *) = ^BOOL(int age, NSString * name) {
        NSLog(@"blockName: block3, age: %d, name: %@", age, name);
        return YES;
    };
    
    BOOL result1 = self.block1(18, @"block1");
    self.block2(18, @{@"url": @"https://www.baidu.com"});
    BOOL result3 = block3(18, @"block3");
    [self testBlock:^BOOL(int age, NSString * name) {
        NSLog(@"blockName: func_block, age: %d, name: %@", age, name);
        return YES;
    }];
    NSLog(@"result1: %d, result3: %d", result1, result3);
    
}

- (void)testBlock: (BOOL(^)(int, NSString *))block {
    block(18, @"xiaoli");
}


@end
