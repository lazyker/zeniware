<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title">
			
	<div class="title-env">
		<h1 class="title">조직도 관리</h1>
		<p class="description">Dynamic table variants with pagination and other controls</p>
	</div>

	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="dashboard-1.html"><i class="fa-home"></i>Home</a></li>
			<li><a href="tables-basic.html">Tables</a></li>
			<li class="active"><strong>Data Tables</strong></li>
		</ol>
	</div>
	
</div>

<div class="row">
	<div class="col-sm-4">
	
		<div class="panel panel-default">
			
			<div class="panel-heading">
				<h3 class="panel-title">조직도 목록</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-gray btn-xs" id="btnGroupAdd">추가</button>
						<button class="btn btn-white btn-xs" id="btnGroupEdit">변경</button>
						<button class="btn btn-gray btn-xs" id="btnGroupDelete">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<div id="jstree_demo_div">
					<ul>
						<li>Root node 1
							<ul>
								<li>Child node 1</li>
								<li>Child node 2</li>
							</ul>
						</li>
						<li>Root node 2</li>
					</ul>
				</div>
			</div>
		
		</div>
	
	</div>
	
	<div class="col-sm-8">
		
		<div class="panel panel-default">
		
			<div class="panel-heading">
				<h3 class="panel-title">부서원 관리</h3>
				
				<div class="panel-options">
					<div class="btn-group">
						<button class="btn btn-gray btn-xs" id="btnCodeAdd">추가</button>
						<button class="btn btn-white btn-xs" id="btnCodeDelete">삭제</button>
					</div>
				</div>
			</div>
			
			<div class="panel-body">
				<table id="example" class="table table-small-font table-striped table-bordered">
					<thead>
						<tr>
							<th class="no-sorting"><input type="checkbox" class="cbr"></th>
							<th>성명</th>
							<th>ID</th>
		 					<th>직위</th>
							<th>메일</th>
						</tr>
					</thead>
				</table>
			</div>
		
		</div>
	
	</div>
</div>

<script type="text/javascript">

	$(document).ready(function() {
		
		$("#jstree_demo_div").jstree({
			"core": {
				"animation": 0, 
				"check_callback": true, 
				"themes": { "responsive": false }, 
				"data": [
       		{ "id": "ajson1", "parent": "#", "text": "Simple root node" }, 
       		{ "id": "ajson4", "parent": "ajson2", "text": "Child 2" }, 
       		{ "id": "ajson2", "parent": "#", "text": "Root node 2" }, 
       		{ "id": "ajson3", "parent": "ajson2", "text": "Child 1" }
        ]
			}, 
			"types": {
				"default": {
					"icon": "glyphicon glyphicon-user"
				}
			}, 
			"plugins": [ "types" ]
		});

	});

/* ***References***
	
*/

</script>