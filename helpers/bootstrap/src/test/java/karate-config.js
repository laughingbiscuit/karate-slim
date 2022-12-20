function fn() {
    var driverConfig = {
        type: 'chrome',
        showDriverLog: true,
        start: false,
        beforeStart: 'supervisorctl start ffmpeg',
        afterStop: 'supervisorctl stop ffmpeg',
        videoFile: '/tmp/karate.mp4'
    };
    karate.configure('driver', driverConfig);
    return {}
}
