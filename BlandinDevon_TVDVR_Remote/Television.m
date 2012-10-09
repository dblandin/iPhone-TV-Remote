//
//  Television.m
//  BlandinDevon_TVDVR_Remote
//
//  Created by Devon Blandin on 10/8/12.
//  Copyright (c) 2012 Devon Code Shop. All rights reserved.
//

#import "Television.h"

@implementation Television

@synthesize power;

int ON = 1;
int OFF = 0;

-(id) init
{
    self = [super init];
    if (self) {
        channel = 1;
        volume = 20;
        [self powerOff];
    }
    return self;
}

-(void) powerOn
{
    if (self.power == OFF)
    {
        [self setPower:ON];
    }
}

-(void) powerOff
{
    if (self.power == ON)
    {
        [self setPower:OFF];
    }
}

-(int) channel
{
    int c = -1;
    if (power == ON)
    {
        c = channel;
    }
    return c;
}

-(int) setChannel:(int)channelIn
{
    int c = -1;
    
    if (power == ON)
    {
        float secondsSinceLastPress = CFAbsoluteTimeGetCurrent() - lastChannelPress;
        if (secondsSinceLastPress < 1)
        {
            int channelCombined = [[NSString stringWithFormat:@"%d%d", channel, channelIn] intValue];
            if (channelCombined >= 1 && channelCombined <= 99)
            {
                channel = channelCombined;
            }
            else
            {
                channel = [[NSString stringWithFormat:@"%d%d", channel % 10, channelIn] intValue];
            }
            
        }
        else
        {
            channel = channelIn;
        }
        c = channel;
        lastChannelPress = CFAbsoluteTimeGetCurrent();
    }
    return c;
}

-(int) channelUp
{
    int c = -1;
    
    if (power == ON)
    {
        if ((channel + 1) <= 99)
        {
            c = channel = channel + 1;
        }
        else {
            c = channel;
        }
    }
    return c;
}

-(int) channelDown
{
    int c = -1;
    
    if (power == ON)
    {
        if ((channel - 1) >= 1)
        {
            c = channel = channel - 1;
        }
        else {
            c = channel;
        }
    }
    return c;
}

-(int) volumeUp
{
    int v = -1;
    
    if (power == ON)
    {
        if ((volume + 1) <= 99)
        {
            v = volume = volume + 1;
        }
        else {
            v = volume;
        }
    }
    return v;
}

-(int) volumeDown
{
    int v = -1;
    
    if (power == ON)
    {
        if ((volume - 1) >= 1)
        {
            v = volume = volume - 1;
        }
        else {
            v = volume;
        }
    }
    return v;
}

-(int) volume
{
    int v = -1;
    if (power == ON)
    {
        v = volume;
    }
    return v;
}

-(int) setVolume:(int)volumeIn
{
    int v = -1;
    
    if (power == ON)
    {
        if (volumeIn >= 1 && volumeIn <= 99)
        {
            volume = volumeIn;
        }
        
        v = volume;
    }
    
    return v;
}

@end
