//
//  XZDetailViewController.m
//  KVO初探
//
//  Created by Alan on 4/28/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import "XZDetailViewController.h"
#import "XZStudent.h"

@interface XZDetailViewController ()
@property (nonatomic, strong) XZStudent *student;

@end

@implementation XZDetailViewController
- (void)dealloc
{
    [self.student removeObserver:self forKeyPath:@"name"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.student = [XZStudent shareInstance];
    [self.student addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
    
    // Do any additional setup after loading the view.
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"XZDetail %@",change);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.student.name = @"hello Detail";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
