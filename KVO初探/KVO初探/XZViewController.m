//
//  XZViewController.m
//  KVO初探
//
//  Created by Alan on 4/28/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import "XZViewController.h"
#import "XZStudent.h"

static void *PersonNickContext = &PersonNickContext;
static void *PersonNameContext = &PersonNameContext;
static void *StudentNameContext = &StudentNameContext;

@interface XZViewController ()
@property (nonatomic, strong) XZPerson  *person;
@property (nonatomic, strong) XZStudent *student;

@end

@implementation XZViewController
- (void)dealloc
{
    [self.person removeObserver:self forKeyPath:@"name"];
    [self.person removeObserver:self forKeyPath:@"nick"];
    [self.person removeObserver:self forKeyPath:@"downloadProgress"];
    [self.person removeObserver:self forKeyPath:@"dateArray"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person  = [XZPerson new];
    self.person.writtenData = 0;
    self.person.totalData = 100;
    self.person.dateArray = [NSMutableArray array];

    self.student = [XZStudent shareInstance];
    //观察
    /**
     oc 是 c的超集
     (nullable void *)  需要填写的是null
     context  作用
        1. 使用进行标记，更安全，更加便利
     
     2.观察一定要移除，如果监听单利对象，会直接报野指针
     3.如果需求多变，需要频繁换观察者，可以先把自动监听去掉automaticallyNotifiesObserversForKey 返回NO
        ，然后需要监听那个值在值改变前后添加willchange,和didchange方法这个可以写入到set方法中
     4.多个因素影响，--下载进度 == 当前下载量/总量符合嵌套keyPathsForValuesAffectingValueForKey
     5.可变数组KVO
     **/
    [self.person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:PersonNameContext];
    [self.person addObserver:self forKeyPath:@"nick" options:NSKeyValueObservingOptionNew context:NULL];
    [self.person addObserver:self forKeyPath:@"downloadProgress" options:NSKeyValueObservingOptionNew context:NULL];
    [self.person addObserver:self forKeyPath:@"dateArray" options:NSKeyValueObservingOptionNew context:NULL];
    //多个对象  有相同的keyPath
    [self.student addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:StudentNameContext];
    
    // Do any additional setup after loading the view.
}
//回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    //context
    if (context == PersonNameContext) {
        NSLog(@"XZController--person -->%@",change);
    }else if(context == StudentNameContext)
    {
        NSLog(@"XZController--person -->%@",change);
    }else{
        NSLog(@"XZController--%@",change);
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.person.name = @"alan";

    [self.person willChangeValueForKey:@"nick"];
    self.person.nick = @"alannick";
    [self.person didChangeValueForKey:@"nick"];
    self.student.name = @"alanStudent";
    self.person.writtenData += 10;
    self.person.totalData +=20;
    //数组变化这么写是不会监听到的
    [self.person.dateArray addObject:@"1"];
    //KVO 是建立在KVC
    [[self.person mutableArrayValueForKey:@"dateArray"] addObject:@"2"];
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
