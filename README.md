MAIN TASK:
Create a simple game with webview as a game over screen. Game is about touching an aim 10 times as fast as you can.
Game screen contains a start button. Button disappears after pressing it and the aim appears in a random position. After touching the aim it moves to another random position. Game finishes when you press the aim 10 times. You win if you do it faster than 7 seconds. You lose if you are slower.
Game over screen is a full screen web view. Winner and loser got different urls to load in the webview. To get urls for winner and loser use this link : “https://2llctw8ia5.execute-api.us-west-1.amazonaws.com/prod”
OPTIONAL:
- Use SpriteKit
- Show a tutorial popup with game rules before the very first game. - Add animation for aim touching/removing
DETAILS:
Aim can be any small view (something like 64pt x 64pt) Design is up to you (its okay to use a very simple one) Fetch winner and loser url each time you play
Try not to use third party libraries
Tutorial popup is shown after the first game ever, so it's not shown after second launch. Don’t forget about navigation back to game screen (Can be a basic navigation controller) Provide link to github as a result
