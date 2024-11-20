const express = require("express");
const router = express.Router();
//export controller
const {
  getAllCategories,
  storeCategory,
  updateCategory,
  detailCategory,
  destroyCategory,
  createCoba,
} = require("../controllers/CategoryController");

// api/v1/categories/
// Read Data FindAll 
router.get("/", getAllCategories);

//Detail data
router.get("/:id", detailCategory);

//Create Data
router.post("/", storeCategory);

//Update data
router.put("/:id", updateCategory);

//Delete data
router.delete("/:id", destroyCategory);

router.post("/create", createCoba);

// api/v1/categories/filterData
router.get("/filterData", (req, res) => {
  res.send(`route filter data`);
});

// api/v1/categories/:name
router.get("/:name", (req, res) => {
  res.send(`Categories dari ${req.params.name} `);
});

// app.get('/api/v1/categories/filterData', (req,res)=>{
//     res.send(`route filter data`)
// })

module.exports = router;
