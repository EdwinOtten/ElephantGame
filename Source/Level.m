//
//  Level.m
//  ElephantGame
//
//  Created by Edwin on 11/19/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Level.h"

@implementation Level
-(void)launchPeanut:(id)sender
{
    // Calculate rotation in radians
    float rotationRadians = CC_DEGREES_TO_RADIANS(_launcher.rotation+38);
    
    // Vector for rotation
    CGPoint directionVector = ccp(sinf(rotationRadians), cosf(rotationRadians));
    CGPoint peanutOffset = ccpMult(directionVector, 30);
    
    // Load peanut and set it's initial position
    CCNode* peanut = [CCBReader load:@"Peanut"];
    
    CGPoint spawnPosition = _launcher.position;
    spawnPosition.x = spawnPosition.x+25;
    spawnPosition.y = spawnPosition.y-15;
    peanut.position = ccpAdd(spawnPosition, peanutOffset);
    peanut.rotation = _launcher.rotation-50;
    peanut.scale = 0.5;
    
    [_physicsNode addChild:peanut];
    
    // Make and impulse and apply it
    CGPoint force = ccpMult(directionVector, 18000);
    [peanut.physicsBody applyForce:force];
}

@end
