export const success = (req, res, dataProcess, status) => {
    res.status(status || 200).send({
        infoProcess: 'success', 
        dataProcess,
        error: ''
    })
}

export const error = (req, res, infoError, status, errorSystem) => {
    console.log(errorSystem);
    res.status(status || 500).send({
        infoProcess: 'error',
        dataProcess: '',
        error: infoError
    })
}

