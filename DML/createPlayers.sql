--CREATE TYPES OF GAMES
INSERT INTO typeGame (id_typeGame, typeGame) VALUES (001,'HangMan');
INSERT INTO typeGame (id_typeGame, typeGame) VALUES (002,'TicTacToe');


--CREATE TYPES OF PLAYERS
INSERT INTO typeofplayer (id_typeofplayers, typeofplayer) VALUES (001,'HangManPlayer');
INSERT INTO typeofplayer (id_typeofplayers, typeofplayer) VALUES (002,'TicTacToePlayer');

--CREATE PLAYERS
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typegame,  id_typeofplayers)
VALUES (001,'Carlos',100,0,001,001);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typegame,  id_typeofplayers)
VALUES (002,'Roberto',120,20,001,001);

INSERT INTO player (id_player,player_name, win_points,loose_points, id_typegame,  id_typeofplayers)
VALUES (003,'Maria',100,25,002,002);
INSERT INTO player (id_player,player_name, win_points,loose_points, id_typegame,  id_typeofplayers)
VALUES (004,'Alejandra',0,125,002,002);


--INSERT VALUES ON TABLE WORD
INSERT INTO word (id_word,secretword,guessedword,player_id_player,id_typeofplayers) 
VALUES (001,'Friday','Fri',001,001) ;
INSERT INTO word (id_word,secretword,guessedword,player_id_player,id_typeofplayers) 
VALUES (002,'Hello','Hel',002,001) ;

INSERT INTO word (id_word,secretword,guessedword,player_id_player,id_typeofplayers) 
VALUES (003,'Sun','Sun',002,001) ;
INSERT INTO word (id_word,secretword,guessedword,player_id_player,id_typeofplayers) 
VALUES (004,'Letter','Let',001,001) ;


--INSERT VALUES ON TABLE BOARD
INSERT INTO BOARD (id_board,freePossitions) VALUES (001,9);
INSERT INTO BOARD (id_board,freePossitions) VALUES (002,6);
INSERT INTO BOARD (id_board,freePossitions) VALUES (003,2);

UPDATE board  SET board.freepossitions =3 WHERE board.id_board = 002;

--TABLE PIECE
INSERT INTO piece (id_piece, piece,player_id_player,id_typeofplayers) VALUES (001,'O',003,002);
INSERT INTO piece (id_piece, piece,player_id_player,id_typeofplayers) VALUES (002,'X',004,002);

--TABLE ROUND
INSERT INTO ROUND (id_round,player_id_player,player_id_typeofplayers) VALUES (001,001,001);
INSERT INTO ROUND (id_round,player_id_player,player_id_typeofplayers) VALUES (002,002,001);
INSERT INTO ROUND (id_round,player_id_player,player_id_typeofplayers) VALUES (003,003,002);
INSERT INTO ROUND (id_round,player_id_player,player_id_typeofplayers) VALUES (004,004,002);


--TABLE TURN
INSERT INTO TURN (id_turn,round_id_round) VALUES (001,001);
INSERT INTO TURN (id_turn,round_id_round) VALUES (002,001);
INSERT INTO TURN (id_turn,round_id_round) VALUES (003,001);

INSERT INTO TURN (id_turn,round_id_round) VALUES (004,002);
INSERT INTO TURN (id_turn,round_id_round) VALUES (005,002);
INSERT INTO TURN (id_turn,round_id_round) VALUES (006,002);


--PLAYER WITH THE HIGHEST NUMBER OF GAMES PLAYED
--Falta una forma de contar en cuantas rondas ha jugado un jugador
SELECT id_player, player_name FROM player pl INNER JOIN round rn ON pl.id_player=rn.player_id_player WHERE id_round=2;