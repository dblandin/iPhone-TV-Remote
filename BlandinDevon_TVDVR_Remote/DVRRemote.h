//
//  DVRRemote.h
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DVR.h"

@interface DVRRemote : NSObject

@property DVR *dvr;
-(id) initRemoteFor:(DVR*) DVRIn;
-(NSString*) stop;
-(NSString*) play;
-(NSString*) pause;
-(NSString*) record;
-(NSString*) FF;
-(NSString*) RW;
-(NSString*) powerOn;
-(NSString*) powerOff;

@end
