/*
BSD License

Copyright (c) 2018, Tom Everett
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. Neither the name of Tom Everett nor the names of its contributors
   may be used to endorse or promote products derived from this software
   without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

grammar tinymud;

prog
   : (line? EOL) + line?
   ;

line
   : command
   | action
   ;

command
   : bootcommand
   | chowncommand
   | createcommand
   | describecommand
   | digcommand
   | dumpcommand
   | failcommand
   | findcommand
   | linkcommand
   | lockcommand
   | namecommand
   | newpassswordcommand
   | ofailcommand
   | opencommand
   | osuccesscommand
   | passwordcommand
   | pcreatecommand
   | setcommand
   | shutdowncommand
   | statscommand
   | successcommand
   | teleportcommand
   | toadcommand
   | unlinkcommand
   | unlockcommand
   | wallcommand
   ;

bootcommand
   : '@boot' player
   ;

chowncommand
   : '@chown' object '=' player
   ;

createcommand
   : '@create' name ('=' cost)?
   ;

describecommand
   : '@describe' object ('=' description)?
   ;

digcommand
   : '@dig' name
   ;

dumpcommand
   : '@dump'
   ;

failcommand
   : '@fail' name ('=' description)?
   ;

findcommand
   : '@find' name?
   ;

linkcommand
   : '@link' object '=' (number | dir | room)
   ;

lockcommand
   : '@lock' object '=' key
   ;

namecommand
   : '@name' object '=' name password?
   ;

newpassswordcommand
   : '@newpassword' player ('=' password)?
   ;

ofailcommand
   : '@ofail' object ('=' message)?
   ;

opencommand
   : '@open' dir (';' dir)* ('=' number)?
   ;

osuccesscommand
   : '@osuccess' object ('=' message)?
   ;

passwordcommand
   : '@password' password '=' password
   ;

pcreatecommand
   : '@pcreate' name
   ;

setcommand
   : '@set' object '=' '!'? flag
   ;

shutdowncommand
   : '@shutdown'
   ;

statscommand
   : '@stats' player
   ;

successcommand
   : '@success' object ('=' message)?
   ;

teleportcommand
   : '@teleport' (object '=')? room
   ;

toadcommand
   : '@toad' player
   ;

unlinkcommand
   : '@unlink' dir
   ;

unlockcommand
   : '@unlock' object
   ;

wallcommand
   : '@wall' message
   ;

action
   : dropaction
   | examineaction
   | getaction
   | giveaction
   | gotoaction
   | gripeaction
   | helpaction
   | inventoryaction
   | killaction
   | lookaction
   | newsaction
   | pageaction
   | quitaction
   | robaction
   | sayaction
   | scoreaction
   | whisperaction
   | whoaction
   ;

dropaction
   : ('drop' | 'throw') object
   ;

examineaction
   : 'examine' object
   ;

getaction
   : ('get' | 'take') object
   ;

giveaction
   : 'give' player '=' pennies
   ;

gotoaction
   : ('go' | 'goto' | 'move') direction
   ;

gripeaction
   : 'gripe' message
   ;

helpaction
   : 'help'
   ;

inventoryaction
   : 'inventory'
   | 'inv'
   ;

killaction
   : 'kill' player ('=' cost)
   ;

lookaction
   : ('look' | 'read') object
   ;

newsaction
   : 'news'
   ;

pageaction
   : 'page' player ('=' message)
   ;

quitaction
   : 'quit'
   ;

robaction
   : 'rob' player
   ;

sayaction
   : 'say' message
   ;

scoreaction
   : 'score'
   ;

whisperaction
   : 'whisper' player '=' message
   ;

whoaction
   : 'who' player?
   ;

object
   : STRING
   ;

player
   : STRING
   ;

name
   : STRING
   ;

description
   : STRING
   ;

cost
   : NUMBER
   ;

key
   : NUMBER
   ;

password
   : STRING
   ;

message
   : STRING
   ;

dir
   : STRING
   ;

number
   : NUMBER
   ;

room
   : STRING
   ;

flag
   : NUMBER
   ;

pennies
   : NUMBER
   ;

direction
   : STRING
   ;


STRING
   : [a-zA-Z] [a-zA-Z0-9_]*
   ;


NUMBER
   : [0-9] +
   ;


EOL
   : [r\n]
   ;


WS
   : [ \t] -> skip
   ;