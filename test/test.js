const should = require('should');
let request = require('supertest');
// const server = require('../app');
request = request('http://localhost:3000');

describe('index', () => {
  describe('GET /', () => {
    it('should return a cover page', (done) => {
      request
        .get('/')
        .expect('Content-type', 'text/html; charset=utf-8')
        .expect(200)
        .end((err, res) => {
          res.status.should.be.equal(200);
          done();
        });
    });
  });

  describe('GET /home', () => {
    it('should return home page', (done) => {
      request
      .get('/home')
      .expect('Content-type', 'text/html; charset=utf-8')
      .expect(200)
      .end((err, res) => {
        if (err) {
          done(err);
        } else {
          res.status.should.be.equal(200);
          done();
        }
      });
    });
  });

  describe('GET /profile', () => {
    it(' should return profile page', (done) => {
      request
      .get('/profile')
      .expect('Content-type', 'text/html; charset=utf-8')
      .expect(200)
      .end((err, res) => {
        if (err) {
          done(err);
        } else {
          res.status.should.be.equal(200);
          done();
        }
      });
    });
  });

  describe('profile', () => {
    describe('GET /editprofile', () => {
      it('should return a edit profile page', (done) => {
        request
          .get('/editprofile')
          .expect('Content-type', 'text/html; charset=utf-8')
          .expect(200)
          .end((err, res) => {
            res.status.should.be.equal(200);
            done();
          });
      });
    });
  });

  describe('POST /register', () => {
    it('it should response register modal', (done) => {
      const registeruser = {
        id: 1,
        username: 'jatin',
        password: 'jatin',
        email: 'jatin@gmail.com',
        image: '2567901bf9cbf2c5ede7317aba2379bc',
      };
      request
        .post('/register')
        .send(registeruser)
        .expect(200)
        .end((err, res) => {
          console.log(err);
          if (err) {
            done(err);
          } else {
            res.status.should.be.equal(200);
            done();
          }
        });
    });
  });


  describe('POST /login', () => {
    it('it should response login modal', (done) => {
      const registeruser = {
        password: 'jatin',
        email: 'jatin@gmail.com',
      };
      request
        .post('/login')
        .send(registeruser)
        .expect(302)
        .end((err, res) => {
          console.log(err);
          if (err) {
            done(err);
          } else {
            res.status.should.be.equal(302);
            done();
          }
        });
    });
  });

  describe('POST /tweet', () => {
    it('user can tweet', (done) => {
      const tweet = {
        tweettxt: 'hello.. ',
        user_id: '1',
        post_image: '9c37ee2f60a1350aba2974cb1b997a2e',
      };
      request
        .post('/tweet')
        .send(tweet)
        .expect(302)
        .expect({})
        .end((err, res) => {
          if (err) {
            done(err);
          } else {
            res.status.should.be.equal(302);
            done();
          }
        });
    });
  });

  describe('POST /editprofile', () => {
    it('user can edit their profile', (done) => {
      const editprofile = {
        username: 'sagar',
        password: 'sagar',
        email: 'sagar@gmail.com',
        image: '2567901bf9cbf2c5ede7317aba2379bc',
      };
      request
        .post('/editprofile')
        .send(editprofile)
        .expect(302)
        .expect({})
        .end((err, res) => {
          if (err) {
            done(err);
          } else {
            res.status.should.be.equal(302);
            done();
          }
        });
    });
  });

  describe('POST /follow', () => {
    it('user can follow other user', (done) => {
      const follow = {
        login_user: '1',
        follow: '2',
      };
      request
        .post('/follow')
        .send(follow)
        .expect(302)
        .expect({})
        .end((err, res) => {
          if (err) {
            done(err);
          } else {
            res.status.should.be.equal(302);
            done();
          }
        });
    });
  });

  describe('POST /unfollow', () => {
    it('user can follow other user', (done) => {
      const follow = {
        id: '2',
      };
      request
        .post('/unfollow')
        .send(follow)
        .expect(302)
        .expect({})
        .end((err, res) => {
          if (err) {
            done(err);
          } else {
            res.status.should.be.equal(302);
            done();
          }
        });
    });
  });

  describe('GET /logout', () => {
    it('should return a main index page', (done) => {
      request
        .get('/logout')
        .expect('Content-type', 'text/html; charset=utf-8')
        .expect(302)
        .end((err, res) => {
          res.status.should.be.equal(302);
          done();
        });
    });
  });
});
