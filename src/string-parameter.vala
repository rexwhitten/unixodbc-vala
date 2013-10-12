/* -*- Mode: vala; indent-tabs-mode: t; c-basic-offset: 4; tab-width: 4 -*-  */
/*
 * unixodbc-vala - Vala Bindings for unixODBC
 * Copyright (C) 2013 Jens Mühlenhoff <j.muehlenhoff@gmx.de>
 * 
 * unixodbc-vala is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * unixodbc-vala is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

using GLib;

namespace UnixOdbc {

public class StringParameter : Parameter {
	internal string value;

	public override string? get_as_string () {
		if (length_or_indicator == -1) {
			return null;
		} 
		else {
			return value;
		}
	}

	internal override void* get_data_pointer () {
		return value.data;
	}

	public StringParameter (string name, string? value) {
		base (name);
		if (value == null) {
			length_or_indicator = -1;
		}
		else {
			this.value = (!) value;
			length_or_indicator = this.value.data.length;
		}
	}
}

}