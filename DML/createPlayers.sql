



--CREATE TYPES OF gameS
INSERT INTO game (id_game, gamename) VALUES (001,'HangMan');
INSERT INTO game (id_game, gamename) VALUES (002,'TicTacToe');


--CREATE TYPES OF PLAYERS
INSERT INTO typeofplayer (id_typeofplayer, typeofplayer) VALUES (001,'Human');
INSERT INTO typeofplayer (id_typeofplayer, typeofplayer) VALUES (002,'Bot');

--CREATE PLAYERS
INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (001,'Carlos',0,0,001);
INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (002,'Pedro',0,0,001);
INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (003,'Isabel',0,0,001);
INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (004,'Mariano',0,0,001);
INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (005,'Carolina',0,0,001);

INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (006,'Julia',0,0,001);
INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (007,'Rodrigo',0,0,001);
INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (008,'Juan',0,0,001);
INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (009,'Lucas',0,0,001);
INSERT INTO player (id_player,playername, win_points,loose_points, player.typeofplayer_id_typeofplayer)
VALUES (010,'Marcos',0,0,001);

----FIRST TURN

--Tic Tac Toe Turn
INSERT INTO turn (id_turn, game_id_game, end )
VALUES (001, 001, 1);

--FIRST PLAYER
INSERT INTO playerturn (id_playerturn, id_player,lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (0001, 001, 0, 0, 001,001);

UPDATE player SET win_points=+100 WHERE id_player = 001;

--SECOND PLAYER
INSERT INTO playerturn (id_playerturn, id_player,  lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (003, 002, 0, 0, 001,001);

UPDATE player SET win_points=+100 WHERE id_player = 002;

--Both Turns
INSERT INTO tictactoeturn (id_tictactoeturn, piecex, pieceo, id_playerturn)
VALUES (001, 001, 002,001);

--INSERT VALUES ON TABLE BOARD
INSERT INTO board (id_board, freepositions, board.id_tictactoeturn) 
VALUES (001,9,001);

--INSERT INTO BOXES
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (001,1,1,'O',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (002,1,2,'O',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (003,1,3,'O',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (004,2,1,'X',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (005,2,2,'X',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (006,3,1,'X',001);

----SECOND TURN
INSERT INTO turn (id_turn, game_id_game, end )
VALUES (002, 001, 1);

--FIRST PLAYER
INSERT INTO playerturn (id_playerturn, id_player,lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (002, 002, 1, 1, 002,001);

UPDATE player SET win_points=+100 WHERE id_player = 001;

--SECOND PLAYER
INSERT INTO playerturn (id_playerturn, id_player,lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (004, 002, 0, 0, 002,001);

UPDATE player SET win_points=+100 WHERE id_player = 002;

--Both Turns
INSERT INTO tictactoeturn (id_tictactoeturn, piecex,pieceo,id_playerturn)
VALUES (003, 2,1, 004);

--INSERT VALUES ON TABLE BOARD
INSERT INTO board (id_board,freepositions,id_tictactoeturn) 
VALUES (002,0,003);

--Vaciar las positions
TRUNCATE TABLE box;

--INSERT INTO BOXES
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (001,1,1,'X',002);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (002,1,2,'X',002);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (003,1,3,'X',002);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (004,2,1,'O',002);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (005,2,2,'O',002);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (006,3,1,'O',002);

--THIRD TURN

--HANGMAN
INSERT INTO turn VALUES (003, 002, 1);

-- FIRST PLAYER
INSERT INTO playerturn VALUES (005, 0, 1, 001,003,002 );
UPDATE player SET win_points = +100 WHERE id_player = 001;

--SECOND PLAYER
INSERT INTO playerturn VALUES (007, 0, 1, 001,003,002 );
UPDATE player SET win_points = +100 WHERE id_player = 002;

-- 001 VS 002
INSERT INTO hangmanturn (id_hangmanturn, giver,guesser, id_playerturn) 
VALUES (001, 005, 007,001);
INSERT INTO hangedman (id_hangedman,stillalive,notalive, id_hangmanturn)
VALUES (001, 1, 0, 001);

-- INSET INTO SECRET WORD
TRUNCATE TABLE secretword;
INSERT INTO secretWord VALUES (001, 'F', 1, 001);
INSERT INTO secretWord VALUES (002, 'R', 2, 001);
INSERT INTO secretWord VALUES (003, 'I', 3, 001);
INSERT INTO secretWord VALUES (004, 'D', 4, 001);
INSERT INTO secretWord VALUES (005, 'A', 5, 001);
INSERT INTO secretWord VALUES (006, 'Y', 6, 001);

--FOURTH TURN 

INSERT INTO turn (id_turn,game_id_game,end)
VALUES (004, 002, 1);

-- FIRST PLAYER
INSERT INTO playerturn (id_playerturn, id_player,lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (006, 004, 0, 1,003 ,002);
UPDATE player SET loose_points = -100 WHERE id_player = 006;

--SECOND PLAYER
INSERT INTO playerturn (id_playerturn, id_player,lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (008, 004, 0,1,002, 1);
UPDATE player SET win_points =  + 100 WHERE id_player = 008;


-- 001 VS 002
INSERT INTO hangmanturn VALUES (002,002, 006, 008);
INSERT INTO hangedman VALUES (002, 1, 0, 002);

-- INSET INTO SECRET WORD
TRUNCATE TABLE secretword;
INSERT INTO secretWord VALUES (001, 'S', 1, 002);
INSERT INTO secretWord VALUES (002, 'U', 2, 002);
INSERT INTO secretWord VALUES (003, 'N', 3, 002);
INSERT INTO secretWord VALUES (004, 'D', 4, 002);
INSERT INTO secretWord VALUES (005, 'A', 5, 002);
INSERT INTO secretWord VALUES (006, 'Y', 6, 002);
commit;


--FIVETH TURN 

INSERT INTO turn (id_turn,game_id_game,end)
VALUES (005, 002, 1);

-- FIRST PLAYER
INSERT INTO playerturn (id_playerturn, id_player,lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (009, 009, 1, 1,003 ,002);
UPDATE player SET loose_points = -100 WHERE id_player = 009;

--SECOND PLAYER
INSERT INTO playerturn (id_playerturn, id_player,lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (010, 010, 1,1,002, 002);
UPDATE player SET win_points =  + 100 WHERE id_player = 010;


-- 001 VS 002
INSERT INTO hangmanturn  (id_hangmanturn,giver,guesser,id_playerturn) 
VALUES (003,002, 009, 010);
INSERT INTO hangedman (id_hangedman,stillalive,notalive,id_hangmanturn)
VALUES (003, 0, 1, 003);

-- INSET INTO SECRET WORD
TRUNCATE TABLE secretword;
INSERT INTO secretWord VALUES (001, 'M', 1, 002);
INSERT INTO secretWord VALUES (002, 'O', 2, 002);
INSERT INTO secretWord VALUES (003, 'N', 3, 002);
INSERT INTO secretWord VALUES (004, 'D', 4, 002);
INSERT INTO secretWord VALUES (005, 'A', 5, 002);
INSERT INTO secretWord VALUES (006, 'Y', 6, 002);
commit;


--SIXTH TURN 
INSERT INTO turn (id_turn,game_id_game,end)
VALUES (006, 002, 1);

-- FIRST PLAYER
INSERT INTO playerturn (id_playerturn, id_player,lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (011, 008, 1, 1,004 ,002);
UPDATE player SET loose_points = -100 WHERE id_player = 008;

--SECOND PLAYER
INSERT INTO playerturn (id_playerturn, id_player,lastturn, winn, turn_id_turn, turn_game_id_game)
VALUES (012, 005, 1,1,002, 002);
UPDATE player SET win_points =  + 100 WHERE id_player = 005;


-- 001 VS 002
INSERT INTO hangmanturn  (id_hangmanturn,giver,guesser,id_playerturn) 
VALUES (004,008, 005, 011);
INSERT INTO hangedman (id_hangedman,stillalive,notalive,id_hangmanturn)
VALUES (004, 0, 1, 004);
commit;

-- INSET INTO SECRET WORD
TRUNCATE TABLE secretword;
INSERT INTO secretWord VALUES (001, 'S', 1, 002);
INSERT INTO secretWord VALUES (002, 'O', 2, 002);
INSERT INTO secretWord VALUES (003, 'N', 3, 002);
INSERT INTO secretWord VALUES (004, 'D', 4, 002);
INSERT INTO secretWord VALUES (005, 'A', 5, 002);
INSERT INTO secretWord VALUES (006, 'Y', 6, 002);
commit;

--el jugador con más partidas jugadas
SELECT id_player, playername,winn FROM player  
INNER JOIN playerturn  ON player.id_player = playerturn.id_player
WHERE id_player=002;