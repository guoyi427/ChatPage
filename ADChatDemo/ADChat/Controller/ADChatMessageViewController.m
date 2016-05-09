//
//  ADChatMessageViewController.m
//  ADChatDemo
//
//  Created by guoyi on 16/5/4.
//  Copyright © 2016年 帅毅. All rights reserved.
//

#import "ADChatMessageViewController.h"

//  View
#import "ADChatSendCell.h"
#import "ADChatReceiveCell.h"
#import "ADChatTimeCell.h"
#import "ADChatKeyboardToolView.h"

//  Model
#import "ADChatModel.h"

@interface ADChatMessageViewController () <UITableViewDelegate, UITableViewDataSource>
{
    //  View
    UITableView *_tableView;
    ADChatKeyboardToolView *_chatToolView;
    
    //  Model
    NSMutableArray *_chatModelList;
}
@end

static NSString *Identifer_ReceiveCell = @"receiveCell";
static NSString *Identifer_SendCell = @"sendCell";
static NSString *Identifer_TimeCell = @"timeCell";

@implementation ADChatMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self _prepareTableView];
    [self _prepareChatModelList];
    [self _prepareChatKeyboardToolView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Prepare

- (void)_prepareChatModelList {
    _chatModelList = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i ++) {
        ADChatModel *model = [[ADChatModel alloc] init];
        model.content = @"的失联客机阿斯兰的减肥拉斯柯达家里看就发来上课都放假阿里的开始就法来得快激发了斯柯达放假阿里框架";
        model.messageType = 1;
        model.cellType = i % 3 + 1;
        model.createTime = 10;
        [_chatModelList addObject:model];
    }
    
    [_tableView reloadData];
}

- (void)_prepareTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[ADChatSendCell class] forCellReuseIdentifier:Identifer_SendCell];
    [_tableView registerClass:[ADChatReceiveCell class] forCellReuseIdentifier:Identifer_ReceiveCell];
    [_tableView registerClass:[ADChatTimeCell class] forCellReuseIdentifier:Identifer_TimeCell];
    _tableView.estimatedRowHeight = 80;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
}

- (void)_prepareChatKeyboardToolView {
    _chatToolView = [ADChatKeyboardToolView toolView];
    [self.view addSubview:_chatToolView];
}


#pragma mark - TableView - Delegate & Datasources

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ADChatModel *model = nil;
    if (_chatModelList.count > indexPath.row) {
        model = _chatModelList[indexPath.row];
    }
    
    UITableViewCell *cell;
    
    switch (model.cellType) {
        case ADChatModelCellType_Send:
        {
            ADChatSendCell *sendCell = [tableView dequeueReusableCellWithIdentifier:Identifer_SendCell];
            [sendCell updateModel:model];
            cell = sendCell;
        }
            break;
        case ADChatModelCellType_Receive:
        {
            ADChatReceiveCell *receiveCell = [tableView dequeueReusableCellWithIdentifier:Identifer_ReceiveCell];
            [receiveCell updateModel:model];
            cell = receiveCell;
        }
            break;
        case ADChatModelCellType_Time:
        {
            ADChatTimeCell *timeCell = [tableView dequeueReusableCellWithIdentifier:Identifer_TimeCell];
            [timeCell updateModel:model];
            
            cell = timeCell;
        }
            break;
            
        default:
        {
            cell = [[UITableViewCell alloc] init];
        }
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _chatModelList.count;
}

#pragma mark - ScrollView - Delegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [_chatToolView hideKeyboard];
}

@end
