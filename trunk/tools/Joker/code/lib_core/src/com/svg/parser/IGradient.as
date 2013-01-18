package com.svg.parser 
{
	import flash.geom.Matrix;
	import com.svg.parser.style.Transform;
	import com.svg.parser.model.Data;

	public interface IGradient 
	{
		function getId():String;
		function setData( data:Data ):void ;
		function get type():String;
		function get colors():Array;
		function get alphas():Array;
		function get ratios():Array;
		function get matrix():Matrix;
		function get method():String;
		function get linked():String;
		function get transform():Transform;
		function get unit():String;
	}
	
}