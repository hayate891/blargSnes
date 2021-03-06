// -----------------------------------------------------------------------------
// Copyright 2014 StapleButter
//
// This file is part of blargSnes.
//
// blargSnes is free software: you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free
// Software Foundation, either version 3 of the License, or (at your option)
// any later version.
//
// blargSnes is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with blargSnes. If not, see http://www.gnu.org/licenses/.
// -----------------------------------------------------------------------------

// setup constants
.alias myconst c9 as (0.0, 0.0, 0.0078125, 1.0)

// setup outmap
.alias resultposition o0 as position
.alias resultcolor    o1 as color

// setup uniform map (not required)
.alias projMtx c0-c3

// INPUT
// - VERTEX ATTRIBUTES -
// v0: vertex (x, y, and optional z)
// v1: texcoord
// - UNIFORMS -
// c0-c3: projection matrix
// c4: texcoord scale

vmain:
	mov r1.xyz, v0.xyz
	mov r1.w, c9.w

	// result.pos = projMtx * temp.pos
	dp4 o0.x, projMtx[0], r1
	dp4 o0.y, projMtx[1], r1
	dp4 o0.z, projMtx[2], r1
	dp4 o0.w, projMtx[3], r1

	// result.texcoord = in.texcoord * (uniform scale in c4)
	mul r1, c4, v1
	mov o1, r1
	end
	nop
end_vmain:
