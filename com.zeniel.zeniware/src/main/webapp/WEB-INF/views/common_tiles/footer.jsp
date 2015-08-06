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

<script type="text/javascript">

	function toggleSampleChatWindow()
	{
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
		}
	}
	
	jQuery(document).ready(function($)
	{

		$(".footer-sticked-chat .chat-user, .other-conversations-list a").on('click', function(ev)
		{
			ev.preventDefault();
			toggleSampleChatWindow();
		});

		$(".mobile-chat-toggle").on('click', function(ev)
		{
			ev.preventDefault();

			$(".footer-sticked-chat").toggleClass('mobile-is-visible');
		});
		
		var curCompId = "${currentUser.compId}";
		
		/* jsTree Data Binding */
		$('#jstreeMember').jstree({
			'core': {
				'data': {
					'url': function(node) {
						var paramCompId = node.id.substr(0, 3);
						var paramDeptId = node.id.substr(3, 4);
						
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
		
		$('#jstreeMember').on('dblclick.jstree', function(e, data) {
			e.preventDefault();
		});
		
		/* jsTree Search... */
		$('#txtSearch').on('keyup', function(event) {
			if (event.keyCode == 13) {
				var keyword = $(this).val();
				
				$('#jstreeMember').jstree().settings.core.data = {
					'url': function(node) {
						var paramCompId = node.id.substr(0, 3);
						var paramDeptId = node.id.substr(3, 4);
						
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

				$('#jstreeMember').jstree().refresh();
				$('#member-window .ps-scrollbar').perfectScrollbar('destroy');
				$('#member-window .ps-scrollbar').perfectScrollbar();;
			}
		});
		
	});
</script>