//
//  ViewController.m
//  GYZCustomActionSheet
//
//  Created by GYZ on 16/6/20.
//  Copyright © 2016年 GYZ. All rights reserved.
//

#import "ViewController.h"
#import "GYZActionSheet.h"
#import "GYZAlertView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,GYZActionSheetDelegate,GYZAlertViewDelegate>
@property (nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) NSMutableArray *selectSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self loadDataSource];
}

- (void)loadDataSource
{
    self.dataSource = [NSMutableArray new];
    [_dataSource addObject:@"普通模式"];
    [_dataSource addObject:@"变色变字模式"];
    [_dataSource addObject:@"行数超多模式"];
    [_dataSource addObject:@"WeiChat模式"];
    [_dataSource addObject:@"WeiChat多行模式"];
    [_dataSource addObject:@"TableView模式"];
    [_dataSource addObject:@"CustomAlertView"];
    
    self.selectSource = [NSMutableArray new];
    
    for (int i = 0; i < self.dataSource.count; i++) {
        [_selectSource addObject:@""];
    }
}

#pragma mark - UITableView数据源和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.font = [UIFont systemFontOfSize:20.0];
    cell.textLabel.text = _dataSource[indexPath.row];
    cell.detailTextLabel.text = _selectSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 选中后立即取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.row) {
        case 0:
        {
            GYZActionSheet *actionSheet = [[GYZActionSheet alloc] initSheetWithTitle:nil style:GYZSheetStyleDefault itemTitles:@[@"头等舱",@"商务舱",@"经济舱",@"不限"]];
            __weak typeof(self) weakSelf = self;
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                NSString *text = [NSString stringWithFormat:@"第%ld行,%@",index, title];
                [weakSelf.selectSource replaceObjectAtIndex:indexPath.row withObject:text];
                [weakSelf.tableView reloadData];
            }];
            
        }
            break;
        case 1:
        {
            GYZActionSheet *actionSheet = [[GYZActionSheet alloc] initSheetWithTitle:@"选择舱位" style:GYZSheetStyleDefault itemTitles:@[@"头等舱",@"商务舱",@"经济舱",@"不限"]];
            actionSheet.titleTextFont = [UIFont systemFontOfSize:15];
            actionSheet.itemTextFont = [UIFont systemFontOfSize:18];
            actionSheet.cancleTextFont = [UIFont systemFontOfSize:16];
            actionSheet.titleTextColor = [UIColor redColor];
            actionSheet.itemTextColor = [UIColor orangeColor];
            actionSheet.cancleTextColor = [UIColor blackColor];
            __weak typeof(self) weakSelf = self;
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                NSString *text = [NSString stringWithFormat:@"第%ld行,%@",index, title];
                [weakSelf.selectSource replaceObjectAtIndex:indexPath.row withObject:text];
                [weakSelf.tableView reloadData];
            }];
        }
            break;
        case 2:
        {
            GYZActionSheet *actionSheet = [[GYZActionSheet alloc] initSheetWithTitle:@"席座选择" style:GYZSheetStyleDefault itemTitles:@[@"头等舱",@"商务舱",@"经济舱",@"特等座",@"一等座",@"二等座",@"软座",@"硬座",@"头等舱",@"商务舱",@"经济舱",@"特等座",@"一等座",@"二等座",@"软座",@"硬座",@"不限"]];
            __weak typeof(self) weakSelf = self;
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                NSString *text = [NSString stringWithFormat:@"第%ld行,%@",index, title];
                [weakSelf.selectSource replaceObjectAtIndex:indexPath.row withObject:text];
                [weakSelf.tableView reloadData];
            }];
        }
            break;
        case 3:
        {
            GYZActionSheet *actionSheet = [[GYZActionSheet alloc] initSheetWithTitle:nil style:GYZSheetStyleWeiChat itemTitles:@[@"头等舱",@"商务舱",@"经济舱",@"不限"]];
            __weak typeof(self) weakSelf = self;
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                NSString *text = [NSString stringWithFormat:@"第%ld行,%@",index, title];
                [weakSelf.selectSource replaceObjectAtIndex:indexPath.row withObject:text];
                [weakSelf.tableView reloadData];
            }];
        }
            break;
        case 4:
        {
            GYZActionSheet *actionSheet = [[GYZActionSheet alloc] initSheetWithTitle:@"席座选择" style:GYZSheetStyleWeiChat itemTitles:@[@"头等舱",@"商务舱",@"经济舱",@"特等座",@"一等座",@"二等座",@"软座",@"硬座",@"头等舱",@"商务舱",@"经济舱",@"特等座",@"一等座",@"二等座",@"软座",@"硬座",@"不限"]];
            actionSheet.cancleTitle = @"取消选择";
            actionSheet.delegate = self;
//            __weak typeof(self) weakSelf = self;
//            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
//                NSString *text = [NSString stringWithFormat:@"第%ld行,%@",index, title];
//                [weakSelf.selectSource replaceObjectAtIndex:indexPath.row withObject:text];
//                [weakSelf.tableView reloadData];
//            }];
        }
            break;
        case 5:
        {
            GYZActionSheet *actionSheet = [[GYZActionSheet alloc] initSheetWithTitle:@"时间选择" style:GYZSheetStyleTable itemTitles:@[@"10:00",@"11:00",@"12:00",@"13:00",@"14:00",@"15:00",@"16:00",@"17:00",@"18:00",@"19:00",@"20:00",@"21:00",@"22:00",@"23:00",@"23:59"]];
            __weak typeof(self) weakSelf = self;
            [actionSheet didFinishSelectIndex:^(NSInteger index, NSString *title) {
                NSString *text = [NSString stringWithFormat:@"第%ld行,%@",index, title];
                [weakSelf.selectSource replaceObjectAtIndex:indexPath.row withObject:text];
                [weakSelf.tableView reloadData];
            }];
        }
            break;
        case 6:
        {
            GYZAlertView *alertView = [[GYZAlertView alloc] initWithTitle:@"提示" icon:nil message:@"您确定要退出登录吗？" delegate:self buttonTitles:@"取消", @"确定", nil];
            [alertView setMessageColor:[UIColor blackColor] fontSize:15.0f];
            [alertView setButtonTitleColor:[UIColor blackColor] fontSize:15.0f atIndex:0];
            [alertView setButtonTitleColor:[UIColor redColor] fontSize:15.0f atIndex:1];
            [alertView setTitleColor:[UIColor blackColor] fontSize:18.0f];
            [alertView show];
        }
            break;
        default:
            break;
    }
}


#pragma GYZActionSheetDelegate
-(void)sheetViewDidSelectIndex:(NSInteger)index title:(NSString *)title sender:(GYZActionSheet *)actionSheet{
    NSLog(@"第%ld行,%@",index, title);
}


#pragma GYZAlertViewDelegate
- (void)alertView:(GYZAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 1:
            //退出登录
            NSLog(@"点击第%ld个按钮",buttonIndex + 1);
            
            break;
            
        default:
            break;
    }
}
@end