//mengimport modelName di controller
const { Category, Coba } = require("../models");

exports.getAllCategories = async (req, res) => {
  // console.log(req.requestTime)
  //   res.status(200).json({
  //     status: "success",
  //     data: [
  //       {
  //         id: "01",
  //         name: "iphone",
  //       },
  //       {
  //         id: "02",
  //         name: "pc",
  //       },
  //       {
  //         id: "03",
  //         name: "laptop",
  //       },
  //     ],
  //   });
  try {
    const categories = await Category.findAll();
    return res.status(200).json({
      status: "Success",
      data: categories,
    });
  } catch (error) {
    return res.status(500).json({
      status: "Fail",
      message: "Server Down",
    });
  }
};

exports.detailCategory = async (req, res) => {
  try {
    const id = req.params.id;
    const category = await Category.findByPk(id);

    if (!category) {
      return res.status(404).json({
        status: "Fail",
        error: "id tidak ditemukan",
      });
    }

    return res.status(200).json({
      status: "Success",
      data: category,
    });
  } catch (error) {
    return res.status(500).json({
      status: "Fail",
      message: "Server Down",
    });
  }
};

exports.storeCategory = async (req, res) => {
  // console.log(req.requestTime);
  // let name = req.body.name
  // let description = req.body.description

  // if (!name && !description) {
  //     //di return supaya perintah code selanjutnya tidak dijalankan
  //     return res.status(400).json({
  //         status: "Fail",
  //         error: "Validasi failed",
  //     })
  // }

  try {
    let { name, description } = req.body;
    const newCategory = await Category.create({
      //jika key dan value nya sama
      name,
      description,
    });

    res.status(200).json({
      status: "success",
      message: "Data kategori berhasil disimpan",
      data: newCategory,
    });
  } catch (error) {
    res.status(400).json({
      status: "Fail",
      error: error.errors,
    });
  }
};

exports.updateCategory = async (req, res) => {
  try {
    const id = req.params.id;

    //req.body nya saja, nanti otomatis mengupdate data yang diubah (name atau description)
    await Category.update(req.body, {
      where: {
        id: id,
      },
    });

    const newCategory = await Category.findByPk(id);

    if (!newCategory) {
      return res.status(404).json({
        status: "Fail",
        error: "id tidak ditemukan",
      });
    }

    return res.status(200).json({
      status: "Success",
      message: "Data kategori berhasil diubah",
      data: newCategory,
    });
  } catch (error) {
    return res.status(500).json({
      status: "Fail",
      message: "Server Down",
    });
  }
};

exports.destroyCategory = async (req, res) => {
  try {
    const id = req.params.id;
    const categoryId = await Category.findByPk(id);

    if (!categoryId) {
      return res.status(404).json({
        status: "Fail",
        error: "id tidak ditemukan",
      });
    }

    await Category.destroy({
      where: {
        id: id,
      },
    });

    return res.status(200).json({
      status: "Success",
      message: `Data dengan id ${id} berhasil dihapus`,
    });
  } catch (error) {
    console.log(error);
    return res.status(500).json({
      status: "Fail",
      message: "Server Down",
    });
  }
};

exports.createCoba = async (req, res) => {
  const create_coba = await Coba.create({ name: req.body.name });
  res.status(200).json({
    message: "berhasil simpan",
    data: create_coba,
  });
};
