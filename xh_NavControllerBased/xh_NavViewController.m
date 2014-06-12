//
//  xh_NavViewController.m
//  xh_NavControllerBased
//
//  Created by Xiaohe Hu on 6/12/14.
//  Copyright (c) 2014 Neoscape. All rights reserved.
//

#import "xh_NavViewController.h"
#import "xh_MasterViewController.h"
@interface xh_NavViewController ()
@property (nonatomic, strong)       xh_MasterViewController         *masterVC;
@end

@implementation xh_NavViewController

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
}
-(void)viewWillLayoutSubviews
{
    
}
-(void)loadVC {
    NSLog(@"\n\nThe incoming index is %i", indexOfVC);
    UIStoryboard *sb_navVC = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _masterVC = [sb_navVC instantiateViewControllerWithIdentifier:@"xh_MasterViewController"];
    _masterVC.view.frame = self.view.bounds;
    [self addChildViewController:_masterVC];
    [self.view addSubview:_masterVC.view];

    
    [self.topViewController presentViewController: _masterVC animated:YES completion:nil];
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
