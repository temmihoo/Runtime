#
# Copyright (c) 2013 ELL-i co-operative.
#
# ELL-i software is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# ELL-i software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with ELL-i software.  If not, see <http://www.gnu.org/licenses/>.
#
#

TARGETS = \
    test_pinMode \

.PHONY : $(TARGETS) all clean

all:	$(TARGETS)
all:	TARGET=all

clean:	$(TARGETS)
clean:	TARGET=clean

$(TARGETS): %:
	$(MAKE) -C $* -f `pwd`/../make/app.mk TOP=`pwd`/../ APP=$@ TARGET=arduino $(TARGET)

