function fish_prompt -d Hydro

	set_color blue
	echo -n (hostname)
	set_color brblack
	echo -n ":"
	set_color green
	echo -n (prompt_pwd)

	set_color red
	echo -n ' | '

	set_color reset



end
