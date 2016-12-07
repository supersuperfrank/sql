delimiter ||
/*drop procedure if exists see_the_profile*/
create procedure see_the_bulletin_comments ( in user_name varchar(20), in view_page_owner varchar(20) )
begin
	call DefineTheRelation( user_name, view_page_owner, @result);
	if user_name = view_page_owner then
		select bulletin_comments.*
        from user_profile, bulletin_comments
        where bulletin_comments.user_name = view_page_owner and user_profile.user_name = view_page_owner 
		order by bulletin_comments.comment_time desc;
               
	elseif @result = 1 then
		select bulletin_comments.*
        from user_profile, bulletin_comments
        where bulletin_comments.user_name = view_page_owner and user_profile.user_name = view_page_owner and user_profile.profile_view_priority >= 1
        order by bulletin_comments.comment_time desc;
                       
	elseif @result = 2 then
		select bulletin_comments.*
        from user_profile, bulletin_comments
        where bulletin_comments.user_name = view_page_owner and user_profile.user_name = view_page_owner and user_profile.profile_view_priority >= 2
        order by bulletin_comments.comment_time desc;
                       
	else
		select bulletin_comments.*
        from user_profile, bulletin_comments
        where bulletin_comments.user_name = view_page_owner and user_profile.user_name = view_page_owner and user_profile.profile_view_priority >= 3
        order by bulletin_comments.comment_time desc;
                       
    end if;
end
delimiter ;

/*call see_the_bulletin_comments (  'Harry Potter', 'chelseaisgood' )*/
/*call see_the_bulletin_comments (  'Terminator', 'chelseaisgood' )*/
/*call see_the_bulletin_comments (  'Yujia Zhai', 'chelseaisgood'  )*/