/*
 Copyright 2016 OpenMarket Ltd
 Copyright 2017 Vector Creations Ltd
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MessagesSearchResultAttachmentBubbleCell.h"

#import "RiotDesignValues.h"

@implementation MessagesSearchResultAttachmentBubbleCell

- (void)customizeTableViewCellRendering
{
    [super customizeTableViewCellRendering];
    
    self.userNameLabel.textColor = kRiotPrimaryTextColor;
    
    self.roomNameLabel.textColor = kRiotSecondaryTextColor;
    
    self.messageTextView.tintColor = kRiotColorGreen;
}

- (void)render:(MXKCellData *)cellData
{
    [super render:cellData];
    
    if (bubbleData)
    {
        MXRoom* room = [bubbleData.mxSession roomWithRoomId:bubbleData.roomId];
        if (room)
        {
            self.roomNameLabel.text = room.summary.displayname;
            if (!self.roomNameLabel.text.length)
            {
                self.roomNameLabel.text = NSLocalizedStringFromTable(@"room_displayname_no_title", @"Vector", nil);
            }
        }
        else
        {
            self.roomNameLabel.text = bubbleData.roomId;
        }
    }
}

@end
