/// @description Movement and Collision

//Get keyboard inputs
rightKey = keyboard_check(vk_right);		//Check if right is pressed 1 or 0 
leftKey = keyboard_check(vk_left);			//Check if left is pressed 1 or 0
upKey = keyboard_check(vk_up);			//Check if left is pressed 1 or 0
downKey = keyboard_check(vk_down);		//Check if left is pressed 1 or 0

//Getting xspd and yspd
//xspd based on button presses
xspd = (rightKey - leftKey) * moveSpd;		//left/rightKey is 1 or 0 times the move speed rate of 2 (from Create Event)
//yspd based on button presses
yspd = (downKey - upKey) * moveSpd;

//Wall collision
//Collision on x axis 
//Check 1 space from player’s current x position
if place_meeting(x + xspd, y, obj_wall)
{
	//move player as close to the wall as possible to there is no gap between player and wall
	//store the sign of xspd, +, -, or 0 and check in front of player a pixel at a time 
	var _pixelCheck = sign(xspd);	

	//While there isn’t a wall from player position + 1 pixel 
	//then player can keep moving forward by pixel amount
	while !place_meeting(x + _pixelCheck, y, obj_wall)
	{
	x += _pixelCheck;
	}

	//Set x speed to 0 by stopping player if there is a wall
	xspd = 0;
}	

//Collision on y axis 
//Check 1 space from player’s current x and y position 
if place_meeting(x, y + yspd, obj_wall)
{
	//move player as close to the wall as possible to there is no gap between player and wall
	//store the sign of xspd, +, -, or 0 and check in front of player a pixel at a time 
	var _pixelCheck = sign(yspd);	

	//While there isn’t a wall from player position + 1 pixel 
	//then player can keep moving forward by pixel amount
	while !place_meeting(x + xspd, y + _pixelCheck, obj_wall)
	{
		y += _pixelCheck;
	}

	//Set y speed to 0 by stopping player if there is a wall
	yspd = 0;
}	

//Move the player 
x += xspd;
y += yspd;