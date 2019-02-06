use strict;
use Irssi;

sub send_notification {
    my($msg) = @_;
    $msg = add_slashes($msg);
    $msg = quote_strings($msg);
    system("~/.bin/inotify.py \"$msg\" &");
}

sub print_text_notify {
	my ($dest, $text, $stripped) = @_;
	my $server = $dest->{server};

	return if (!$server || !($dest->{level} & MSGLEVEL_HILIGHT));
	my $sender = $stripped;
    $sender =~ s/([\w]+).*/$1/;
	$sender =~ s/.{2}/$2/;
    $stripped =~ s/.{2}\S+ - // ;
	my $channel = $dest->{target};
	send_notification("Mentioned in $channel by $sender: $stripped");
}

sub event_privmsg {
    my ($server, $data, $nick, $address) = @_;

	return if (!$server);
	send_notification("Private message from $nick: $data");
}

sub add_slashes {
    my($text) = shift;
    $text =~ s/\\/\\\\/g;
    $text =~ s/"/\\"/g;
    $text =~ s/\\0/\\\\0/g;
    return $text;
}

sub quote_strings {
    my($text) = shift;
    $text =~ s/`/\\`/g;
    return $text;
}

Irssi::signal_add('print text', 'print_text_notify');
Irssi::signal_add('message private', 'event_privmsg');
