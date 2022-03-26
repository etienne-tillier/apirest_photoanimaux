const {admin} = require("../config/firebase-config")

const decodeToken = async (req, res, next) => {
    if (req.headers.authorization){
        const token = req.headers.authorization.split(" ")[1]    
        try {
            const decodeValue = await admin.auth().verifyIdToken(token)
            if (decodeValue){
                return next()
            }
            else {
                return res.status(401).json({message: "Non autorisé"})
            }
        } catch (error) {
            res.status(404).json({message: "Erreur interne"})
        }
    }
    else {
        res.status(401).json({message: "Non autorisé"})
    }
}


module.exports = {
    decodeToken
}