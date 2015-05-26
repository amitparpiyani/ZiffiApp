//
//  ViewController.m
//  Ziffi
//
//  Created by Amit Parpiyani on 18/05/15.
//  Copyright (c) 2015 DevPods. All rights reserved.
//

#import "ViewController.h"
#import "ServiceManager.h"
#import <JSONModel.h>
#import "SaloonSearchResult.h"
#import "PreloaderViewController.h"
#import "ZiffiSaloonManager.h"
#import "ZiffiSaloonDataSource.h"
#import "SaloonInfoTableViewCell.h"

@interface ViewController ()<UISearchBarDelegate>
{
    PreloaderViewController *preLoaderViewController;
    ZiffiSaloonDataSource *ziffiDataSource;
    __weak IBOutlet UITableView *resultsTableView;
    __weak IBOutlet UISearchBar *searchBarOutlet;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    //[self addPreLoaderViewViewController];
    ZiffiSaloonManager *ziffiSaloonManager = [ZiffiSaloonManager getInstance];
    [ziffiSaloonManager fetchDataFromServerForPageNO:0];
    ziffiDataSource = [[ZiffiSaloonDataSource alloc] init];
    searchBarOutlet.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saloonDataUpdated) name:@"SaloonDataUpdated" object:nil];
    if ([[[ZiffiSaloonManager getInstance] getSaloonArray] count] > 0)
    {
        [resultsTableView reloadData];
    }
    else
    {
        [self addPreLoaderViewViewController];
        
    }
    UINib *saloonInfoTableViewCell = [UINib nibWithNibName:@"SaloonInfoTableViewCell" bundle:[NSBundle mainBundle]];
    [resultsTableView registerNib:saloonInfoTableViewCell forCellReuseIdentifier:@"SaloonInfoCell"];
    resultsTableView.estimatedRowHeight = 260.0f;
    resultsTableView.rowHeight = UITableViewAutomaticDimension;
    resultsTableView.dataSource = ziffiDataSource;
    resultsTableView.delegate = ziffiDataSource;
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [resultsTableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saloonDataUpdated
{
    [self removePreLoaderViewController];
    [resultsTableView reloadData];
}

-(void)addPreLoaderViewViewController
{
    preLoaderViewController = [[PreloaderViewController alloc] initWithNibName:@"PreloaderViewController" bundle:nil];
    preLoaderViewController.view.frame = self.view.frame;
    [preLoaderViewController.activityIndicator startAnimating];
    preLoaderViewController.msgLabel.text=NSLocalizedString(@"searching", @"searching Lbl");
    [self addChildViewController:preLoaderViewController];
    [self.view addSubview:preLoaderViewController.view];
    [preLoaderViewController didMoveToParentViewController:self];
}

-(void)removePreLoaderViewController
{
    [preLoaderViewController.view removeFromSuperview];
    [preLoaderViewController willMoveToParentViewController:nil];
    [preLoaderViewController removeFromParentViewController];
    preLoaderViewController = nil;
}

#pragma -mark Searchbardelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [searchBar resignFirstResponder];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text = @"";
    [searchBar resignFirstResponder];
}
@end
