

CREATE TABLE member
(
   login varchar(20) NOT NULL UNIQUE,
   member_password varchar(60) NOT NULL, --hashed password 
   mail varchar(50) NOT NULL UNIQUE, --jaki typ
   www varchar(50), -- website of member
   birthday date, 
   joined date DEFAULT CURRENT_DATE, --when user is signed
   description text, 
   CONSTRAINT member_pk PRIMARY KEY (login),
   CONSTRAINT valid_login CHECK(length(login) >3)
   

);

CREATE TABLE private_messagge
(
  msg_id serial NOT NULL,
  msg_date date NOT NULL DEFAULT CURRENT_DATE,
  msg_title character varying(32) DEFAULT '-',
  msg_content text NOT NULL,
  addressee varchar(20) NOT NULL,
  sender varchar(20)NOT NULL,
  PRIMARY KEY (msg_id),
  FOREIGN KEY (addressee)REFERENCES member (login), --Is_addressed_to(PRIVATE_MESSAGGE(0,N):MEMBER(1,1))
  FOREIGN KEY (sender) REFERENCES member (login) --Is_written_by(PRIVATE_MESSAGGE(0,N):MEMBER(1,1))
);

CREATE TABLE state
(
  state_id serial NOT NULL,
  state_name varchar(30) NOT NULL UNIQUE,
  PRIMARY KEY (state_id)
);

CREATE TABLE point 
(
  point_id serial NOT NULL,
  point_name varchar(32) NOT NULL UNIQUE,
  elevation numeric(5,1) NOT NULL, --elvation [m]
  difficulty varchar(300),
  description text, --overview
  routes text, --descriptions of routes
  point_access text, --description of getting there
  PRIMARY KEY (point_id)
 
  
);

CREATE TABLE alternative_point
(
  a_point_id serial NOT NULL,
  a_state_id serial NOT NULL,
  PRIMARY KEY (a_point_id, a_state_id),
  FOREIGN KEY (a_point_id) REFERENCES point (point_id), --Has_alternative(STATE(0,N):POINT(0,N)) 
  FOREIGN KEY (a_state_id) REFERENCES state (state_id) 
);

CREATE TABLE proper_point
(
  p_point_id serial NOT NULL,
  p_state_id serial NOT NULL,
  PRIMARY KEY (p_state_id),
  FOREIGN KEY (p_point_id) REFERENCES point (point_id), --Has_proper(STATE(0,N):POINT(0,1))
  FOREIGN KEY (p_state_id) REFERENCES state (state_id) 
);



CREATE TABLE expedition
(
  exped_id serial NOT NULL,
  exped_start date NOT NULL,
  exped_end date NOT NULL,
  exped_result boolean NOT NULL, --true if the point was achieved, false if expedition failed 
  exped_login varchar(20) NOT NULL,
  exped_aim integer NOT NULL, 
  PRIMARY KEY (exped_id),
  FOREIGN KEY (exped_login) REFERENCES member(login), --Was_on(MEMBER(1,1):EXPEDITION(0,N))
  FOREIGN KEY (exped_aim) REFERENCES point (point_id), --Is_asociated(EXPEDITION(0,N):POINT(1,1))
  CONSTRAINT valid_date CHECK(exped_end >= exped_start)
);

CREATE TYPE post_type AS ENUM ('tip', 'report') ;
CREATE TABLE post
(
 post_id serial NOT NULL,
 post_date date NOT NULL DEFAULT CURRENT_DATE,
 category post_type NOT NULL, --good advices for another members or report (user's story, epic, adventures)
 post_content text NOT NULL,
 PRIMARY KEY (post_id)
);

--extra table ensuing after transformation of 'describes(POST(0,N):EXPEDITION(1,N))'
CREATE TABLE member_experience
(
 exper_id serial NOT NULL,
 exper_exped serial NOT NULL,
 exper_post serial NOT NULL,
 PRIMARY KEY (exper_id),
 FOREIGN KEY (exper_exped) REFERENCES expedition(exped_id),
 FOREIGN KEY (exper_post) REFERENCES post(post_id)	
);

CREATE TABLE member_comment
(
 comment_id serial NOT NULL,
 comment_date date NOT NULL DEFAULT CURRENT_DATE,
 comment_content text NOT NULL,
 comment_author varchar(20) NOT NULL,
 comment_post serial NOT NULL,
 PRIMARY KEY(comment_id),
 FOREIGN KEY (comment_author) REFERENCES member(login), --Added(MEMBER(1,1):MEMBER_COMMENT(0,N))
 FOREIGN KEY (comment_post) REFERENCES post(post_id)
);

--extra table ensuing after transformation of 'Wants_to(MEMBER(0,N):POINT(0,N), readiness)'; table represents plans of member
CREATE TYPE readiness_type AS ENUM ('prepared','companions_need');
CREATE TABLE plan
(
 plan_id serial NOT NULL,
 plan_login varchar(20) NOT NULL,
 plan_point integer NOT NULL,
 readiness readiness_type,
 plan_desc text, --short description of preparing expedition 
 PRIMARY KEY (plan_id),
 FOREIGN KEY(plan_login) REFERENCES member(login),
 FOREIGN KEY (plan_point) REFERENCES point (point_id)
);


