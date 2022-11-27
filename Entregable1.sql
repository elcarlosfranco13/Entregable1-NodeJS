CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int,
  "gender" varchar,
  "role_id" serial
);

CREATE TABLE "users_courses" (
  "id" uuid,
  "user_id" uuid,
  "course_id" uuid
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "description" text,
  "level" varchar,
  "teacher" varchar,
  "course_video_id" uuid,
  "categorie_id" uuid
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar,
  "url" varchar
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "users_courses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categorie_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("course_video_id") REFERENCES "courses_videos" ("id");


insert into roles 
(id,name)
values
(1, "Student"),
(2, "Teacher"),
(3, "Admin");
insert into categories 
(id,name)
values
('294e3d8d-488d-47ce-92f1-74d98aec45c2','Front-end'),
('0855681b-374d-46a2-8fc3-4362971466b9','Back-end');

insert into users_courses 
(id,user_id,course_id)
values
('368eed82-35a5-4c1e-9134-0cf3782371a6','08856af9-b7ed-421b-b48f-e76d9a65fb1c','bb45636f-b147-476d-bd94-b676281ebe78'),
('e72de13e-5970-4e3c-9434-f121fa046641','6af689b4-a7eb-44d3-abbb-298380aa91c6','975d58fb-2b64-4b3b-b941-70d366243e16');

insert into courses_videos  
(id,title,url)
values
('99a09db7-4b21-4018-ab10-715263f0dd1f','Front-End basico', 'https://www.youtube.com/watch?v=LAlceG2cY_w&list=PLM-Y_YQmMEqDcV8cJcosRsqJJNrhlpwzb'),
('2e98823d-426d-4c90-b965-8e296880d01f','Back-End basico', 'https://www.youtube.com/watch?v=sb01BSWyRMM');

insert into courses 
(id,title,description,"level",teacher)
values('bb45636f-b147-476d-bd94-b676281ebe78','Programming Fundamentals','Learn HTML,JAVASCRIPT and fundaments','Beginner','Jesus'),
('975d58fb-2b64-4b3b-b941-70d366243e16','Back End theory','Learn Node JS SQL and Postgres','Advanced','Sahid');

insert into users 
(id, first_name,last_name,email,"password",age,gender,role_id)
values
('08856af9-b7ed-421b-b48f-e76d9a65fb1c','Carlos','Franco','carlos@gmail.com','root1',31,'Male',1),
('6af689b4-a7eb-44d3-abbb-298380aa91c6','Jesus','Fernandez','jesus@academlo.com','root2',27,'Male',2);
