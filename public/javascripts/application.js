String.prototype.rot13 = function(){
	return this.replace(/[a-zA-Z]/g, function(c){
		return String.fromCharCode((c <= "Z" ? 90 : 122) >= (c = c.charCodeAt(0) + 13) ? c : c - 26);
	});
};

$(document).ready(function(){
	$(".tweet").tweet({
      username: "kmcphillips",
      avatar_size: 32,
      count: 1,
      loading_text: "Uh-oh, here comes a tweet...",
  });
});
