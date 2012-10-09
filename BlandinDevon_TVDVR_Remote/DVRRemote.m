//
//  DVRRemote.m
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import "DVRRemote.h"

@implementation DVRRemote

@synthesize dvr;

-(id) initRemoteFor:(DVR*) DVRIn
{
    self = [super init];
    if (self) {
        [self setDvr: DVRIn];
    }
    return self;
}

-(NSString*) play
{
    return [dvr play];
}

-(NSString*) stop
{
    return [dvr stop];
}

-(NSString*) pause
{
    return [dvr pause];
}

-(NSString*) record
{
    return [dvr record];
}

-(NSString*) FF
{
    return [dvr FF];
}

-(NSString*) RW
{
    return [dvr RW];
}

-(NSString*) powerOn
{
    return [dvr powerOn];
}

-(NSString*) powerOff
{
    return [dvr powerOff];
}

@end
