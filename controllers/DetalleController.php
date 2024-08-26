<?php

namespace Controllers;

use Exception;
use Model\Cliente;
use MVC\Router;

class DetalleController 
{
    public static function index(Router $router)
    {
        $clientes = Cliente::find(2);
        $router->render('cliente/index');
    }

    public static function detalleVentasAPI(){
        try {
            $sql = "SELECT
            cli_id AS cliente_id,
            cli_nombre AS cliente_nombre,
             COUNT(detalle_id) AS cantidad_compras
            FROM
                clientes
        LEFT JOIN
            detalle_ventas ON cli_id = detalle_cliente
        GROUP BY
            cli_id, 
        cli_nombre
    ORDER BY
    cantidad_compras DESC;";
            
            $datos = cliente :: fetchArray($sql);
            echo json_encode($datos);
        }catch(Exception $e){
            echo json_encode([
                'detalle' => $e->getMessage(),
                'mensaje' => 'Ocurrio un error',
                'codigo' => 0
            ]);

        }
    }





   
}
