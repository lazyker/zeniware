<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="footer-sticked-chat">

	<ul class="chat-conversations list-unstyled">

		<li id="sample-chat-window">
			<a href="#"  class="chat-user">
				<span class="user-status is-online"></span>
				임직원조회
				<i class="linecons-search pull-right"></i>
			</a>

			<!-- Conversation Window -->
			<div class="conversation-window">
				<!-- User Info Link in header (used to close the chat bar) -->
				<a href="#"  class="chat-user">
					<span class="close">&times;</span>
					<span class="user-status is-busy"></span>
					임직원 조회
				</a>

				<ul class="conversation-messages ps-scrollbar ps-scroll-down">
					<div id="jstreeMember"></div>
				</ul>

				<input type="text" class="form-control" placeholder="성명, 부서명, 직위, 내선번호..." />
				
			</div>
		</li>

	</ul>

</div>

<script type="text/javascript">

	function toggleSampleChatWindow()
	{
		var $chat_win = jQuery("#sample-chat-window");

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
// 		$('.conversation-messages').perfectScrollbar();
		
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
		
		/* jsTree Data Binding */
		$("#jstreeMember").jstree({
			"core": {
				"multiple": false, 
				"data": { 
					url: "../admin/ajax/getNodelist", 
					data: { compId: "001" }
				}
			}
		});
		
	});
</script>