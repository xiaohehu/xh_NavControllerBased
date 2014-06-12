//
//  ViewController.m
//  xh_NavControllerBased
//
//  Created by Xiaohe Hu on 6/12/14.
//  Copyright (c) 2014 Neoscape. All rights reserved.
//

#import "ViewController.h"
#import "xh_NavViewController.h"
#import "xh_MasterViewController.h"
@interface ViewController ()
//@property (nonatomic, strong)   xh_NavViewController        *navVC;
@property (nonatomic, strong)   UINavigationController      *navigationController;
@property (nonatomic, strong)   xh_MasterViewController     *masterVC;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillLayoutSubviews
{
    [self initVC];
}

-(void)initVC
{
//    if (_masterVC) {
//        [_masterVC removeFromParentViewController];
//        [_masterVC.view removeFromSuperview];
//    }
    
    for (int i = 0; i < 5; i++) {
        UIButton *uib_menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        uib_menuItem.frame = CGRectMake(50+(100+20)*i, 200, 100, 60);
        uib_menuItem.backgroundColor = [UIColor redColor];
        NSString *str_title = [[NSString alloc] initWithFormat:@"Button No.%i",i];
        [uib_menuItem setTitle:str_title forState:UIControlStateNormal];
        uib_menuItem.tag = i;
        [uib_menuItem addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
        [self.view insertSubview:uib_menuItem atIndex:0 ];
    }
}

-(void)buttonTapped:(id)sender
{
    if (_masterVC) {
        [_masterVC removeFromParentViewController];
        [_masterVC.view removeFromSuperview];
        _masterVC.view = nil;
    }

    UIButton *tmpBtn = sender;
    int index = (int)tmpBtn.tag;
    UIStoryboard *sb_navVC = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    _navVC = [sb_navVC instantiateViewControllerWithIdentifier:@"xh_NavViewController"];
//    _navVC.view.frame = self.view.bounds;
//    [_navVC setIndexOfVC:index];
//    [self addChildViewController:_navVC];
//    [self.view addSubview:_navVC.view];
    _masterVC = [sb_navVC instantiateViewControllerWithIdentifier:@"xh_MasterViewController"];
    [_masterVC setIndexOfVC:index];
    _masterVC.view.frame = self.view.bounds;

//    _navigationController = [[UINavigationController alloc] initWithRootViewController:_masterVC];
//    _navigationController.view.frame = self.view.bounds;
    [self addChildViewController:_masterVC];
    [self.view addSubview:_masterVC.view];

//    [self.view addSubview:_masterVC.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
