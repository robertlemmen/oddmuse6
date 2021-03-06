# Oddmuse is a wiki engine
# Copyright (C) 2018  Alex Schroeder <alex@gnu.org>
#
# This program is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License
# for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

use Page;

=head1 Storage
=head2 get-page
=begin pod
Returns a Page. These may or may not exist.
=end pod

sub get-page (Str $id) is export {
    my $dir = %*ENV<dir>;
    my $path = "$dir/page/$id.md";
    return Page.new(exists => False) unless $path.IO.e;
    my $fh = open $path, :enc('UTF-8');
    return Page.new(exists => True, text => $fh.slurp);
}

=head2 get-template
=begin pod
Returns a template. These must exist.
=end pod

sub get-template (Str $id) is export {
    my $dir = %*ENV<dir>;
    my $path = "$dir/templates/$id.sp6";
    my $fh = open $path, :enc('UTF-8');
    return $fh.slurp;
}
