const express = require('express');
const app = express();
const dotenv = require('dotenv');
const cors = require('cors');
const CategoryRouter = require('./router/CategoryRouter');
const AuthRouter = require('./router/AuthRouter') 
const morgan = require('morgan');

dotenv.config()

//middleware
app.use(express.json())
// app.use((req,res,next) => {
//     req.requestTime = new Date().toISOString()
//     next()
// })
app.use(morgan("dev"))
app.use(cors())

//routing
//route parent endpoint api categories
app.use('/api/v1/categories', CategoryRouter)

app.use('/api/v1/auth', AuthRouter)





//server
const port = process.env.PORT
app.listen(port, ()=>{
    console.log(`Server berjalan di port ${port}`)
})

