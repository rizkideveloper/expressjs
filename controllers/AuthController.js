//mengimport modelName di controller
const { User } = require("../models");
const jwt = require('jsonwebtoken')

const signToken = id => {
    return jwt.sign({id}, process.env.JWT_SECRET, {
        expiresIn: process.env.JWT_EXPIRES_IN
    })
}

exports.registerUser = async (req, res) => {
  try {
    //rentan diserang hacker
    // let { name, email, password, passwordConfirm } = req.body;
    
    if (req.body.password != req.body.passwordConfirm) {
      return res.status(400).json({
        message: "Validasi Erorr",
        error: ["Password dan PasswordConfirm tidak sama"],
      });
    }

    const newUser = await User.create({
        name: req.body.name,
        email: req.body.email,
        password: req.body.password
    })

    const token = signToken(newUser.id)

    return res.status(200).json({
        message: "Berhasil Register",
        token,
        data: newUser
    })

  } catch (error) {
    return res.status(400).json({
      message: "Validasi Error",
      error: error.errors.map(err => err.message),
    });
  }
};

exports.loginUser = async(req,res) =>{
    // 1)fungsi validasi
    if (!req.body.email || !req.body.password) {
        return res.status(400).json({
            status : "Fail",
            message: "Error Validasi",
            error: "Silahkan input email atau password"
        })
    }

    // 2)check jika user email yang dimasukkan di request sudah ada di DB dan password sudah benar yang diinput di request
    const userData = await User.findOne({where: {email : req.body.email}})

    if (!userData || !(await userData.CorrectPassword(req.body.password, userData.password))) {
        return res.status(400).json({
            status: "Fail",
            message: "Error Login",
            error: "Invalid Email Or Password"
        })
    }

    //3)tampilkan token di respon pada saat login
    const token = signToken(userData.id)

    return res.status(200).json({
        status: "Success",
        message: "Login Berhasil",
        token
    })
}
