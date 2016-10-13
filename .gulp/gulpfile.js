// NODE_PATH = C:\Users\Master\AppData\Roaming\npm\node_modules

var path = require('path'),
    gulp = require('gulp'),
    root = path.dirname(__dirname);

var js = require(path.join(__dirname, 'utils', 'js')),
    icon = require(path.join(__dirname, 'utils', 'icon'));


gulp.task('script:html5', function () {
    js(path.join(root, 'public', 'javascripts'), [
        path.join(__dirname, 'vendor', 'html5', 'es5-shim.js'),
        path.join(__dirname, 'vendor', 'html5', 'html5shiv.js'),
        path.join(__dirname, 'vendor', 'html5', 'html5shiv-printshiv.js'),
        path.join(__dirname, 'vendor', 'html5', 'respond.js')
    ], {
        concat: 'html5bility'
    });
});

gulp.task('script:flex', function () {
    js.ify(path.join(root, 'public', 'javascripts'), [
        path.join(__dirname, 'vendor', 'flex', 'index.js'),
    ], {
        basename: 'flexibility'
    });
});


gulp.task('font:iconfont', function () {
    icon.read(path.join(root, 'lib', 'assets'), path.join(__dirname, 'icons'));
});


gulp.task('watch', function () {
    gulp.watch([
        path.join(__dirname, 'vendor', 'html5', '**')
    ], [
        'script:html5'
    ]);

    gulp.watch([
        path.join(__dirname, 'vendor', 'flex', '**')
    ], [
        'script:flex'
    ]);

    gulp.watch([
        path.join(__dirname, 'icons', '**')
    ], [
        'font:iconfont'
    ]);
});


gulp.task('default', [
    'script:html5',
    'script:flex',
    'font:iconfont',
    //'watch'
]);
