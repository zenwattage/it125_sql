DROP DATABASE IF EXISTS PTSA;
CREATE DATABASE PTSA;
USE PTSA;


CREATE TABLE customer
(
	custId INT PRIMARY KEY AUTO_INCREMENT,
    custName VARCHAR(45) NOT NULL,
    custPhone CHAR(10),
    custBalance DECIMAL(6,2) DEFAULT 0.0
);


CREATE TABLE Member
(
	MemberId INT,
    MemberFName VARCHAR(45) NOT NULL,
    MemberLName VARCHAR(45) NOT NULL,
    MemberPhone CHAR(10)
);
CREATE TABLE Committee
(
	CommitteeId INT PRIMARY KEY AUTO_INCREMENT,
    CommitteeName VARCHAR(45)
);

CREATE TABLE CommitteeMember
(
	MemberId INT NOT NULL,
    CommitteeId INT NOT NULL,
    DateJoined DATE,
    PRIMARY KEY (CommitteeId),
    FOREIGN KEY (MemberId) REFERENCES Member(MemberId)
		ON DELETE RESTRICT
);






