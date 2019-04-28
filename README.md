# ADR_Switch_Ruby_Demo
Some basic usage of the Ruby editor &amp; interpreter hidden in "A Dark Room" released on the Nintendo Switch


## Disclaimer
I'm by no means a Ruby expert, or even a great resource on best practices and proper syntax. These are some of my quick scripts and notes when investigating a game developed by Amir Rajan. He provided several example files to (I belive) help people mod the game at https://github.com/amirrajan/power-overwhelming but has no affiliation to me or this repository otherwise. 


### Editor Usage
To try any of the files provided you need to have "A Dark Room" installed from the Nintendo Eshop. Unfortunately, at the time of writing, Rajan's game has been removed from the Eshop. (But I still reccomend getting it for IOS or Android, as it's a very good game in it's own right) You also need a usb keyboard, as well as the Switch dock, or a compatable usb -> type c adapter. 



#### Navigating the Editor       

|  Action             |  Keyboard Shortcut  |
|---------------------|---------------------|
|  Change buffer (+1) |  Tab                |
|  Change buffer (-1) |   Shift + Tab       |
|  Delete line        |   Shift + Backspace |


### Syntax Basics
The game runs on the [Dragonruby game engine](https://dragonruby.itch.io/dragonruby-gtk) which interprets the mRuby language. mRuby is just a minimalistic branch of Ruby, which is a pretty popular scripting language known for being pretty efficient and relatively easy to read and work with. 


#### mRuby Syntax
Ruby is a dynamic and strongly typed languge. You can always declare a variable with a traditional snake_case, but the language has some unique ways to define specially scoped variables...


|  Scope     |  Syntax  |
|------------|----------|
|  Local     |  \_var   |
|  Global    |  $var    |
|  Instance  |  @var    |
|  Class     |  @@var   |
|  Constant  |  Var     |


`>>` " is a unique 'operator' those new to Ruby will encounter pretty often in this example. It's actually a method which can do a couple cool things, but is used most often in the context of the Dragonruby engine to append a value to the end of an array. 


`#` is used for writing single line comments 


`=begin` will start a block comment and `=end` will end a block comment


#### Available globals
|  globals |
|----------|
|  $layout |
|  $ffi    |
|  $game   |
|  $dragon |
|  $repl   |
|  $stdout |
|  $stderr |
|  $/      |
|  $stdin  |
|  $1      |
|  $2      |
|  $3      |
|  $4      |
|  $5      |
|  $6      |
|  $7      |
|  $8      |
|  $9      |


#### Rubydragon
There already exists documentation on basic usage on the [Dragonruby website](https://dragonruby.itch.io/dragonruby-gtk) but I have some notes that still might come in handy. The function you interface with the most is tick.
```
def tick args
  args.labels << [50, 50, $dragon.root.tick_count] 
end
``` 
This example function will display the current "tick" count in the top left corner of the screen. A tick is basically a frame or a single update of the game engine. You can access the tick data, and much more using the `$dragon` object. This global is the primary way of handling engine attributes.

|  $dragon attributes  |
|----------------------|
|  paused											|
|  sounds											|
|  tick_count										|
|  font_sm_sm_sm							|
|  font_sm_sm									|
|  font_sm											|
|  font_med										|
|  font_lg_lg										|
|  aligned_left									|
|  aligned_center								|
|  aligned_right									|
|  labels												|
|  solids												|
|  borders											|
|  lines												|
|  sprites												|
|  mouse											|
|  keyboard										|
|  screen											|
|  files_reloaded								|
|  reloaded_files								|
|  player_1_up								|
|  player_1_down							|
|  player_1_left								|
|  player_1_right								|
|  player_1_accept							|
|  player_1_a									|
|  player_1_b									|
|  player_1_x									|
|  player_1_y									|
|  player_1_l									|
|  player_1_r									|
|  player_1_l2								|
|  player_1_r2								|
|  player_1_l3								|
|  player_1_r3								|
|  player_1_up_key_down			|
|  player_1_down_key_down		|
|  player_1_left_key_down			|
|  player_1_right_key_down		|
|  player_1_accept_key_down	|	
|  player_1_a_key_down				|
|  player_1_b_key_down				|
|  player_1_x_key_down				|
|  player_1_y_key_down				|
|  player_1_l_key_down				|
|  player_1_r_key_down				|
|  player_1_l2_key_down			|
|  player_1_r2_key_down			|
|  player_1_l3_key_down			|	
|  player_1_r3_key_down			|
|  player_1_a_key_held				|
|  player_1_b_key_held				|
|  player_1_x_key_held				|
|  player_1_y_key_held				|
|  player_1_l_key_held					|
|  player_1_r_key_held					|
|  player_1_l2_key_held				|
|  player_1_r2_key_held			|
|  player_1_l3_key_held				|
|  player_1_r3_key_held			|
|  player_2_up								|
|  player_2_down							|
|  player_2_left								|
|  player_2_right								|
|  player_2_accept							|
|  player_2_a									|
|  player_2_b									|
|  player_2_x									|
|  player_2_y									|
|  player_2_l									|
|  player_2_r									|
|  player_2_l2								|
|  player_2_r2								|
|  player_2_l3								|
|  player_2_r3								|
|  player_2_up_key_down			|
|  player_2_down_key_down		|
|  player_2_left_key_down			|
|  player_2_right_key_down		|
|  player_2_accept_key_down  |
|  player_2_a_key_down      |
|  player_2_b_key_down				  |
|  player_2_x_key_down				  |
|  player_2_y_key_down				  |
|  player_2_l_key_down				  |
|  player_2_r_key_down				  |
|  player_2_l2_key_down			    |
|  player_2_r2_key_down			    |
|  player_2_l3_key_down			    |
|  player_2_r3_key_down			    |
|  player_2_a_key_held				  |
|  player_2_b_key_held				  |
|  player_2_x_key_held				  |
|  player_2_y_key_held				  |
|  player_2_l_key_held					|
|  player_2_r_key_held					|
|  player_2_l2_key_held				  |
|  player_2_r2_key_held			    |
|  player_2_l3_key_held				  |
|  player_2_r3_key_held			    |
|  mouse_x										  |
|  mouse_y										  |
|  primitives										|
|  origin_x											|
|  origin_y											|
|  pos_x_direction							|
|  pos_y_direction							|


#### A Dark Room Modification  
Instances of the game can be accessed with the @game object. 
```
@game = Game.new # this will create a new instance of the game
def tick args
  args.labels >> [ 50, 50, @game.to_s ]
  game.room.light_fire
  game.room.unlock_forest
end
```
