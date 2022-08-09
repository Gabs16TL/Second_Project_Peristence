-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2022-08-09 09:43:43 CST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE




CREATE TABLE board (
    id_board                       NUMBER(4) NOT NULL,
    freepositions                  NUMBER(4),
    tictactoeturn_id_tictactoeturn NUMBER(4) NOT NULL
);

ALTER TABLE board ADD CONSTRAINT board_pk PRIMARY KEY ( id_board );

CREATE TABLE box (
    id_box         NUMBER(4) NOT NULL,
    boxesx         NUMBER(4),
    boxeso         NUMBER(4),
    piece          VARCHAR2(10),
    board_id_board NUMBER(4) NOT NULL
);

ALTER TABLE box ADD CONSTRAINT box_pk PRIMARY KEY ( id_box );

CREATE TABLE game (
    id_game  NUMBER(4) NOT NULL,
    gamename VARCHAR2(15)
);

ALTER TABLE game ADD CONSTRAINT game_pk PRIMARY KEY ( id_game );

CREATE TABLE hangedman (
    id_hangedman               NUMBER(4) NOT NULL,
    completed                  CHAR(1),
    hangmanturn_id_hangmanturn NUMBER(4) NOT NULL
);

ALTER TABLE hangedman ADD CONSTRAINT hangedman_pk PRIMARY KEY ( id_hangedman );

CREATE TABLE hangmanturn (
    id_hangmanturn           NUMBER(4) NOT NULL,
    giver                    NUMBER(4),
    guesser                  NUMBER(4),
    playerturn_id_playerturn NUMBER(4) NOT NULL
);

ALTER TABLE hangmanturn ADD CONSTRAINT hangmanturn_pk PRIMARY KEY ( id_hangmanturn );

CREATE TABLE player (
    id_player                    NUMBER(4) NOT NULL,
    playername                   VARCHAR2(50),
    win_points                   NUMBER(4),
    loose_points                 NUMBER(4),
    typeofplayer_id_typeofplayer NUMBER(4) NOT NULL
);

ALTER TABLE player ADD CONSTRAINT player_pk PRIMARY KEY ( id_player );

CREATE TABLE playerturn (
    id_playerturn     NUMBER(4) NOT NULL,
    player_id_player  NUMBER(4) NOT NULL,
    turn_id_turn      NUMBER(4) NOT NULL,
    turn_game_id_game NUMBER(4) NOT NULL
);

ALTER TABLE playerturn ADD CONSTRAINT playerturn_pk PRIMARY KEY ( id_playerturn );

CREATE TABLE secretword (
    id_secretword          NUMBER(4) NOT NULL,
    letters                VARCHAR2(15),
    possitions             NUMBER(4),
    hangedman_id_hangedman NUMBER(4) NOT NULL
);

ALTER TABLE secretword ADD CONSTRAINT secretword_pk PRIMARY KEY ( id_secretword );

CREATE TABLE tictactoeturn (
    id_tictactoeturn         NUMBER(4) NOT NULL,
    piecex                   NUMBER(4),
    pieceo                   NUMBER(4),
    playerturn_id_playerturn NUMBER(4) NOT NULL
);

ALTER TABLE tictactoeturn ADD CONSTRAINT tictactoeturn_pk PRIMARY KEY ( id_tictactoeturn );

CREATE TABLE turn (
    id_turn      NUMBER(4) NOT NULL,
    turns        NUMBER(4) NOT NULL,
    players      NUMBER(4) NOT NULL,
    game_id_game NUMBER(4) NOT NULL
);

ALTER TABLE turn ADD CONSTRAINT turn_pk PRIMARY KEY ( id_turn,
                                                      game_id_game );

CREATE TABLE typeofplayer (
    id_typeofplayer NUMBER(4) NOT NULL,
    typeofplayer    VARCHAR2(25)
);

ALTER TABLE typeofplayer ADD CONSTRAINT typeofplayer_pk PRIMARY KEY ( id_typeofplayer );

ALTER TABLE board
    ADD CONSTRAINT board_tictactoeturn_fk FOREIGN KEY ( tictactoeturn_id_tictactoeturn )
        REFERENCES tictactoeturn ( id_tictactoeturn );

ALTER TABLE box
    ADD CONSTRAINT box_board_fk FOREIGN KEY ( board_id_board )
        REFERENCES board ( id_board );

ALTER TABLE hangedman
    ADD CONSTRAINT hangedman_hangmanturn_fk FOREIGN KEY ( hangmanturn_id_hangmanturn )
        REFERENCES hangmanturn ( id_hangmanturn );

ALTER TABLE hangmanturn
    ADD CONSTRAINT hangmanturn_playerturn_fk FOREIGN KEY ( playerturn_id_playerturn )
        REFERENCES playerturn ( id_playerturn );

ALTER TABLE player
    ADD CONSTRAINT player_typeofplayer_fk FOREIGN KEY ( typeofplayer_id_typeofplayer )
        REFERENCES typeofplayer ( id_typeofplayer );

ALTER TABLE playerturn
    ADD CONSTRAINT playerturn_player_fk FOREIGN KEY ( player_id_player )
        REFERENCES player ( id_player );

ALTER TABLE playerturn
    ADD CONSTRAINT playerturn_turn_fk FOREIGN KEY ( turn_id_turn,
                                                    turn_game_id_game )
        REFERENCES turn ( id_turn,
                          game_id_game );

ALTER TABLE secretword
    ADD CONSTRAINT secretword_hangedman_fk FOREIGN KEY ( hangedman_id_hangedman )
        REFERENCES hangedman ( id_hangedman );

ALTER TABLE tictactoeturn
    ADD CONSTRAINT tictactoeturn_playerturn_fk FOREIGN KEY ( playerturn_id_playerturn )
        REFERENCES playerturn ( id_playerturn );

ALTER TABLE turn
    ADD CONSTRAINT turn_game_fk FOREIGN KEY ( game_id_game )
        REFERENCES game ( id_game );

CREATE OR REPLACE TRIGGER fkntm_board BEFORE
    UPDATE OF tictactoeturn_id_tictactoeturn ON board
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table Board is violated');
END;
/

CREATE OR REPLACE TRIGGER fknto_hangedman BEFORE
    UPDATE OF hangmanturn_id_hangmanturn ON hangedman
    FOR EACH ROW
BEGIN
    IF :old.hangmanturn_id_hangmanturn IS NOT NULL THEN
        raise_application_error(-20225, 'Non Transferable FK constraint HangedMan_HangManTurn_FK on table HangedMan is violated');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER fkntm_playerturn BEFORE
    UPDATE OF player_id_player ON playerturn
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table PlayerTurn is violated');
END;
/

CREATE OR REPLACE TRIGGER fkntm_turn BEFORE
    UPDATE OF game_id_game ON turn
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table Turn is violated');
END;
/

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             21
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           4
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
