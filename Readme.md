# Twitter-clone-1

[![Build Status](https://travis-ci.org/Improwised/twitter-clone-1.svg?branch=master)](https://travis-ci.org/Improwised/twitter-clone-1)

twitter-clone-1 have some basic functionality like register user, login registered users, follow and unfollow other users, they able to make post with text limit of 140 words and also they can add picture file too.

## Prerequisites

* [Node.js >= 4.3.x/NPM](http://nodejs.org/download/)
* [Docker](https://www.docker.com/products/overview)

## Setup

Install project

```
git clone https://github.com/Improwised/twitter-clone-1.git
```

Install all dependencies

```
npm install
```

Create Database

```
createdb jatin
```

Run The Software

```
node app.js
```

Open

```
http://localhost:3000
```

Test

```
make test
```

## Features

* Register Users
* Login Registered Users.
* Login User Make Post.
* User Add Pictures.
* Users Follow Other Register Users.
* Users View Thier Profile Were They See Their Post.
* Users Unfollow Other Users.
* Users Edit Their Profile.
* User sucessfuly Logout.

## Contribution Standards

### Git Issues

* We are going to have small releases. They are reffered as "Milestone".
* All issues are also discussions. So if something isn't clear, it should be explicitly mentioned in the issue as a comment and the issue should be tagged "Needs Input" so that one can know he has to do something there.
* The branch name is according to the issue so one can know the branch is related with which issue. e.g., 32-browserify
* We are going to work on issues according to their priorities. When the issue is completed then that issue should be tagged "Needs Review" so that team members can know he has to review it and also generate "Pull Request" so one can know the issue is completed and can merge it.

### Labels

* **PRI - Critical**: These are usually "must-have" bugfixes and very important features. They should be picked-up first and finished with relative haste.
* **PRI - High**: These are picked up if all Critical issues are either taken or fixed. Most of the new features will be prioritized as these.
* **PRI - Normal**: These are picked up if all High issues are taken.
* **PRI - Low**: These are "nice-to-have" features. Only pick these up if there are no pending Critical, High or Normal priority issues.
* **Needs Review**: Instead of closing tickets one finishes, mark it with "Needs Review", so any other team member can do a quick code review and verify it before we close the ticket.
* **Needs Input**: Whenever there is a domain-related question, or an issue needs clarification, this label is used to mark it as such. This label should be removed by whoever assigned it once enough information is available.


