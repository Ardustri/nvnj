/*																									**/
/*																									**/
/*									NVN Library Architecture								**/
/*						Licansed Under LGPL 2.1, see LICENSE for Details			**/
/*										© Ardustri 2021										**/
/*																									**/
#pragma once
int n_not(int x)
{
	if (x == 1)
	{
		return 0;
	}
	else
	{
		return 1;
	}
}
int n_or(int x, int y)
{
	if (x == 1 || y == 1)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}
int n_and(int x, int y)
{
	if (x == 1 && y == 1)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}
