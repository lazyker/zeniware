<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="currentUser" property="principal" />

<div class="footer-sticked-chat">

	<ul class="chat-conversations list-unstyled">

		<li id="member-window">
			<a href="#"  class="chat-user">
				<span class="user-status is-online"></span>
				임직원조회
				<i class="linecons-search pull-right"></i>
			</a>

			<!-- Conversation Window -->
			<div class="conversation-window">
				<!-- User Info Link in header (used to close the chat bar) -->
				<a href="#" class="chat-user">
					<span class="close">&times;</span>
					<span class="user-status is-busy"></span>
					임직원 조회
				</a>

				<ul class="conversation-messages ps-scrollbar ps-scroll-down">
					<div class="panel panel-flat-custom">
						<div class="panel-body">
							<div class="custom-jstree" id="jstreeMember"></div>
						</div>
					</div>
				</ul>

				<input type="text" class="form-control" id="txtSearch" placeholder="성명, 부서명, 메일주소, 내선번호..." />
				
			</div>
		</li>

	</ul>

</div>

<div class="hide" id="popover-head">
	<a href="#" id="anchorDetail" onclick="$('.footer-sticked-chat').popover('hide');">
		<span class="close">&times;</span>
		상세 정보
	</a>
</div>

<div class="hide" id="popover-content">

	<section class="profile-env">

		<div class="row">

			<div class="col-sm-12">

				<div class="user-info-sidebar">
					
					<a href="#" class="user-img">
						<img src="${pageContext.request.contextPath}/assets/images/user-4.png" 
							alt="user-img" class="img-cirlce img-responsive img-thumbnail" />
					</a>
					<a href="#" class="user-name" id="profileUserName">Art Ramadani</a>
					<span class="user-title" id="profileJobTitle">CEO at <strong>Google</strong></span>
					
					<div class="panel panel-flat">
						<div class="panel-body">
							<table class="table table-ellipsis">
								<tbody>
									<tr>
										<td class="middle-align" width="30%">Phone</td>
										<td id="profilePhone"></td>
									</tr>
									<tr>
										<td class="middle-align">Mobile</td>
										<td id="profileMobile"></td>
									</tr>
									<tr>
										<td class="middle-align">Email</td>
										<td id="profileMailId"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
		
	</section>
	
	<div class="vertical-top">
		<button class="btn btn-secondary btn-icon btn-icon-standalone btn-icon-standalone-right btn-block">
			<i class="fa-at"></i>
			<span>메일 보내기</span>
		</button>
		<button class="btn btn-secondary btn-icon btn-icon-standalone btn-icon-standalone-right btn-block">
			<i class="fa-calendar"></i>
			<span>일정 초대</span>
		</button>
	</div>
	
</div>

<script type="text/javascript">

	function togglePopover(visible) {
		if (visible) {
			if (!$('.popover').hasClass('in')) {
				$('.footer-sticked-chat').popover('show');
			}
		} else {
			if ($('.popover').hasClass('in')) {
				$('.footer-sticked-chat').popover('hide');
			}
		}
	}
	
	function toggleSampleChatWindow() {
		var $chat_win = jQuery("#member-window");

		$chat_win.toggleClass('open');

		if($chat_win.hasClass('open'))
		{
			var $messages = $chat_win.find('.ps-scrollbar');

			if($.isFunction($.fn.perfectScrollbar))
			{
				$messages.perfectScrollbar('destroy');

				setTimeout(function(){
					$messages.perfectScrollbar();
					$chat_win.find('.form-control').focus();
				}, 300);
			}
		} else {
			togglePopover(false);
		}
	}
	
	jQuery(document).ready(function($)
	{
		var curCompId = "${currentUser.compId}";

		/* footer member window toggle */
		$(".footer-sticked-chat .chat-user, .other-conversations-list a").on('click', function(ev)
		{
			ev.preventDefault();
			toggleSampleChatWindow();
		});
		
		/* jsTree Data Binding */
		$('#jstreeMember').jstree({
			'core': {
				'data': {
					'url': function(node) {
						var paramCompId = node.id.substr(1, 3);
						var paramDeptId = node.id.substr(4, 4);
						
						return node.id == '#' ? 
							'../admin/ajax/getDeferredNodelist?compId=' + curCompId + '&nodeType=root' : 
							'../admin/ajax/getDeferredNodelist?compId=' + paramCompId + '&deptId=' + paramDeptId + '&nodeType=child';
					}, 
					'data': function(node) {
						return { 'id': node.id };
					}
				}
			}
		});
		
		$('.footer-sticked-chat').popover({
			html: true, 
			title: function() { return $('#popover-head').html(); }, 
			content: function() { return $('#popover-content').html(); }, 
			trigger: 'manual', 
			placement: 'left'
		});
		
		/* Detail View */
		$('#jstreeMember').on('changed.jstree', function(e, data) {
			if (data.node != null) {
				if (data.node.id.substr(0, 1) == 'U') {
					$.ajax({
						dataType: "json", 
						type: "post", 
						url: "../admin/ajax/getSingleUser", 
						data: { compId: data.node.id.substr(1, 3), userId: data.node.id.substr(4) }, 
						success: function(result) {
							$('#profileUserName').html(result.userName);
							$('#profileJobTitle').html(result.jobTitleName + ' <strong>' + result.deptName + '</strong>');
							$('#profilePhone').html(result.officePhone);
							$('#profileMobile').html(result.mobile);
 							$('#profileMailId').html(result.mailId);
						}
					});
					
					togglePopover(true);
				} else {
					togglePopover(false);
				}
			}
		});
		
		/* jsTree Search... */
		$('#txtSearch').on('keyup', function(event) {
			if (event.keyCode == 13) {
				var keyword = $(this).val();
				
				$('#jstreeMember').jstree().settings.core.data = {
					'url': function(node) {
						var paramCompId = node.id.substr(1, 3);
						var paramDeptId = node.id.substr(4, 4);

						return node.id == '#' ?
							keyword.length == 0 ? 
								'../admin/ajax/getDeferredNodelist?compId=' + curCompId + '&nodeType=root' : 
								'../admin/ajax/getNodelistSearch?compId=' + curCompId + '&keyword=' + keyword : 
							'../admin/ajax/getDeferredNodelist?compId=' + paramCompId + '&deptId=' + paramDeptId + '&nodeType=child';
					}, 
					'data': function(node) {
						return { 'id': node.id };
					}
				}
				
				togglePopover(false);

				$('#jstreeMember').jstree().refresh();
				$('#member-window .ps-scrollbar').perfectScrollbar('destroy');
				$('#member-window .ps-scrollbar').perfectScrollbar();;
			}
		});
		
	});
</script>