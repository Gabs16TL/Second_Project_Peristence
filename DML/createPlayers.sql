



--CREATE TYPES OF gameS
INSERT INTO game (id_game, gamename) VALUES (001,'HangMan');
INSERT INTO game (id_game, gamename) VALUES (002,'TicTacToe');


--CREATE TYPES OF PLAYERS
INSERT INTO typeofplayer (id_typeofplayers, typeofplayer) VALUES (001,'Human');
INSERT INTO typeofplayer (id_typeofplayers, typeofplayer) VALUES (002,'Bot');

--CREATE PLAYERS
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (001,'Carlos',0,0,001);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (002,'Pedro',0,0,001);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (003,'Isabel',0,0,001);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (004,'Mariano',0,0,001);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (005,'Carolina',0,0,001);

INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (006,'Julia',0,0,001);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (007,'Rodrigo',0,0,001);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (008,'Juan',0,0,001);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (009,'Lucas',0,0,001);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typeofplayers)
VALUES (010,'Marcos',0,0,001);

--Tic Tac Toe Turn


----FIRST TURN
INSERT INTO turn (id_turn, id_game,end )
VALUES (001, 001, 1);

--FIRST PLAYER
INSERT INTO playerturn (id_playerturn, id_player,  lastturn,winn, turn_id_turn,turn_game_id_game)
VALUES (001, 001, 0, 0, 001);

UPDATE player SET win=+100 WHERE id_player = 001;

--SECOND PLAYER
INSERT INTO playerturn (id_playerturn, id_player,  lastturn, winn, turn_id_turn,turn_game_id_game)
VALUES (003, 002, 0, 0, 001);

UPDATE player SET win=+100 WHERE id_player = 002;

--Both Turns
INSERT INTO tictactoeturn (id_tictactoeturn, piecex,pieceo)
VALUES (001, 001, 002);

--INSERT VALUES ON TABLE BOARD
INSERT INTO board (id_board,freePossitions,id_tictactoeturn) 
VALUES (001,9,0);

--INSERT INTO BOXES
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (001,1,1,'O',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (001,1,2,'O',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (001,1,3,'O',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (001,2,1,'X',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (001,2,2,'X',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (001,3,1,'X',001);

----SECOND TURN
INSERT INTO turn (id_turn, id_game,end )
VALUES (002, 001, 1);

--FIRST PLAYER
INSERT INTO playerturn (id_playerturn, id_player,  lastturn,winn, turn_id_turn,turn_game_id_game)
VALUES (002, 002, 1, 1, 001);

UPDATE player SET win=+100 WHERE id_player = 001;

--SECOND PLAYER
INSERT INTO playerturn (id_playerturn, id_player,  lastturn, winn, turn_id_turn,turn_game_id_game)
VALUES (004, 002, 0, 0, 001);

UPDATE player SET win=+100 WHERE id_player = 002;

--Both Turns
INSERT INTO tictactoeturn (id_tictactoeturn, piecex,pieceo)
VALUES (002, 002, 004);

--INSERT VALUES ON TABLE BOARD
INSERT INTO board (id_board,freePossitions,id_tictactoeturn) 
VALUES (002,0,002);

--INSERT INTO BOXES
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (002,1,1,'X',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (002,1,2,'X',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (002,1,3,'X',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (002,2,1,'O',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (002,2,2,'O',001);
INSERT INTO box (id_box,boxesx,boxeso,piece,id_board) 
VALUES (002,3,1,'O',001);



--HANGMAN
INSERT INTO turn VALUES (003, 002, 1);

-- FIRST PLAYER
INSERT INTO playerturn VALUES (005, 0, 1, 001,003,002 );
UPDATE player SET winn = winn + 1 WHERE id = 001;

--SECOND PLAYER
INSERT INTO playerturn VALUES (007, 0, 1, 001,003,002 );
UPDATE player SET winn = winn + 1 WHERE id = 002;

-- 001 VS 002
INSERT INTO hangmanturn VALUES (001, 005, 007);
INSERT INTO hangedman VALUES (001, 001, 0, 1);

-- INSET INTO SECRET WORD
INSERT INTO secretWord VALUES (001, 'F', 1, 1);
INSERT INTO secretWord VALUES (001, 'R', 2, 1);
INSERT INTO secretWord VALUES (001, 'I', 3, 1);
INSERT INTO secretWord VALUES (001, 'D', 4, 1);
INSERT INTO secretWord VALUES (001, 'A', 5, 1);
INSERT INTO secretWord VALUES (001, 'Y', 6, 1);


INSERT INTO turns VALUES (004, 002, 1);

-- FIRST PLAYER
INSERT INTO players_turns VALUES (006, 004, 001, 1, 002);
UPDATE players SET losses = losses + 1 WHERE id = 001;

--SECOND PLAYER
INSERT INTO players_turns VALUES (008, 004, 002, 0, 1);
UPDATE players SET winnings = winnings + 1 WHERE id = 001;

-- 001 VS 002
INSERT INTO hangman_turns VALUES (002, 006, 008);
INSERT INTO hangedmen VALUES (002, 002, 1, 0);

-- INSET INTO SECRET WORD
INSERT INTO secretWord VALUES (002, 'S', 1, 1);
INSERT INTO secretWord VALUES (002, 'U', 2, 0);
INSERT INTO secretWord VALUES (002, 'N', 3, 1);
INSERT INTO secretWord VALUES (002, 'D', 4, 1);
INSERT INTO secretWord VALUES (002, 'A', 5, 0);
INSERT INTO secretWord VALUES (002, 'Y', 6, 1);

SELECT id_player, player_name FROM player pl INNER JOIN round rn ON pl.id_player=rn.player_id_player WHERE id_round=2;