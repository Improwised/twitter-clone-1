const express = require('express');

const DB = require('../helpers/db');

const router = express.Router();
const path = require('path');
const multer = require('multer');

const upload = multer({ dest: path.resolve(__dirname, '../public/images/profile') });
const uploadpost = multer({ dest: path.resolve(__dirname, '../public/images/post') });

// GET: /

router.get('/', (req, res, next) => {
  const query = DB.builder()
    .select()
    .function('NOW()')
    .toParam();

  DB.executeQuery(query, (error, results) => {
    if (error) {
      next(error);
      return;
    }

    res.render('index', {
      title: `Time from the database is ${results.rows[0].now}`,
    });
  });
});

// get user registered

router.post('/register', upload.single('file'), (req, res, next) => {
  let photo = ''; /*= req.file.filename;*/
  if (req.file) {
    photo = req.file.filename;
  } else {
    photo = 'images.png';
  }
  const username = req.body.username;
  const password = req.body.password;
  const email = req.body.email;

  req.checkBody('username', 'Username is required').notEmpty();
  req.checkBody('password', 'Password is required').notEmpty();
  req.checkBody('email', 'Email is required').notEmpty();
  req.checkBody('email', 'Email is not valid').isEmail();

  const errors = req.validationErrors();

  if (errors) {
    console.log('Failed something went wrong !!');
    res.render('index', {
      error: errors,
    });
  } else {
    const query = DB.builder()
    .insert()
     .into('registeruser')
     .set('username', username)
     .set('password', password)
     .set('email', email)
     .set('image', photo)
     .toParam();

    DB.executeQuery(query, (error) => {
      if (error) {
        next(error);
        return;
      }

      res.render('index');
    });
  }
});

// here user will login and check is they registered

router.post('/login', (req, res, next) => {
  const email = req.body.email;
  const password = req.body.password;
  const session = req.session;
  // let errors = [];

  req.checkBody('password', 'Password is required').notEmpty();
  req.checkBody('email', 'Email is required').notEmpty();
  req.checkBody('email', 'Email is not valid').isEmail();

  const error = req.validationErrors();

  if (error) {
    console.log('Failed something went !!');
    console.log('error->>>', error);
    // errors = errors.concat(error);
    // errors.push()
    // res.end()
    // console.log(errors);

    res.render('index', {
      errors: error,
    });
  } else {
    const query = DB.builder()
    .select()
    .field('username')
    .field('id')
    .from('registeruser')
    .where('email = ? AND password = ?', email, password)
    .toParam();

    DB.executeQuery(query, (error1, results) => {
      if (error1) {
        next(error1);
        return;
      }
      if (results.rowCount) {
        session.user_id = results.rows[0].id;
        session.mail = email;
        res.redirect('/home');
      }
    });
  }
});


// here user get all updates at home page from database

router.get('/home', (req, res, next) => {
  let query;
  query = DB.builder()
   .select()
   .field('username')
   .field('tweettxt')
   .field('created_at')
   .field('image')
   .field('post_image')
   .from('registeruser', 'r')
   .join(DB.builder().select().from('tweet'), 'u', 'r.id = u.user_id')
   .where('u.user_id IN ? OR u.user_id= ? ',
    (DB.builder().select().field('follow').from('follower')
   .where('login_user = ?', req.session.user_id)), req.session.user_id)
   .order('created_at', false)
   .toParam();

  DB.executeQuery(query, (error, tweets) => {
    if (error) {
      next(error);
      return;
    }
    query = DB.builder()
    .select()
    .from('registeruser')
    .where('id != ?', req.session.user_id)
    .where('id NOT IN ?',
     DB.builder()
       .select()
       .field('follow')
       .from('follower')
       .where('login_user = ?', req.session.user_id))
       .toParam();


    DB.executeQuery(query, (error2, follows) => {
      if (error2) {
        next(error2);
        return;
      }
      res.render('home', {
        tweets: tweets.rows,
        follows: follows.rows,
      });
    });
  });
});

// here the data is store into the database when user tweet

router.post('/tweet', uploadpost.single('file'), (req, res, next) => {
  let photo = ''; /*= req.file.filename;*/
  if (req.file) {
    photo = req.file.filename;
  } else {
    photo = '';
  }
  const tweet = req.body.tweettxt;
  const session = req.session;
  const query = DB.builder()
    .insert()
      .into('tweet')
      .set('tweettxt', tweet)
      .set('like', '1')
      .set('created_at', 'now()')
      .set('post_image', photo)
      .set('user_id', session.user_id)
      .toParam();

  DB.executeQuery(query, (error) => {
    if (error) {
      return;
    }

    res.redirect('/home');
  });
});

// here user follow other users

router.post('/follow', (req, res, next) => {
  const session = req.session;
  const query = DB.builder()
    .insert()
      .into('follower')
      .set('login_user', session.user_id)
      .set('follow', req.body.myfollow)
      .toParam();

  DB.executeQuery(query, (error) => {
    if (error) {
      next(error);
      return;
    }

    res.redirect('/home');
  });
});

// here user unfolloww other users

router.post('/unfollow', (req, res, next) => {
  const query = DB.builder()
    .delete()
      .from('follower')
      .where('follow=?', req.body.myunfollow)
      .toParam();

  DB.executeQuery(query, (error) => {
    if (error) {
      next(error);
      return;
    }

    res.redirect('/profile');
  });
});

// here user will logout

router.get('/logout', (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      console.log('error');
    } else {
      res.redirect('/');
    }
  });
});

// here user able to see their profile

router.get('/profile', (req, res, next) => {
  let query;
  query = DB.builder()
    .select()
    .field('username')
    .field('tweettxt')
    .field('created_at')
    .field('image')
    .field('post_image')
    .from('registeruser', 'regs')
    .join(DB.builder().select().from('tweet'), 'u', 'regs.id= u.user_id')
    .where('regs.id = ?', req.session.user_id)
    .order('created_at', false)
    .toParam();

  DB.executeQuery(query, (error, tweets) => {
    if (error) {
      next(error);
      return;
    }

    query = DB.builder()
    .select()
    .field('username')
    .field('image')
    .from('registeruser', 'users')
    .where('id = ?', req.session.user_id)
    .toParam();

    DB.executeQuery(query, (error3, users) => {
      if (error3) {
        next(error3);
        return;
      }

      query = DB.builder()
      .select()
      .field('username')
      .field('follow')
      .field('image')
      .from('registeruser', 'regs')
      .join(DB.builder().select().from('follower'), 'u', 'regs.id= u.follow')
      .where('regs.id != ?', req.session.user_id)
      .toParam();

      DB.executeQuery(query, (error4, follow) => {
        if (error4) {
          next(error4);
          return;
        }

        res.render('profile', {
          tweets: tweets.rows,
          users: users.rows,
          follow: follow.rows,
        });
      });
    });
  });
});

// here user able to edit their profile

router.get('/editprofile', (req, res) => {
  const query = DB.builder()
    .select()
    .field('username')
    .field('password')
    .field('email')
    .from('registeruser')
    .where('id = ?', req.session.user_id)
    .toParam();

  DB.executeQuery(query, (error, users, next) => {
    if (error) {
      next(error);
      return;
    }
    res.render('editprofile', { res: users.rows });
  });
});

router.post('/editprofile', upload.single('file'), (req, res) => {
  let photo = ''; /*= req.file.filename;*/
  if (req.file) {
    photo = req.file.filename;
  } else {
    photo = 'images.png';
  }
  const query = DB.builder()
   .update()
     .table('registeruser')
     .set('username', req.body.username)
     .set('email', req.body.email)
     .set('password', req.body.password)
     .set('image', photo)
     .where('id = ?', req.session.user_id)
     .toParam();

  DB.executeQuery(query, (error) => {
    if (error) {
      console.log('Error', error);
    }
    res.redirect('/profile');
  });
});
module.exports = router;
