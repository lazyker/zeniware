<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-title" style="padding:10px 0 !important;">
	<div class="title-env">
		<h1 class="title">커뮤니티 게시</h1>
	</div>
	<div class="breadcrumb-env">
		<ol class="breadcrumb bc-1" >
			<li><a href="${pageContext.request.contextPath}/"><i class="fa-home"></i>Home</a></li>
			<li><a href="./cumtMain">Community</a></li>
		</ol>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<ul class="nav nav-tabs">
			<li class="active">
				<a href="#all" data-toggle="tab">최신글</a>
			</li>
			<li>
				<a href="#administrators" data-toggle="tab">Administrators</a>
			</li>
			<li>
				<a href="#subscribers" data-toggle="tab">Subscribers</a>
			</li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="all">
				<table class="table table-hover members-table middle-align">
					<thead>
						<tr>
							<th></th>
							<th class="hidden-xs hidden-sm"></th>
							<th>Name and Role</th>
							<th class="hidden-xs hidden-sm">E-Mail</th>
							<th>ID</th>
							<th>Settings</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="1" checked />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-1.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">Jack Gates</a>
								<span>Administrator</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">jack@topshop-tv.com</span>
							</td>
							<td class="user-id">
								1232518142
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="2" checked />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-2.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">Arlind Nushi</a>
								<span>Subscriber</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">me@arlindnushi.com</span>
							</td>
							<td class="user-id">
								1232518110
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="1" />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-3.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">Bryan Green</a>
								<span>Editor</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">bryan@green.com</span>
							</td>
							<td class="user-id">
								1232518153
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="1" />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-4.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">John Smith</a>
								<span>Administrator</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">johnsmith@gmail.com</span>
							</td>
							<td class="user-id">
								1234567890
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="1" />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-5.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">Nicholas Walker</a>
								<span>Editor</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">nickw@live.com</span>
							</td>
							<td class="user-id">
								1232518167
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="6" checked />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-1.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">Jack Gates</a>
								<span>Administrator</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">jack@topshop-tv.com</span>
							</td>
							<td class="user-id">
								1232518142
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="7" checked />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-2.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">Arlind Nushi</a>
								<span>Subscriber</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">me@arlindnushi.com</span>
							</td>
							<td class="user-id">
								1232518110
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="8" />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-3.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">Bryan Green</a>
								<span>Editor</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">bryan@green.com</span>
							</td>
							<td class="user-id">
								1232518153
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="9" />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-4.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">John Smith</a>
								<span>Administrator</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">johnsmith@gmail.com</span>
							</td>
							<td class="user-id">
								1234567890
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="10" />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-5.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">Nicholas Walker</a>
								<span>Editor</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">nickw@live.com</span>
							</td>
							<td class="user-id">
								1232518167
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="row">
				</div>
			</div>

			<div class="tab-pane" id="administrators">
				<table class="table table-hover members-table middle-align">
					<thead>
						<tr>
							<th></th>
							<th class="hidden-xs hidden-sm"></th>
							<th>Name and Role</th>
							<th class="hidden-xs hidden-sm">E-Mail</th>
							<th>ID</th>
							<th>Settings</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="1" checked />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-1.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name">
								<a href="#" class="name">Jack Gates</a>
								<span>Administrator</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">jack@topshop-tv.com</span>
							</td>
							<td class="user-id">
								1232518142
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="tab-pane" id="subscribers">
				<table class="table table-hover members-table middle-align">
					<thead>
						<tr>
							<th></th>
							<th class="hidden-xs hidden-sm"></th>
							<th>Name and Role</th>
							<th class="hidden-xs hidden-sm">E-Mail</th>
							<th>ID</th>
							<th>Settings</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="user-cb">
								<input type="checkbox" class="cbr" name="members-list[]" value="2" />
							</td>
							<td class="user-image hidden-xs hidden-sm">
								<a href="#">
									<img src="assets/images/user-2.png" class="img-circle" alt="user-pic" />
								</a>
							</td>
							<td class="user-name hidden-xs hidden-sm">
								<a href="#" class="name">Arlind Nushi</a>
								<span>Subscriber</span>
							</td>
							<td class="hidden-xs hidden-sm">
								<span class="email">me@arlindnushi.com</span>
							</td>
							<td class="user-id">
								1232518110
							</td>
							<td class="action-links">
								<a href="#" class="edit">
									<i class="linecons-pencil"></i>
									Edit Profile
								</a>

								<a href="#" class="delete">
									<i class="linecons-trash"></i>
									Delete
								</a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>