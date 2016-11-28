SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE User;
TRUNCATE Fiscal;
TRUNCATE Edificio;
TRUNCATE Alugavel;
TRUNCATE Arrenda;
TRUNCATE Fiscaliza;
TRUNCATE Espaco;
TRUNCATE Posto;
TRUNCATE Oferta;
TRUNCATE Aluga;
TRUNCATE Paga;
TRUNCATE Estado;
TRUNCATE Reserva;
SET FOREIGN_KEY_CHECKS = 1;


INSERT INTO User VALUES (221122, 'Antonio', 961234567);
INSERT INTO User VALUES (212121, 'Alberto', 911234567);
INSERT INTO User VALUES (123456, 'Joao', 911234568);
INSERT INTO User VALUES (121212, 'Roberto', 911234569);
INSERT INTO User VALUES (123123, 'Carlos', 911234566);
INSERT INTO User VALUES (444444, 'Daniel', 911234565);
INSERT INTO User VALUES (212122, 'Bruno', 911234564);
INSERT INTO User VALUES (202020, 'Afonso', 911234563);
INSERT INTO User VALUES (121213, 'Facas', 911234562);
INSERT INTO User VALUES (313131, 'Ana', 911234561);
INSERT INTO User VALUES (303030, 'Maria', 911234560);

INSERT INTO Fiscal VALUES (90, 'Lda');
INSERT INTO Fiscal VALUES (91, 'Lda');
INSERT INTO Fiscal VALUES (92, 'frutas');
INSERT INTO Fiscal VALUES (93, 'mudanças');
INSERT INTO Fiscal VALUES (94, 'frutas');
INSERT INTO Fiscal VALUES (95, 'desemprego');
INSERT INTO Fiscal VALUES (96, 'desemprego');

INSERT INTO Edificio VALUES ('A');
INSERT INTO Edificio VALUES ('B');
INSERT INTO Edificio VALUES ('C');
INSERT INTO Edificio VALUES ('D');
INSERT INTO Edificio VALUES ('E');
INSERT INTO Edificio VALUES ('F');
INSERT INTO Edificio VALUES ('G');
INSERT INTO Edificio VALUES ('H');
INSERT INTO Edificio VALUES ('I');

INSERT INTO Alugavel VALUES ('A', 1000, '');
INSERT INTO Alugavel VALUES ('A', 1001, '');
INSERT INTO Alugavel VALUES ('A', 1002, '');
INSERT INTO Alugavel VALUES ('A', 1003, '');
INSERT INTO Alugavel VALUES ('A', 1004, '');
INSERT INTO Alugavel VALUES ('A', 1005, '');
INSERT INTO Alugavel VALUES ('A', 1006, '');
INSERT INTO Alugavel VALUES ('A', 1007, '');
INSERT INTO Alugavel VALUES ('A', 1008, '');
INSERT INTO Alugavel VALUES ('B', 2000, '');
INSERT INTO Alugavel VALUES ('B', 2001, '');
INSERT INTO Alugavel VALUES ('B', 2002, '');
INSERT INTO Alugavel VALUES ('B', 2003, '');
INSERT INTO Alugavel VALUES ('B', 2004, '');
INSERT INTO Alugavel VALUES ('B', 2005, '');
INSERT INTO Alugavel VALUES ('B', 2006, '');
INSERT INTO Alugavel VALUES ('C', 3000, '');
INSERT INTO Alugavel VALUES ('C', 3001, '');
INSERT INTO Alugavel VALUES ('C', 3002, '');
INSERT INTO Alugavel VALUES ('D', 4000, '');
INSERT INTO Alugavel VALUES ('D', 4001, '');
INSERT INTO Alugavel VALUES ('D', 4002, '');
INSERT INTO Alugavel VALUES ('D', 4003, '');
INSERT INTO Alugavel VALUES ('D', 4004, '');
INSERT INTO Alugavel VALUES ('D', 4005, '');
INSERT INTO Alugavel VALUES ('D', 4006, '');
INSERT INTO Alugavel VALUES ('D', 4007, '');
INSERT INTO Alugavel VALUES ('D', 4008, '');
INSERT INTO Alugavel VALUES ('D', 4009, '');
INSERT INTO Alugavel VALUES ('D', 4010, '');
INSERT INTO Alugavel VALUES ('D', 4011, '');
INSERT INTO Alugavel VALUES ('D', 4012, '');
INSERT INTO Alugavel VALUES ('D', 4013, '');
INSERT INTO Alugavel VALUES ('E', 5000, '');
INSERT INTO Alugavel VALUES ('E', 5001, '');
INSERT INTO Alugavel VALUES ('E', 5002, '');
INSERT INTO Alugavel VALUES ('E', 5003, '');
INSERT INTO Alugavel VALUES ('E', 5004, '');
INSERT INTO Alugavel VALUES ('E', 5005, '');
INSERT INTO Alugavel VALUES ('E', 5006, '');
INSERT INTO Alugavel VALUES ('F', 6000, '');
INSERT INTO Alugavel VALUES ('F', 6001, '');
INSERT INTO Alugavel VALUES ('G', 7000, '');
INSERT INTO Alugavel VALUES ('G', 7001, '');
INSERT INTO Alugavel VALUES ('H', 8000, '');
INSERT INTO Alugavel VALUES ('H', 8001, '');
INSERT INTO Alugavel VALUES ('H', 8002, '');
INSERT INTO Alugavel VALUES ('I', 9000, '');
INSERT INTO Alugavel VALUES ('I', 9001, '');

INSERT INTO Espaco VALUES ('A', 1000);
INSERT INTO Espaco VALUES ('A', 1001);
INSERT INTO Espaco VALUES ('A', 1002);
INSERT INTO Espaco VALUES ('B', 2000);
INSERT INTO Espaco VALUES ('B', 2001);
INSERT INTO Espaco VALUES ('C', 3000);
INSERT INTO Espaco VALUES ('D', 4000);
INSERT INTO Espaco VALUES ('D', 4001);
INSERT INTO Espaco VALUES ('D', 4002);
INSERT INTO Espaco VALUES ('D', 4003);
INSERT INTO Espaco VALUES ('E', 5000);
INSERT INTO Espaco VALUES ('E', 5001);
INSERT INTO Espaco VALUES ('F', 6000);
INSERT INTO Espaco VALUES ('G', 7000);
INSERT INTO Espaco VALUES ('H', 8000);
INSERT INTO Espaco VALUES ('I', 9000);

INSERT INTO Posto VALUES ('A', 1003, 1000);
INSERT INTO Posto VALUES ('A', 1004, 1001);
INSERT INTO Posto VALUES ('A', 1005, 1002);
INSERT INTO Posto VALUES ('A', 1006, 1001);
INSERT INTO Posto VALUES ('A', 1007, 1000);
INSERT INTO Posto VALUES ('A', 1008, 1000);
INSERT INTO Posto VALUES ('B', 2002, 2000);
INSERT INTO Posto VALUES ('B', 2003, 2001);
INSERT INTO Posto VALUES ('B', 2004, 2001);
INSERT INTO Posto VALUES ('B', 2005, 2000);
INSERT INTO Posto VALUES ('B', 2006, 2000);
INSERT INTO Posto VALUES ('C', 3001, 3000);
INSERT INTO Posto VALUES ('C', 3002, 3000);
INSERT INTO Posto VALUES ('D', 4004, 4001);
INSERT INTO Posto VALUES ('D', 4005, 4002);
INSERT INTO Posto VALUES ('D', 4006, 4000);
INSERT INTO Posto VALUES ('D', 4007, 4001);
INSERT INTO Posto VALUES ('D', 4008, 4002);
INSERT INTO Posto VALUES ('D', 4009, 4000);
INSERT INTO Posto VALUES ('D', 4010, 4002);
INSERT INTO Posto VALUES ('D', 4011, 4000);
INSERT INTO Posto VALUES ('D', 4012, 4000);
INSERT INTO Posto VALUES ('D', 4013, 4003);
INSERT INTO Posto VALUES ('E', 5002, 5000);
INSERT INTO Posto VALUES ('E', 5003, 5001);
INSERT INTO Posto VALUES ('E', 5004, 5000);
INSERT INTO Posto VALUES ('E', 5005, 5001);
INSERT INTO Posto VALUES ('E', 5006, 5001);
INSERT INTO Posto VALUES ('F', 6001, 6000);
INSERT INTO Posto VALUES ('G', 7001, 7000);
INSERT INTO Posto VALUES ('H', 8001, 8000);
INSERT INTO Posto VALUES ('H', 8002, 8000);
INSERT INTO Posto VALUES ('I', 9001, 9000);


INSERT INTO Arrenda VALUES ('A', 1000, 221122);
INSERT INTO Arrenda VALUES ('A', 1001, 121212);
INSERT INTO Arrenda VALUES ('A', 1002, 121212);
INSERT INTO Arrenda VALUES ('B', 2001, 221122);
INSERT INTO Arrenda VALUES ('B', 2003, 212122);
INSERT INTO Arrenda VALUES ('C', 3001, 313131);
INSERT INTO Arrenda VALUES ('D', 4000, 313131);
INSERT INTO Arrenda VALUES ('D', 4003, 444444);
INSERT INTO Arrenda VALUES ('D', 4008, 444444);
INSERT INTO Arrenda VALUES ('D', 4012, 303030);
INSERT INTO Arrenda VALUES ('E', 5000, 202020);
INSERT INTO Arrenda VALUES ('E', 5002, 202020);
INSERT INTO Arrenda VALUES ('F', 6000, 313131);
INSERT INTO Arrenda VALUES ('G', 7001, 303030);
INSERT INTO Arrenda VALUES ('H', 8001, 121212);
INSERT INTO Arrenda VALUES ('I', 9000, 313131);

INSERT INTO Fiscaliza VALUES (90, 'A', 1000);
INSERT INTO Fiscaliza VALUES (96, 'A', 1001);
INSERT INTO Fiscaliza VALUES (96, 'B', 2001);
INSERT INTO Fiscaliza VALUES (93, 'B', 2003);
INSERT INTO Fiscaliza VALUES (93, 'C', 3001);
INSERT INTO Fiscaliza VALUES (96, 'D', 4000);
INSERT INTO Fiscaliza VALUES (95, 'D', 4008);
INSERT INTO Fiscaliza VALUES (95, 'D', 4012);
INSERT INTO Fiscaliza VALUES (94, 'E', 5002);
INSERT INTO Fiscaliza VALUES (94, 'F', 6000);
INSERT INTO Fiscaliza VALUES (93, 'G', 7001);
INSERT INTO Fiscaliza VALUES (92, 'H', 8001);
INSERT INTO Fiscaliza VALUES (91, 'I', 9000);

INSERT INTO Oferta VALUES ('A', 1001, '2016/1/10', '2016/1/11', 620);
INSERT INTO Oferta VALUES ('A', 1001, '2016/1/11', '2016/2/12', 620);
INSERT INTO Oferta VALUES ('A', 1001, '2016/2/10', '2016/2/11', 620);
INSERT INTO Oferta VALUES ('A', 1002, '2016/1/10', '2016/1/11', 610);
INSERT INTO Oferta VALUES ('B', 2000, '2016/1/10', '2016/1/11', 350);
INSERT INTO Oferta VALUES ('B', 2001, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('C', 3000, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('D', 4000, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('D', 4001, '2016/1/10', '2016/2/10', 650);
INSERT INTO Oferta VALUES ('D', 4001, '2016/2/10', '2016/2/11', 650);
INSERT INTO Oferta VALUES ('D', 4006, '2016/2/10', '2016/2/11', 620);
INSERT INTO Oferta VALUES ('D', 4007, '2016/1/10', '2016/1/11', 610);
INSERT INTO Oferta VALUES ('D', 4008, '2016/1/10', '2016/1/11', 350);
INSERT INTO Oferta VALUES ('D', 4009, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('D', 4010, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('D', 4011, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('D', 4012, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('D', 4013, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('E', 5002, '2016/2/10', '2016/2/11', 620);
INSERT INTO Oferta VALUES ('E', 5003, '2016/1/10', '2016/1/11', 610);
INSERT INTO Oferta VALUES ('E', 5004, '2016/1/10', '2016/1/11', 350);
INSERT INTO Oferta VALUES ('E', 5005, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('E', 5006, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('F', 6001, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('G', 7001, '2016/1/10', '2016/1/11', 650);
INSERT INTO Oferta VALUES ('H', 8001, '2016/1/10', '2016/1/11', 650);

INSERT INTO Reserva VALUES (1);
INSERT INTO Reserva VALUES (2);
INSERT INTO Reserva VALUES (3);
INSERT INTO Reserva VALUES (4);
INSERT INTO Reserva VALUES (5);
INSERT INTO Reserva VALUES (6);
INSERT INTO Reserva VALUES (7);
INSERT INTO Reserva VALUES (8);
INSERT INTO Reserva VALUES (9);
INSERT INTO Reserva VALUES (10);
INSERT INTO Reserva VALUES (11);
INSERT INTO Reserva VALUES (12);
INSERT INTO Reserva VALUES (13);
INSERT INTO Reserva VALUES (14);
INSERT INTO Reserva VALUES (15);
INSERT INTO Reserva VALUES (16);
INSERT INTO Reserva VALUES (17);
INSERT INTO Reserva VALUES (18);
INSERT INTO Reserva VALUES (19);
INSERT INTO Reserva VALUES (20);
INSERT INTO Reserva VALUES (21);
INSERT INTO Reserva VALUES (22);
INSERT INTO Reserva VALUES (23);
INSERT INTO Reserva VALUES (24);
INSERT INTO Reserva VALUES (25);
INSERT INTO Reserva VALUES (26);

INSERT INTO Aluga VALUES ('A', 1001, '2016/1/10', 221122, 1);
INSERT INTO Aluga VALUES ('A', 1001, '2016/1/11', 221122, 2);
INSERT INTO Aluga VALUES ('A', 1001, '2016/2/10', 313131, 3);
INSERT INTO Aluga VALUES ('A', 1002, '2016/1/10', 444444, 4);
INSERT INTO Aluga VALUES ('A', 1001, '2016/1/10', 202020, 5);
INSERT INTO Aluga VALUES ('A', 1001, '2016/1/10', 313131, 6);
INSERT INTO Aluga VALUES ('C', 3000, '2016/1/10', 303030, 7);
INSERT INTO Aluga VALUES ('D', 4000, '2016/1/10', 121212, 8);
INSERT INTO Aluga VALUES ('D', 4001, '2016/1/10', 313131, 9);
INSERT INTO Aluga VALUES ('D', 4001, '2016/2/10', 221122, 10);
INSERT INTO Aluga VALUES ('D', 4006, '2016/2/10', 221122, 11);
INSERT INTO Aluga VALUES ('D', 4000, '2016/1/10', 313131, 12);
INSERT INTO Aluga VALUES ('D', 4000, '2016/1/10', 444444, 13);
INSERT INTO Aluga VALUES ('D', 4000, '2016/1/10', 202020, 14);
INSERT INTO Aluga VALUES ('D', 4010, '2016/1/10', 313131, 15);
INSERT INTO Aluga VALUES ('D', 4011, '2016/1/10', 303030, 16);
INSERT INTO Aluga VALUES ('D', 4012, '2016/1/10', 121212, 17);
INSERT INTO Aluga VALUES ('D', 4013, '2016/1/10', 313131, 18);
INSERT INTO Aluga VALUES ('E', 5002, '2016/2/10', 221122, 19);
INSERT INTO Aluga VALUES ('E', 5002, '2016/2/10', 221122, 20);
INSERT INTO Aluga VALUES ('E', 5005, '2016/1/10', 313131, 21);
INSERT INTO Aluga VALUES ('E', 5005, '2016/1/10', 444444, 22);
INSERT INTO Aluga VALUES ('E', 5006, '2016/1/10', 202020, 23);
INSERT INTO Aluga VALUES ('F', 6001, '2016/1/10', 313131, 24);
INSERT INTO Aluga VALUES ('F', 6001, '2016/1/10', 303030, 25);
INSERT INTO Aluga VALUES ('H', 8001, '2016/1/10', 121212, 26);

INSERT INTO Paga VALUES (0, '2016/1/10', 'cartao');
INSERT INTO Paga VALUES (1, '2016/1/10', 'cartao');
INSERT INTO Paga VALUES (2, '2016/1/10', 'dinheiro');
INSERT INTO Paga VALUES (3, '2016/1/10', 'cartao');
INSERT INTO Paga VALUES (4, '2016/1/10', 'cheque');
INSERT INTO Paga VALUES (5, '2016/1/10', 'cartao');
INSERT INTO Paga VALUES (6, '2016/1/10', 'cartao');
INSERT INTO Paga VALUES (7, '2016/1/10', 'cartao');
INSERT INTO Paga VALUES (8, '2016/1/10', 'dinheiro');

INSERT INTO Estado VALUES (0, '2016/1/10', 'aceite');
INSERT INTO Estado VALUES (1, '2016/1/10', 'pendente');
INSERT INTO Estado VALUES (2, '2016/1/10', 'aceite');
INSERT INTO Estado VALUES (3, '2016/1/10', 'aceite');
INSERT INTO Estado VALUES (4, '2016/1/10', 'cancelado');
INSERT INTO Estado VALUES (5, '2016/1/10', 'rejeitado');
INSERT INTO Estado VALUES (6, '2016/1/10', 'aceite');
INSERT INTO Estado VALUES (7, '2016/1/10', 'pendente');
INSERT INTO Estado VALUES (8, '2016/1/10', 'aceite');
