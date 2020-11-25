INSERT INTO ProjectDetail (name) VALUES ('Exam planner');


--- Degree
INSERT INTO Degree (name) VALUES ('Bc');
INSERT INTO Degree (name) VALUES ('Mgr');
INSERT INTO Degree (name) VALUES ('PhD');
INSERT INTO Degree (name) VALUES ('RNDr');
INSERT INTO Degree (name) VALUES ('Doc');



INSERT INTO User (username, PASSWORD, role) VALUES ('duch', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'student');
/*
    password: patrikduch
*/

INSERT INTO Student (student_code, first_name, surname, user_id) VALUES ('duc0016', 'Patrik', 'Duch', 1);


INSERT INTO User (username, PASSWORD, role) VALUES ('walek', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'lecturer');
/*
    password: patrikduch
*/

INSERT INTO Lecturer (lecturer_code, first_name, surname, user_id)
VALUES ('wal45', 'Bogdan', 'Walek', 2);

INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('wal45', 'VYDAP');
INSERT INTO LecturerDegree(lecturer_code, pre_Degree_id, post_degree_id) VALUES ('wal45', 4, 3);

INSERT INTO User (username, PASSWORD, role) VALUES ('sustek', '$2y$12$SVW1hnbemwCWRUZa2urzYO78.w3ySfysvG.08CQeiKaJfMO8Nyb/m', 'lecturer');
/*
    password: patrikduch
*/

INSERT INTO Lecturer (lecturer_code, first_name, surname, user_id)
VALUES ('sust22', 'Jan', 'Sustek', 3);


INSERT INTO LecturerDegree(lecturer_code, pre_Degree_id, post_degree_id) VALUES ('sust22', 5, 3);
INSERT INTO LecturerDegree(lecturer_code, pre_Degree_id, post_degree_id) VALUES ('sust22', 4, NULL);



INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('sust22', 'NUMX1');
INSERT INTO LecturerCourse  (lecturer_code, course_code) VALUES ('sust22', 'NUMX2');



INSERT INTO Course (course_code, title, credits, lecture_hours, practice_hours, classification, annotation) VALUES
('NUMX2', 'Numerická matematika', 6, 40, 40, 'ZK',
'Cílem předmětu je rozšíření znalostí a dovedností studenta v oblasti numerické matematiky, konkrétně o řešení soustav lineárních algebraických rovnic,
 problému vlastních čísel, aproximace funkcí, numerickou derivaci a numerický integrál.');


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



INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0016','VYDAP');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0016','XFUMO');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0016','NUMX2');
INSERT INTO StudentCourse (student_code, course_code) VALUES ('duc0016','SWINZ');

INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('c116', 'Budova C', 15);
INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('c112', 'Budova C', 10);
INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('c111', 'Budova C', 12);
INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('a330', 'Budova A', 20);
INSERT INTO ExamRoom (room_code, description, capacity) VALUES ('a210', 'Budova A', 15);


INSERT INTO ExamDate (room_code, lecturer_code, course_code, exam_date, max_participants, note)
 VALUES ('c116', 'wal45', 'VYDAP', '2020-11-25:13:00',18, 'Zápočet předmětu VYDAP');



INSERT INTO ScheduledExam (exam_id, student_code, result_id) VALUES (1, 'duc0016', 1);
INSERT INTO ExamResult (id, description, type) VALUES (1, 'Zápočet', 'P');

