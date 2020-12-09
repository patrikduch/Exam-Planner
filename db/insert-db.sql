INSERT INTO ProjectDetail (name) VALUES ('Exam planner');

INSERT INTO Degree (name) VALUES ('Bc');
INSERT INTO Degree (name) VALUES ('Mgr');
INSERT INTO Degree (name) VALUES ('PhD');
INSERT INTO Degree (name) VALUES ('RNDr');
INSERT INTO Degree (name) VALUES ('Doc');


INSERT INTO Course (course_code, title, credits, lecture_hours, practice_hours, classification, annotation) VALUES
('NUMX2', 'Numerická matematika', 6, 40, 40, 'ZK',
'Cílem předmětu je rozšíření znalostí a dovedností studenta v oblasti numerické matematiky, konkrétně o řešení soustav lineárních algebraických rovnic,
 problému vlastních čísel, aproximace funkcí, numerickou derivaci a numerický integrál.');


 INSERT INTO Course (course_code, title, credits, lecture_hours, practice_hours, classification, annotation) VALUES
('DIMAN', 'Diskrétní matematika', 6, 40, 40, 'ZK',
'Úvod do diskrétní matematiky. Množiny, relace a funkce (rozšíření). Základy kombinatoriky a diskrétní pravděpodobnost. Logické funkce: formule, princip duality, rozklad funkce podle proměnných, funkcionální úplnost. Uspořádané struktury: množiny, svazy, Booleova algebra.' ||
 'Základy teorie grafů a grafové algoritmy.');



INSERT INTO Course (course_code, title, credits, lecture_hours, practice_hours, classification, annotation) VALUES
('NUMX1', 'Úvod do numerické matematiky', 6, 40, 40, 'ZP',
'Cílem předmětu je úvod do oblasti numerické matematiky, konkrétně o řešení soustav lineárních algebraických rovnic,
 problému vlastních čísel, aproximace funkcí, numerickou derivaci a numerický integrál.');


INSERT INTO Course (course_code, title, credits, lecture_hours, practice_hours, classification, annotation) VALUES
('VYDAP', 'Webové a databázové aplikace v PHP', 4, 20, 20, 'ZP',
'Úvod předmětu je věnován seznámení s protokolem HTTP a formuláři v HTML. Dále už je předmět zaměřen na tvorbu webových aplikací v jazyce PHP s propojením na databázi MySQL. Student by měl být po absolvování
 předmětu schopen samostatně vytvářet webové aplikace v PHP.');


INSERT INTO Course (course_code, title, credits, lecture_hours, practice_hours, classification, annotation) VALUES
('SWINZ', 'Softwarové inženýrství', 6, 40, 40, 'ZK',
'Cílem je seznámit studenty s problematikou informačních systémů, jejich architektur a aplikací (ERP, BI, CRM, ...). Dalším cílem je seznámení s životním cyklem vývoje a metodikami a standardy používanými v praxi (UP, RUP, ISO 12 207) ve spojení s modelovacím jazykem UML. V neposlední řadě budou studenti seznámeni se základy byznys modelování a jejich vazbou na podnikovou a IT strategii a také s metrikami softwarových systémů.');


INSERT INTO Course (course_code, title, credits, lecture_hours, practice_hours, classification, annotation) VALUES
('XFUMO', 'Fuzzy modelování', 6, 40, 40, 'ZK',
'Student se seznámí se základními principy hlavních metod fuzzy modelování, které mají řadu praktických aplikací. V rámci výuky bude demonstrováno řešení konkrétních problémů pomocí speciálního software pro fuzzy modelování vyvinutého na OU.');


INSERT INTO Course (course_code, title, credits, lecture_hours, practice_hours, classification, annotation) VALUES
('XRPR1', 'Ročníkový projekt', 4, 20, 20, 'ZP',
'Předmět ročníkový projekt je založen na spolupráci studentských týmů pod vedením pedagoga. Týmy jsou na začátku rozděleny dle osobních preferencí s přihlédnutím k osobnostním profilům jednotlivých členů (např. Belbinův test). Poté si týmy zvolí téma dlouhodobého softwarového projektu, který během semestru realizují. Součástí hodnoceného řešení jsou kromě vlastního softwarového produktu také artefakty, které studenti produkují během vývoje (diagram návrhu architektury, projektový plán, vize, iterační plány).
Protože se jedná o softwarový projekt, předpokládáme uplatnění základních znalostí z předmětů z oblasti softwarového inženýrství, databází a programování. Pro sestavení metodiky vývoje je doporučen procesní framework OpenUP.
Cílem předmětu je naučit studenta orientovat se ve vývoji a vlastním návrhu softwarové architektury. Tím ho připravit na týmovou práci v reálných projektech většího rozsahu.');



INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('c116', 'Budova C', 15);
INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('c112', 'Budova C', 10);
INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('c111', 'Budova C', 12);
INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('a330', 'Budova A', 20);
INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('a210', 'Budova A', 15);



/* 1. */


/* First student */

INSERT INTO User (username, PASSWORD, role) VALUES ('duch', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'student');
/*
    password: patrikduch
*/

INSERT INTO Student (student_code, first_name, surname, user_id) VALUES ('duc0016', 'Patrik', 'Duch', 1);



/* Second student. */

INSERT INTO User (username, PASSWORD, role) VALUES ('silber', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'student');
/*
    password: patrikduch
*/


INSERT INTO Student (student_code, first_name, surname, user_id) VALUES ('sil0014', 'Tomáš', 'Silber', 2);



/* Third student. */

INSERT INTO User (username, PASSWORD, role) VALUES ('duchova', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'student');
/*
    password: patrikduch
*/


INSERT INTO Student (student_code, first_name, surname, user_id) VALUES ('duc0014', 'Petra', 'Duchová', 3);


/* Fourth student. */

INSERT INTO User (username, PASSWORD, role) VALUES ('bebcak', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'student');
/*
    password: patrikduch
*/


INSERT INTO Student (student_code, first_name, surname, user_id) VALUES ('beb0019', 'Josef', 'Bebcčák', 4);


/* Fifth student. */

INSERT INTO User (username, PASSWORD, role) VALUES ('novak', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'student');
/*
    password: patrikduch
*/

INSERT INTO Student (student_code, first_name, surname, user_id) VALUES ('nov0011', 'Jan', 'Novák', 5);




/* First lecturer */

INSERT INTO User (username, PASSWORD, role) VALUES ('walek', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'lecturer');
/*
    password: patrikduch
*/

INSERT INTO Lecturer (lecturer_code, first_name, surname, user_id)
VALUES ('wal45', 'Bogdan', 'Walek', 6);

INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('wal45', 'VYDAP');
INSERT INTO LecturerDegree(lecturer_code, pre_Degree_id, post_degree_id) VALUES ('wal45', 4, 3);



/* Second lecturer */

INSERT INTO User (username, PASSWORD, role) VALUES ('sustek', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'lecturer');
/*
    password: patrikduch
*/

INSERT INTO Lecturer (lecturer_code, first_name, surname, user_id)
VALUES ('sust22', 'Jan', 'Sustek', 7);


INSERT INTO LecturerDegree(lecturer_code, pre_Degree_id, post_degree_id) VALUES ('sust22', 5, 3);
INSERT INTO LecturerDegree(lecturer_code, pre_Degree_id, post_degree_id) VALUES ('sust22', 4, NULL);



INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('sust22', 'NUMX1');
INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('sust22', 'NUMX2');


/* Third lecturer */


INSERT INTO User (username, PASSWORD, role) VALUES ('zacekj', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'lecturer');
/*
    password: patrikduch
*/

INSERT INTO Lecturer (lecturer_code, first_name, surname, user_id)
VALUES ('zac05', 'Jaroslav', 'žáček', 8);

INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('zac05', 'SWINZ');
INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('zac05', 'XRPR1');
INSERT INTO LecturerDegree(lecturer_code, pre_Degree_id, post_degree_id) VALUES ('zac05', 4, 3);


/* Fourth lecturer */


INSERT INTO User (username, PASSWORD, role) VALUES ('dyba', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'lecturer');
/*
    password: patrikduch
*/

INSERT INTO Lecturer (lecturer_code, first_name, surname, user_id)
VALUES ('dyb02', 'Martin', 'Dyba', 9);

INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('dyb02', 'XFUMO');
INSERT INTO LecturerDegree(lecturer_code, pre_Degree_id, post_degree_id) VALUES ('dyb02', 4, 3);



/* Fourth lecturer */


INSERT INTO User (username, PASSWORD, role) VALUES ('janosek', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'lecturer');
/*
    password: patrikduch
*/

INSERT INTO Lecturer (lecturer_code, first_name, surname, user_id)
VALUES ('jan01', 'Michael', 'Janošek', 10);

INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('jan01', 'DIMAN');
INSERT INTO LecturerDegree(lecturer_code, pre_Degree_id, post_degree_id) VALUES ('jan01', 4, 3);


INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0016','VYDAP');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0016','XFUMO');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0016','NUMX2');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0016','SWINZ');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0016','DIMAN');

INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0014','VYDAP');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0014','XFUMO');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0014','NUMX2');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0014','SWINZ');

INSERT INTO StudentCourse (student_code, course_code) VALUES ('beb0019','VYDAP');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('beb0019','XFUMO');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('beb0019','SWINZ');


INSERT INTO StudentCourse (student_code, course_code) VALUES ('sil0014','VYDAP');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('sil0014','XFUMO');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('sil0014','NUMX2');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('sil0014','SWINZ');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('sil0014','DIMAN');


INSERT INTO StudentCourse (student_code, course_code) VALUES ('nov0011','VYDAP');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('nov0011','XFUMO');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('nov0011','NUMX2');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('nov0011','SWINZ');


