CREATE DATABASE CMS

USE CMS

CREATE TABLE Users(
userId INT PRIMARY KEY,
firstName VARCHAR(50),
lastName VARCHAR(50),
email VARCHAR(50) NOT NULL,
password NCHAR(8) NOT NULL,
userRole VARCHAR(50))

CREATE TABLE Topic(
topicId INT PRIMARY KEY,
topicName VARCHAR(50))

CREATE TABLE Conference(
conferenceId INT PRIMARY KEY,
author INT FOREIGN KEY REFERENCES Users(userId),
conferenceName VARCHAR(50),
created DATE)

CREATE TABLE Edition(
editionId INT PRIMARY KEY,
author INT FOREIGN KEY REFERENCES Users(userId),
editionName VARCHAR(50),
conference INT FOREIGN KEY REFERENCES Conference(conferenceId),
beginDate DATE,
endDate DATE,
beginSubmissions DATE,
endSubmissions DATE,
endBidding DATE,
endReview DATE,
created DATE)

CREATE TABLE Payment(
paymentId INT PRIMARY KEY,
userId INT FOREIGN KEY REFERENCES Users(userId),
edition INT FOREIGN KEY REFERENCES Edition(editionId),
cardNumber VARCHAR(50),
paymentSum FLOAT)

CREATE TABLE Proposal(
proposalId INT PRIMARY KEY,
userId INT FOREIGN KEY REFERENCES Users(userId),
edition INT FOREIGN KEY REFERENCES Edition(editionId),
proposalName VARCHAR(50),
proposalDescription VARCHAR(150),
created DATE,
modified DATE)

CREATE TABLE Topics(
topicId INT FOREIGN KEY REFERENCES Topic(topicId),
proposalId INT FOREIGN KEY REFERENCES Proposal(proposalId),
CONSTRAINT pk_Topics PRIMARY KEY(topicId, proposalId))

CREATE TABLE ProposalStatus(
proposalStatusId INT PRIMARY KEY,
proposalStatus VARCHAR(50),
comment VARCHAR(100),
userId INT FOREIGN KEY REFERENCES Users(userId),
proposal INT FOREIGN KEY REFERENCES Proposal(proposalId),
created DATE,
modified DATE)

CREATE TABLE _Session(
sessionId INT PRIMARY KEY,
sessionName VARCHAR(50),
room VARCHAR(50),
userId INT FOREIGN KEY REFERENCES Users(userId),
edition INT FOREIGN KEY REFERENCES Edition(editionId))

CREATE TABLE Schedule(
scheduleId INT PRIMARY KEY,
proposal INT FOREIGN KEY REFERENCES Proposal(proposalId),
sessionId INT FOREIGN KEY REFERENCES _Session(sessionId),
beginDate DATE,
endDate DATE)








