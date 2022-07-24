<?php 

require_once("../../conexao.php");
@session_start();

	$id 		= $_POST['id'];
	$status 	= $_POST['status'];

$res = ("UPDATE vendas SET status = $status where id = $id");

 	$res = $pdo->prepare("UPDATE vendas SET status = :status where id = :id");

	
	$res->bindValue(":status", $status);
	$res->bindValue(":id", $id);
	
	$res->execute();

	

	echo "Editado com Sucesso!!";


?>