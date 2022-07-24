<?php 

require_once("../conexao.php");
@session_start();

$id = $id_venda;
$pdo->query("UPDATE vendas set status = 'Concluído', pago = 'Sim' where id = '$id'");



?>