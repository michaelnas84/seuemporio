<?php 
$pagina = 'pedidos';

$pagina_pag = intval(@$_GET['pagina']);
$itens_pag = intval(@$_GET['itens']);

?>
<div class="container ml-2 mr-2">
	<nav class="navbar navbar-expand navbar-white navbar-light">
	
		<form method="post" id="frm" style="width: 100%; height: 40px">
			<input type="hidden" name="pag" id="pag" value="<?php echo $pagina_pag ?>">
			<input type="hidden" name="itens_pag" id="itens_pag" value="<?php echo $itens_pag ?>">
		</form>
		

			<!-- SEARCH FORM -->
			<form style="width: 100%;">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search" name="txtbuscar" id="txtbuscar" placeholder="Buscar" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit" id="btn-buscar">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>

	</nav>

	<div id="listar">
		
	</div>
</div>






<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<?php if(@$_GET['funcao']=='editar'){
					$titulo_modal = 'Editar Dados';
					$botao = 'Salvar';

					//RECUPERAR OS DADOS COM BASE NO ID QUE RECEBO
					$id = @$_GET['id'];
					$res = $pdo->query("SELECT * from vendas where id = '$id'");
					$dados = $res->fetchAll(PDO::FETCH_ASSOC);
					$cliente = $dados[0]['cliente'];
					$total = $dados[0]['total'];
					$tipo_pgto = $dados[0]['tipo_pgto'];
					$data = $dados[0]['data'];
					$hora = $dados[0]['hora'];
					$status = $dados[0]['status'];

					$form = 'form-editar';

				}else{
					$titulo_modal = 'Inserir Novo';
					$botao = 'Salvar';
					$form = 'form-inserir';
				} 
				
				$array_status = array('Aguardando', 'Em produção', 'Concluído/em entrega');
				?>
				<h5 class="modal-title" id="exampleModalLabel"><?php echo $titulo_modal ?>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">


				<form id="<?php echo $form ?>" method="post">

				<input type="text" hidden name="id" value="<?php echo @$id?>">
					<div class="form-group">
						<label for="exampleFormControlInput1">REF/CLIENTE</label>
						<input type="text" class="form-control" value="<?php echo @$id .' - '. @$cliente ?>" disabled>
					</div>

					<div class="form-group">
						<label for="exampleFormControlInput1">TOTAL/TIPO PAGAMENTO</label>
						<input type="text" class="form-control" value="<?php echo @$total .' - '. @$tipo_pgto ?>" disabled>
					</div>

					<div class="form-group">
						<label for="exampleFormControlInput1">DATA/HORA</label>
						<input type="text" class="form-control" value="<?php echo @date('d/m/Y',  strtotime($data)) .' - '. @$hora ?>" disabled>
					</div>

					<div class="form-group">
						<label for="exampleFormControlInput1">DATA/HORA</label>
						<input type="text" class="form-control" value="<?php echo @date('d/m/Y',  strtotime($data)) .' - '. @$hora ?>" disabled>
					</div>

					<div class="form-group">
						<label for="status">STATUS</label>
						<select name="status" class="form-control" style="width: 100%">
							<?php for($xx=0; $xx < count($array_status); $xx++){ ?>
							<option value="<?= $array_status[$xx] ?>" <?php if($array_status[$xx] == $status) { echo ('selected'); }; ?>><?= $array_status[$xx] ?></option>
							<?php } ?>
						</select>
					</div>

					</div>
					<div class="modal-footer">
						<button id="btn-fechar" type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>

						<button type="submit" name="<?php echo $botao ?>" id="<?php echo $botao ?>" class="btn btn-primary"><?php echo $botao ?></button>

					</div>
				</form>
			</div>
		</div>
	</div>



<!--CHAMADA DA MODAL PARA NOVO REGISTRO OU EDIÇÃO -->
<?php 
if(@$_GET['funcao'] == 'novo' || @$_GET['funcao'] == 'editar'){ 
	
	?>
	<script>$('#modal').modal("show");</script>
<?php } ?>



<!--AJAX PARA BUSCAR OS DADOS -->
<script type="text/javascript">
	$(document).ready(function(){

		var pag = "<?=$pagina?>";
		$('#btn-buscar').click(function(event){
			event.preventDefault();	
			
			$.ajax({
				url: pag + "/listar.php",
				method: "post",
				data: $('form').serialize(),
				dataType: "html",
				success: function(result){
					$('#listar').html(result)
					
				},
				

			})

		})

		
	})
</script>








<!--AJAX PARA LISTAR OS DADOS -->
<script type="text/javascript">
	$(document).ready(function(){
		
		var pag = "<?=$pagina?>";

		$.ajax({
			url: pag + "/listar.php",
			method: "post",
			data: $('#frm').serialize(),
			dataType: "html",
			success: function(result){
				$('#listar').html(result)

			},

			
		})
	})
</script>



<!--AJAX PARA BUSCAR OS DADOS PELA TXT -->
<script type="text/javascript">
	$('#txtbuscar').keyup(function(){
		$('#btn-buscar').click();
	})
</script>





<!--AJAX PARA EDIÇÃO DOS DADOS COM IMAGEM -->
	<script type="text/javascript">
		$("#form-editar").submit(function () {
	var pag = "<?=$pagina?>";
	event.preventDefault();
    var formData = new FormData(this);

    $.ajax({
       url: pag + "/editar.php",
        type: 'POST',
        data: formData,

        success: function(mensagem){
                    $('#mensagem').removeClass()

                    if(mensagem == 'Editado com Sucesso!!'){
                        
                        $('#btn-buscar').click();
           				$('#btn-fechar').click();

                    }else{
                        
                        $('#mensagem').addClass('text-danger')
                    }
                    
                    $('#mensagem').text(mensagem)

                },

       
        cache: false,
        contentType: false,
        processData: false,
        xhr: function() {  // Custom XMLHttpRequest
            var myXhr = $.ajaxSettings.xhr();
            if (myXhr.upload) { // Avalia se tem suporte a propriedade upload
                myXhr.upload.addEventListener('progress', function () {
                    /* faz alguma coisa durante o progresso do upload */
                }, false);
            }
        return myXhr;
        }
    });
});
</script>





<!--AJAX PARA EXCLUSÃO DOS DADOS -->
<script type="text/javascript">
	$(document).ready(function(){
		var pag = "<?=$pagina?>";
		$('#btn-deletar').click(function(event){
			event.preventDefault();
			
			$.ajax({
				url: pag + "/excluir.php",
				method: "post",
				data: $('form').serialize(),
				dataType: "text",
				success: function(mensagem){

					$('#mensagem_excluir').removeClass()

                    if(mensagem == 'Excluído com Sucesso!!'){
                        
                        $('#txtbuscar').val('')
						$('#btn-buscar').click();
						$('#btn-cancelar-excluir').click();

                    }else{
                        
                        $('#mensagem_excluir').addClass('text-danger')
                    }
                    
                    $('#mensagem_excluir').text(mensagem)

					

				},
				
			})
		})
	})
</script>