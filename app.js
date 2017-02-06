const http = require('http');
const path = require('path');

const bodyParser = require('body-parser');
const express = require('express');
const expressValidator = require('express-validator');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const session = require('express-session');

// Load dotenv config
if (!process.env.NODE_ENV || process.env.NODE_ENV === 'development') {
  // eslint-disable-next-line global-require
  require('dotenv').load();

  if (!process.env.PORT) {
    process.exit(1);
  }
}

const routes = require('./routes');

const app = express();
const server = http.createServer(app);

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(expressValidator());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({
  secret: '2c44-4D44-WppQ38S',
  resave: true,
  saveUninitialized: true,
}));

app.use('/', routes);

// Catch 404 errors
// Forwarded to the error handlers
app.use((req, res, next) => {
  const err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// Development error handler
// Displays stacktrace to the user
if (app.get('env') === 'development') {
  app.use((err, req, res) => {
    res.status(err.status || 500);
    res.render('error', {
      message: err.message,
      error: err,
    });
  });
}

// Production error handler
// Does not display stacktrace to the user
app.use((err, req, res) => {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: '',
  });
});

server.listen(process.env.PORT);
console.log(`Server started on port ${process.env.PORT}`);
module.exports = app;
