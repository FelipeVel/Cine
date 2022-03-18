// @APIVersion 1.0.0
// @Title beego Test API
// @Description beego has a very cool tools to autogenerate documents for your API
// @Contact astaxie@gmail.com
// @TermsOfServiceUrl http://beego.me/
// @License Apache 2.0
// @LicenseUrl http://www.apache.org/licenses/LICENSE-2.0.html
package routers

import (
	"github.com/FelipeVel/Cine/Backend/api_cine/controllers"

	"github.com/astaxie/beego"
)

func init() {
	ns := beego.NewNamespace("/v1",

		beego.NSNamespace("/pelicula",
			beego.NSInclude(
				&controllers.PeliculaController{},
			),
		),

		beego.NSNamespace("/funcion",
			beego.NSInclude(
				&controllers.FuncionController{},
			),
		),

		beego.NSNamespace("/sala",
			beego.NSInclude(
				&controllers.SalaController{},
			),
		),

		beego.NSNamespace("/sede",
			beego.NSInclude(
				&controllers.SedeController{},
			),
		),

		beego.NSNamespace("/cliente",
			beego.NSInclude(
				&controllers.ClienteController{},
			),
		),

		beego.NSNamespace("/orden",
			beego.NSInclude(
				&controllers.OrdenController{},
			),
		),

		beego.NSNamespace("/boleta",
			beego.NSInclude(
				&controllers.BoletaController{},
			),
		),

		beego.NSNamespace("/silla",
			beego.NSInclude(
				&controllers.SillaController{},
			),
		),

		beego.NSNamespace("/rol",
			beego.NSInclude(
				&controllers.RolController{},
			),
		),

		beego.NSNamespace("/empleado",
			beego.NSInclude(
				&controllers.EmpleadoController{},
			),
		),

		beego.NSNamespace("/snack",
			beego.NSInclude(
				&controllers.SnackController{},
			),
		),

		beego.NSNamespace("/pedidos_snacks",
			beego.NSInclude(
				&controllers.PedidosSnacksController{},
			),
		),

		beego.NSNamespace("/inventario_snacks",
			beego.NSInclude(
				&controllers.InventarioSnacksController{},
			),
		),
	)
	beego.AddNamespace(ns)
}
