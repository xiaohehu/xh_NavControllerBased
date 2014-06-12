//
//  xh_MasterViewController.m
//  xh_NavControllerBased
//
//  Created by Xiaohe Hu on 6/12/14.
//  Copyright (c) 2014 Neoscape. All rights reserved.
//

#import "xh_MasterViewController.h"
#import "xh_subViewController.h"

@interface xh_MasterViewController ()
//@property (nonatomic, strong)   xh_NavViewController        *navVC;
@property (nonatomic, strong)       UINavigationController      *navContorller;
@property (nonatomic, strong)       xh_subViewController        *subVC;
@end

@implementation xh_MasterViewController
@synthesize indexOfVC;

-(void)setIndexOfVC:(int)index
{
    indexOfVC = index;
    [self loadVC];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    for (int i = 0; i < 5; i++) {
//        UIButton *uib_menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
//        uib_menuItem.frame = CGRectMake(50+(100+20)*i, 230, 100, 60);
//        uib_menuItem.backgroundColor = [UIColor blackColor];
//        NSString *str_title = [[NSString alloc] initWithFormat:@"Button No.%i",i];
//        [uib_menuItem setTitle:str_title forState:UIControlStateNormal];
//        uib_menuItem.tag = i;
////        [uib_menuItem addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
//        [self.view addSubview: uib_menuItem];
//    }
    
    NSLog(@"The navigation bar is %@", [self.navigationController.navigationBar description]);
}

-(void)loadVC
{
    NSLog(@"\n\n The index is %i", indexOfVC);
    
//    for (int i = 0; i < indexOfVC+1; i++) {
//        UIButton *uib_menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
//        uib_menuItem.frame = CGRectMake(50+(100+20)*i, 230, 100, 60);
//        uib_menuItem.backgroundColor = [UIColor blackColor];
//        NSString *str_title = [[NSString alloc] initWithFormat:@"Button No.%i",i];
//        [uib_menuItem setTitle:str_title forState:UIControlStateNormal];
//        uib_menuItem.tag = i;
//        [uib_menuItem addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
//        [self.view addSubview: uib_menuItem];
//    }
    _subVC = [[xh_subViewController alloc] init];
    _subVC.view.frame = self.view.bounds;
    _navContorller = [[UINavigationController alloc] initWithRootViewController:_subVC];


    [self addChildViewController:_navContorller];
    [self.view addSubview: _navContorller.view];
    [_navContorller didMoveToParentViewController:self];
}

-(void)buttonTapped:(id)sender
{
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
    self.view = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
