const http = require('http');
const app = require('./services/web-server');
const mysql = require('./services/mysql');
const port = process.env.PORT || 3000;
const server = http.createServer(app);
server.listen(port);

console.log('Iniciando.. na porta: ' + port)

async function close() {
    return new Promise((resolve, reject) => {
        server.close((err) => {
            if (err) {
                reject(err)
                console.log('fechando...')
                return
            }
            resolve()
        })
    })
}


async function shutdown(e) {
    let err = e

    console.log('finalizando a aplicação ')

    try {
        console.log('fechando tudo...')

        await close()
    } catch (e) {
        console.error(e)

        err = err || e
    }

    try {
        await mysql.pool.end(function (err) {
            console.log('matando o pool do banco')
            console.log(err)
          });

    } catch (e) {
        console.error(e)
        err = err || e
    }

    console.log('Fechando os processos')

    if (err) {
       
        process.exit(1) // Non-zero failure code
    } else {
        process.exit(0)
    }
}

process.on('SIGTERM', () => {
    console.log('Received SIGTERM')
    shutdown()
})

process.on('SIGINT', () => {
    console.log('Received SIGINT')
    shutdown()
})

process.on('uncaughtException', err => {
        console.log('Uncaught exception')
        console.error(err)
        shutdown(err)
    })