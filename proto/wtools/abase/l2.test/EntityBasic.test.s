( function _EntityBasic_test_s_()
{

'use strict';

if( typeof module !== 'undefined' )
{

  const _ = require( '../../../node_modules/Tools' );

  _.include( 'wTesting' );

  require( '../l2/EntityBasic.s' );

}

const _global = _global_;
const _ = _global_.wTools;

// --
// tests
// --

// function eachInMultiRange( test )
// {
//
//   var o =
//   {
//     ranges : [ 1 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 1 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 0, 0 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   _.eachInMultiRange( o );
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ 0, 0 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 0, 3 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   _.eachInMultiRange( o );
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ 0, 3 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 3, 0 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   _.eachInMultiRange( o );
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ 3, 0 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 1, 1 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 1, 1 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 1, 3 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 0, 1 ],
//     [ 0, 2 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 1, 3 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 2, 2 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 1, 0 ],
//     [ 0, 1 ],
//     [ 1, 1 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 2, 2 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 3, Infinity ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 1, 0 ],
//     [ 2, 0 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 3, Infinity ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ Infinity, 3 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 0, 1 ],
//     [ 0, 2 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ Infinity, 3 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ Infinity, Infinity ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ Infinity, Infinity ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 1, 2, 3 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0, 0 ],
//     [ 0, 1, 0 ],
//     [ 0, 0, 1 ],
//     [ 0, 1, 1 ],
//     [ 0, 0, 2 ],
//     [ 0, 1, 2 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 1, 2, 3 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   /* array of arrays */
//
//   var o =
//   {
//     ranges : [ [ 0, 1 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, 1 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 0 ], [ 0, 0 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   _.eachInMultiRange( o );
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 0 ], [ 0, 3 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   _.eachInMultiRange( o );
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 3 ], [ 0, 0 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   _.eachInMultiRange( o );
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ [ 0, 3 ], [ 0, 0 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 1 ], [ 0, 1 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 1 ], [ 0, 3 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 0, 1 ],
//     [ 0, 2 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 2 ], [ 0, 2 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 1, 0 ],
//     [ 0, 1 ],
//     [ 1, 1 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, 2 ], [ 0, 2 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 3 ], [ 0, Infinity ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 1, 0 ],
//     [ 2, 0 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, 3 ], [ 0, Infinity ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, Infinity ], [ 0, 3 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 0, 1 ],
//     [ 0, 2 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, Infinity ], [ 0, 3 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, Infinity ], [ 0, Infinity ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, Infinity ], [ 0, Infinity ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   var o =
//   {
//     ranges : [ [ Infinity, Infinity ], [ Infinity, Infinity ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ Infinity, Infinity ], [ Infinity, Infinity ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ Infinity, 1 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ Infinity, 1 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 1, Infinity ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 1, Infinity ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ Infinity, 2 ], Infinity ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 1, 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ Infinity, 2 ], Infinity ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ Infinity, 2 ], [ Infinity, 2 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 1, 1 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ Infinity, 2 ], [ Infinity, 2 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ Infinity, 2 ], [ Infinity, 2 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 1, 1 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ Infinity, 2 ], [ Infinity, 2 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0, 0 ],
//     [ 0, 1, 0 ],
//     [ 0, 0, 1 ],
//     [ 0, 1, 1 ],
//     [ 0, 0, 2 ],
//     [ 0, 1, 2 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0, 0 ],
//     [ 0, 1, 0 ],
//     [ 0, 0, 1 ],
//     [ 0, 1, 1 ],
//     [ 0, 0, 2 ],
//     [ 0, 1, 2 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   /* object */
//
//   var o =
//   {
//     ranges : { a : 1, b : 2, c : 3 },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     { a : 0, b : 0, c : 0 },
//     { a : 0, b : 1, c : 0 },
//     { a : 0, b : 0, c : 1 },
//     { a : 0, b : 1, c : 1 },
//     { a : 0, b : 0, c : 2 },
//     { a : 0, b : 1, c : 2 }
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { a : 1, b : 2, c : 3 } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     { a : 0, b : 0, c : 0 },
//     { a : 0, b : 1, c : 0 },
//     { a : 0, b : 0, c : 1 },
//     { a : 0, b : 1, c : 1 },
//     { a : 0, b : 0, c : 2 },
//     { a : 0, b : 1, c : 2 }
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   /*  */
//
//   var o =
//   {
//     ranges : [ 2, 1 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 1, 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 2, 1 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   var o =
//   {
//     ranges : [ -1, 1 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 )
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ -1, 1 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 2, 1 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 2, 1 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   var o =
//   {
//     ranges : [ [ -1, 1 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ -1 ],
//     [ 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ -1, 1 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 1, 1 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 1, 1 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 1, 2 ], [ 2, 1 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 1, 2 ], [ 2, 1 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 1, 2 ], [ -1, 1 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 1, -1 ],
//     [ 1, 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 1, 2 ], [ -1, 1 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 1, 2 ], [ 1, 1 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 1, 2 ], [ 1, 1 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : [ 2, 1 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : [ 2, 1 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   var o =
//   {
//     ranges : { 0 : [ 1, 1 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : [ 1, 1 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   var o =
//   {
//     ranges : { 0 : [ 1, -1 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : [ 1, -1 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : -1 },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : -1 } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : [ -1, 1 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     { 0 : -1 },
//     { 0 : 0 }
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : [ -1, 1 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : [ 1, 2 ], 1 : [ 2, 1 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : [ 1, 2 ], 1 : [ 2, 1 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : [ 1, 2 ], 1 : [ -1, 1 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//     { 0 : 1, 1 : -1 },
//     { 0 : 1, 1 : 0 }
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : [ 1, 2 ], 1 : [ -1, 1 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : [ 1, 2 ], 1 : [ 1, 1 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 0
//   }
//   var expected =
//   [
//   ]
//   var got = _.eachInMultiRange( o );
//   test.identical( got, 0 );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : [ 1, 2 ], 1 : [ 1, 1 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 0 );
//
//   /* delta */
//
//   var o =
//   {
//     ranges : [ 6 ],
//     onEach : null,
//     result : [],
//     delta : [ 2 ],
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0 ],
//     [ 2 ],
//     [ 4 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 6 ] );
//   test.identical( o.delta, [ 2 ] );
//   test.identical( o.estimate, 0 );
//
//   var o =
//   {
//     ranges : [ 6, 2 ],
//     onEach : null,
//     result : [],
//     delta : [ 2, 1 ],
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 2, 0 ],
//     [ 4, 0 ],
//     [ 0, 1 ],
//     [ 2, 1 ],
//     [ 4, 1 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 6, 2 ] );
//   test.identical( o.delta, [ 2, 1 ] );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 6 ] ],
//     onEach : null,
//     result : [],
//     delta : [ 2 ],
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0 ],
//     [ 2 ],
//     [ 4 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 0, 6 ] ] );
//   test.identical( o.delta, [ 2 ] );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 6 ], [ 0, 2 ] ],
//     onEach : null,
//     result : [],
//     delta : [ 2, 1 ],
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0 ],
//     [ 2, 0 ],
//     [ 4, 0 ],
//     [ 0, 1 ],
//     [ 2, 1 ],
//     [ 4, 1 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges,  [ [ 0, 6 ], [ 0, 2 ] ] );
//   test.identical( o.delta, [ 2, 1 ] );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : [ 0, 6 ] },
//     onEach : null,
//     result : [],
//     delta : { 0 : 2 },
//     estimate : 0
//   }
//   var expected =
//   [
//     { 0 : 0 },
//     { 0 : 2 },
//     { 0 : 4 }
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : [ 0, 6 ] } );
//   test.identical( o.delta, { 0 : 2 } );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : [ 0, 6 ], 1 : [ 0, 2 ] },
//     onEach : null,
//     result : [],
//     delta : { 0 : 2, 1 : 1 },
//     estimate : 0
//   }
//   var expected =
//   [
//     { 0 : 0, 1 : 0 },
//     { 0 : 2, 1 : 0 },
//     { 0 : 4, 1 : 0 },
//     { 0 : 0, 1 : 1 },
//     { 0 : 2, 1 : 1 },
//     { 0 : 4, 1 : 1 }
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, { 0 : [ 0, 6 ], 1 : [ 0, 2 ] } );
//   test.identical( o.delta, { 0 : 2, 1 : 1 } );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 6 ],
//     onEach : null,
//     result : [],
//     delta : [ 3 ],
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0 ],
//     [ 3 ],
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 6 ] );
//   test.identical( o.delta, [ 3 ] );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 6 ],
//     onEach : null,
//     result : [],
//     delta : [ 10 ],
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 6 ] );
//   test.identical( o.delta, [ 10 ] );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 5, 10, 15 ],
//     onEach : null,
//     result : [],
//     delta : [ 6, 11, 16 ],
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 0, 0, 0 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ 5, 10, 15 ] );
//   test.identical( o.delta, [ 6, 11, 16 ] );
//   test.identical( o.estimate, 0 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 1, 3 ], [ 2, 6 ], [ 4, 8 ] ],
//     onEach : null,
//     result : [],
//     delta : [ 1, 3, 4 ],
//     estimate : 0
//   }
//   var expected =
//   [
//     [ 1, 2, 4 ],
//     [ 2, 2, 4 ],
//     [ 1, 5, 4 ],
//     [ 2, 5, 4 ]
//   ]
//   _.eachInMultiRange( o );
//   test.identical( o.result, expected )
//   test.identical( o.ranges, [ [ 1, 3 ], [ 2, 6 ], [ 4, 8 ] ] );
//   test.identical( o.delta, [ 1, 3, 4 ] );
//   test.identical( o.estimate, 0 );
//
//   /* estimate */
//
//   var o =
//   {
//     ranges : [ 6 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = { length : 6 };
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ 6 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   //
//
//   var o =
//   {
//     ranges : [],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = 0;
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   //
//
//   var o =
//   {
//     ranges : [ 2, 6 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = { length : 12 };
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ 2, 6 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   //
//
//   var o =
//   {
//     ranges : [ -1, 6 ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = { length : -6 };
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ -1, 6 ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   //
//
//   var o =
//   {
//     ranges : [ [ 0, 6 ], [ 0, 5 ] ],
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = { length : 30 };
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, [ [ 0, 6 ], [ 0, 5 ] ] );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : 0 },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = { length : 0 };
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, { 0 : 0 } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : 6 },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = { length : 6 };
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, { 0 : 6 } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : 2, 1 : 2 },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = { length : 4 };
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, { 0 : 2, 1 : 2 } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : [ 0, 2 ], 1 : [ 0, 2 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = { length : 4 };
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, { 0 : [ 0, 2 ], 1 : [ 0, 2 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   //
//
//   var o =
//   {
//     ranges : { 0 : [ 1, 2 ], 1 : [ 1, 2 ] },
//     onEach : null,
//     result : [],
//     delta : null,
//     estimate : 1
//   }
//   var estimate = _.eachInMultiRange( o );
//   var expected = { length : 1 };
//   test.identical( estimate, expected )
//   test.identical( o.result, [] )
//   test.identical( o.ranges, { 0 : [ 1, 2 ], 1 : [ 1, 2 ] } );
//   test.identical( o.delta, null );
//   test.identical( o.estimate, 1 );
//
//   /**/
//
//   if( !Config.debug )
//   return;
//
//   test.shouldThrowErrorOfAnyKind( () => _.eachInMultiRange([]) );
//   test.shouldThrowErrorOfAnyKind( () => _.eachInMultiRange({ ranges : 0 }) );
//   test.shouldThrowErrorOfAnyKind( () => _.eachInMultiRange({ onEach : 0 }) );
//   test.shouldThrowErrorOfAnyKind( () => _.eachInMultiRange({ someProp : 0 }) );
//
//   test.shouldThrowErrorOfAnyKind( () =>
//   {
//     _.eachInMultiRange
//     ({
//       ranges : [ 2 ],
//       delta : 1
//     })
//   });
//
//   test.shouldThrowErrorOfAnyKind( () =>
//   {
//     _.eachInMultiRange
//     ({
//       ranges : [ 2 ],
//       delta : [ 1, 2 ]
//     })
//   });
//
//   test.shouldThrowErrorOfAnyKind( () =>
//   {
//     _.eachInMultiRange
//     ({
//       ranges : [ [ 1, 2 ] ],
//       delta : [ 1, 2 ]
//     })
//   });
//
//   test.shouldThrowErrorOfAnyKind( () =>
//   {
//     _.eachInMultiRange
//     ({
//       ranges : { 0 : 2 },
//       delta : [ 1 ]
//     })
//   });
//
//   test.shouldThrowErrorOfAnyKind( () =>
//   {
//     _.eachInMultiRange
//     ({
//       ranges : { 0 : 2 },
//       delta : { a : 1 }
//     })
//   });
//
//   test.shouldThrowErrorOfAnyKind( () =>
//   {
//     var o =
//     {
//       ranges : [ 6 ],
//       onEach : null,
//       result : [],
//       delta : [ 0 ],
//       estimate : 0
//     }
//     _.eachInMultiRange( o );
//   });
//
//   test.shouldThrowErrorOfAnyKind( () =>
//   {
//     var o =
//     {
//       ranges : [ 6 ],
//       onEach : null,
//       result : [],
//       delta : [ Infinity ],
//       estimate : 0
//     }
//     _.eachInMultiRange( o );
//   });
//
//   test.shouldThrowErrorOfAnyKind( () =>
//   {
//     var o =
//     {
//       ranges : [ 6 ],
//       onEach : null,
//       result : [],
//       delta : [ -1 ],
//       estimate : 0
//     }
//     _.eachInMultiRange( o );
//   });
// }

//

function whileInMultiRange_RangesIsArray( test )
{

  test.case = 'ranges - [ 1 ], routine replace not defined callback';
  var o =
  {
    ranges : [ 1 ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );
  test.true( _.routineIs( o.onEach ) );

  /* */

  test.case = 'ranges - [ [ 0, 1 ] ], ready ranges';
  var o =
  {
    ranges : [ [ 0, 1 ] ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected )
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );

  /* - */

  test.open( '2D, ranges as numbers' );

  test.case = 'ranges - [ 0, 0 ]';
  var o =
  {
    ranges : [ 0, 0 ],
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - [ 0, 3 ], onEach returns false';
  var o =
  {
    ranges : [ 0, 3 ],
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - [ 3, 0 ], onEach returns false';
  var o =
  {
    ranges : [ 3, 0 ],
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - [ -1, 3 ]';
  var o =
  {
    ranges : [ -1, 3 ],
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 )
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, -1 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - [ 1, 3 ], onEach returns false on 2 element';
  var o =
  {
    ranges : [ 1, 3 ],
    onEach : ( iNd, iF ) => iF < 1,
    result : [],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 0, 1 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ 2, 2 ], result - null';
  var o =
  {
    ranges : [ 2, 2 ],
    onEach : null,
    result : null,
  };
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ],
    [ 0, 1 ],
    [ 1, 1 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, 4 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 2 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - [ 3, Infinity ]';
  var o =
  {
    ranges : [ 3, Infinity ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ],
    [ 2, 0 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ Infinity, 3 ]';
  var o =
  {
    ranges : [ Infinity, 3 ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 0, 1 ],
    [ 0, 2 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ Infinity, 1 ]';
  var o =
  {
    ranges : [ Infinity, 1 ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ Infinity, Infinity ]';
  var o =
  {
    ranges : [ Infinity, Infinity ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as numbers' );

  /* - */

  test.open( '2D, ranges as arrays' );

  test.case = 'ranges - [ [ 0, 0 ], [ 0, 0 ] ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 0 ], [ 0, 0 ] ],
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - [ [ 0, 0 ], [ 0, 3 ] ]';
  var o =
  {
    ranges : [ [ 0, 0 ], [ 0, 3 ] ],
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - [ [ -1, 1 ], [ 0, 2 ] ]';
  var o =
  {
    ranges : [ [ -1, 1 ], [ 0, 2 ] ],
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ -1, 1 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - [ [ 0, 1 ], [ 0, 3 ] ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 1 ], [ 0, 3 ] ],
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, 3 ], [ 0, Infinity ] ], result - null, onEach returns false on 2 element';
  var o =
  {
    ranges : [ [ 0, 3 ], [ 0, Infinity ] ],
    onEach : ( iNd, iF ) => iF < 1,
    result : null,
  };
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, 2 );
  test.identical( o.result, null )
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - [ [ 0, Infinity ], [ 0, Infinity ] ]';
  var o =
  {
    ranges : [ [ 0, Infinity ], [ 0, Infinity ] ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ Infinity, Infinity ], [ 0, Infinity ] ]';
  var o =
  {
    ranges : [ [ Infinity, Infinity ], [ 0, Infinity ] ],
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 1, 1 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - [ [ Infinity, 2 ], [ Infinity, 3 ] ]';
  var o =
  {
    ranges : [ [ Infinity, 2 ], [ Infinity, 3 ] ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 1, 1 ],
    [ 1, 2 ]
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 1, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ Infinity, 2 ], Infinity ], mixed types of ranges';
  var o =
  {
    ranges : [ [ Infinity, 2 ], Infinity ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 1, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as arrays' );

  /* - */

  test.open( '3D' );

  test.case = 'ranges - [ 1, 2, 3 ]';
  var o =
  {
    ranges : [ 1, 2, 3 ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 0, 0, 0 ],
    [ 0, 1, 0 ],
    [ 0, 0, 1 ],
    [ 0, 1, 1 ],
    [ 0, 0, 2 ],
    [ 0, 1, 2 ]
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ],
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var expected = [ [ 0, 0, 0 ] ]
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ] ], result - null';
  var o =
  {
    ranges : [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ] ],
    onEach : null,
    result : null,
  }
  var got = _.whileInMultiRange_( o );
  test.identical( got, 6 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );

  test.close( '3D' );

  /* - */

  test.open( '4D' );

  test.case = 'ranges - [ 1, 2, 3, 1 ]';
  var o =
  {
    ranges : [ 1, 2, 3, 1 ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 0, 0, 0, 0 ],
    [ 0, 1, 0, 0 ],
    [ 0, 0, 1, 0 ],
    [ 0, 1, 1, 0 ],
    [ 0, 0, 2, 0 ],
    [ 0, 1, 2, 0 ]
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], 1 ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], 1 ],
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var expected = [ [ 0, 0, 0, 0 ] ]
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ], Infinity ], result - null';
  var o =
  {
    ranges : [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ], Infinity ],
    onEach : null,
    result : null,
  }
  var got = _.whileInMultiRange_( o );
  test.identical( got, 6 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );

  test.close( '4D' );
}

//

function whileInMultiRange_RangesIsArrayWithDelta( test )
{

  test.case = 'ranges - [ 1 ], routine replace not defined callback';
  var o =
  {
    ranges : [ 1 ],
    onEach : null,
    result : [],
    delta : [ 2 ],
  };
  var expected = [ [ 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );
  test.true( _.routineIs( o.onEach ) );

  /* */

  test.case = 'ranges - [ [ 0, 1 ] ], ready ranges';
  var o =
  {
    ranges : [ [ 0, 1 ] ],
    onEach : null,
    result : [],
    delta : [ 2 ],
  };
  var expected = [ [ 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected )
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );

  /* - */

  test.open( '2D, ranges as numbers' );

  test.case = 'ranges - [ 0, 0 ]';
  var o =
  {
    ranges : [ 0, 0 ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - [ 0, 3 ], onEach returns false';
  var o =
  {
    ranges : [ 0, 3 ],
    onEach : ( iNd, iF ) => false,
    result : [],
    delta : [ 1, 2 ],
  }
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - [ 3, 0 ], onEach returns false';
  var o =
  {
    ranges : [ 3, 0 ],
    onEach : ( iNd, iF ) => false,
    result : [],
    delta : [ 1, 2 ],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - [ -1, 3 ]';
  var o =
  {
    ranges : [ -1, 3 ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 )
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, -1 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - [ 1, 3 ], onEach returns false on 2 element';
  var o =
  {
    ranges : [ 1, 3 ],
    onEach : ( iNd, iF ) => iF < 1,
    result : [],
    delta : [ 1, 2 ],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 0, 2 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ 2, 2 ], result - null';
  var o =
  {
    ranges : [ 2, 2 ],
    onEach : null,
    result : null,
    delta : [ 1, 2 ],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ],
    [ 0, 2 ],
    [ 1, 2 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, 2 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 2 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - [ 3, Infinity ]';
  var o =
  {
    ranges : [ 3, Infinity ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ],
    [ 2, 0 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ Infinity, 3 ]';
  var o =
  {
    ranges : [ Infinity, 3 ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 0, 2 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ Infinity, 1 ]';
  var o =
  {
    ranges : [ Infinity, 1 ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ Infinity, Infinity ]';
  var o =
  {
    ranges : [ Infinity, Infinity ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as numbers' );

  /* - */

  test.open( '2D, ranges as arrays' );

  test.case = 'ranges - [ [ 0, 0 ], [ 0, 0 ] ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 0 ], [ 0, 0 ] ],
    onEach : ( iNd, iF ) => false,
    result : [],
    delta : [ 1, 2 ],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - [ [ 0, 0 ], [ 0, 3 ] ]';
  var o =
  {
    ranges : [ [ 0, 0 ], [ 0, 3 ] ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - [ [ -1, 1 ], [ 0, 2 ] ]';
  var o =
  {
    ranges : [ [ -1, 1 ], [ 0, 2 ] ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ -1, 1 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - [ [ 0, 1 ], [ 0, 3 ] ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 1 ], [ 0, 3 ] ],
    onEach : ( iNd, iF ) => false,
    result : [],
    delta : [ 1, 2 ],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, 3 ], [ 0, Infinity ] ], result - null, onEach returns false on 2 element';
  var o =
  {
    ranges : [ [ 0, 3 ], [ 0, Infinity ] ],
    onEach : ( iNd, iF ) => iF < 1,
    result : null,
    delta : [ 1, 2 ],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ],
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, 1 );
  test.identical( o.result, null )
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - [ [ 0, Infinity ], [ 0, Infinity ] ]';
  var o =
  {
    ranges : [ [ 0, Infinity ], [ 0, Infinity ] ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ Infinity, Infinity ], [ 0, Infinity ] ]';
  var o =
  {
    ranges : [ [ Infinity, Infinity ], [ 0, Infinity ] ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 1, 1 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - [ [ Infinity, 2 ], [ Infinity, 3 ] ]';
  var o =
  {
    ranges : [ [ Infinity, 2 ], [ Infinity, 3 ] ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var expected = [ [ 1, 1 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 1, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ Infinity, 2 ], Infinity ], mixed types of ranges';
  var o =
  {
    ranges : [ [ Infinity, 2 ], Infinity ],
    onEach : null,
    result : [],
    delta : [ 1, 2 ],
  };
  var expected = [ [ 1, 0 ] ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as arrays' );

  /* - */

  test.open( '3D' );

  test.case = 'ranges - [ 1, 2, 3 ]';
  var o =
  {
    ranges : [ 1, 2, 3 ],
    onEach : null,
    result : [],
    delta : [ 1, 1, 2 ],
  };
  var expected =
  [
    [ 0, 0, 0 ],
    [ 0, 1, 0 ],
    [ 0, 0, 2 ],
    [ 0, 1, 2 ]
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ],
    onEach : ( iNd, iF ) => false,
    result : [],
    delta : [ 1, 1, 2 ],
  }
  var expected = [ [ 0, 0, 0 ] ]
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ] ], result - null';
  var o =
  {
    ranges : [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ] ],
    onEach : null,
    result : null,
    delta : [ 1, 1, 2 ],
  }
  var got = _.whileInMultiRange_( o );
  test.identical( got, 4 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );

  test.close( '3D' );

  /* - */

  test.open( '4D' );

  test.case = 'ranges - [ 1, 2, 3, 1 ]';
  var o =
  {
    ranges : [ 1, 2, 3, 1 ],
    onEach : null,
    result : [],
    delta : [ 1, 1, 2, 1 ],
  };
  var expected =
  [
    [ 0, 0, 0, 0 ],
    [ 0, 1, 0, 0 ],
    [ 0, 0, 2, 0 ],
    [ 0, 1, 2, 0 ]
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], 1 ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], 1 ],
    onEach : ( iNd, iF ) => false,
    result : [],
    delta : [ 1, 1, 2, 1 ],
  }
  var expected = [ [ 0, 0, 0, 0 ] ]
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ], Infinity ], result - null';
  var o =
  {
    ranges : [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ], Infinity ],
    onEach : null,
    result : null,
    delta : [ 1, 1, 2, 1 ],
  }
  var got = _.whileInMultiRange_( o );
  test.identical( got, 4 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );

  test.close( '4D' );
}

whileInMultiRange_RangesIsArrayWithDelta.timeOut = 10000;

//

function whileInMultiRange_RangesIsMap( test )
{
  test.case = 'ranges - { a : 1 }, routine replace not defined callback';
  var o =
  {
    ranges : { a : 1 },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0 } ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );
  test.true( _.routineIs( o.onEach ) );

  /* */

  test.case = 'ranges - { a : [ 0, 1 ] }, ready ranges';
  var o =
  {
    ranges : { a : [ 0, 1 ] },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0 } ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected )
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );

  /* - */

  test.open( '2D, ranges as numbers' );

  test.case = 'ranges - { a : 0, b : 0 }';
  var o =
  {
    ranges : { a : 0, b : 0 },
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - { a : 0, b : 3 }, onEach returns false';
  var o =
  {
    ranges : { a : 0, b : 3 },
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - { a : 3, b : 0 }, onEach returns false';
  var o =
  {
    ranges : { a : 3, b : 0 },
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - { a : -1, b : 3 }';
  var o =
  {
    ranges : { a : -1, b : 3 },
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 )
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, -1 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - { a : 1, b : 3 }, onEach returns false on 2 element';
  var o =
  {
    ranges : { a : 1, b : 3 },
    onEach : ( iNd, iF ) => iF < 1,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 0, b : 1 },
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : 2, b : 2 }, result - null';
  var o =
  {
    ranges : { a : 2, b : 2 },
    onEach : null,
    result : null,
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 1, b : 0 },
    { a : 0, b : 1 },
    { a : 1, b : 1 },
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, 4 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 2 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - { a : 3, b : Infinity }';
  var o =
  {
    ranges : { a : 3, b : Infinity },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 1, b : 0 },
    { a : 2, b : 0 },
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : Infinity, b : 3 }';
  var o =
  {
    ranges : { a : Infinity, b : 3 },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 0, b : 1 },
    { a : 0, b : 2 },
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : Infinity, b : 1 }';
  var o =
  {
    ranges : { a : Infinity, b : 1 },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0, b : 0 } ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : Infinity, b : Infinity }';
  var o =
  {
    ranges : { a : Infinity, b : Infinity },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0, b : 0 } ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as numbers' );

  /* - */

  test.open( '2D, ranges as arrays' );

  test.case = 'ranges - { a : [ 0, 0 ], b : [ 0, 0 ] }, callback returns false';
  var o =
  {
    ranges : { a : [ 0, 0 ], b : [ 0, 0 ] },
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - { a : [ 0, 0 ], b : [ 0, 3 ] }';
  var o =
  {
    ranges : { a : [ 0, 0 ], b : [ 0, 3 ] },
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - { a : [ -1, 1 ], b : [ 0, 2 ] }';
  var o =
  {
    ranges : { a : [ -1, 1 ], b : [ 0, 2 ] },
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ -1, 1 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - { a : [ 0, 1 ], b : [ 0, 3 ] }, callback returns false';
  var o =
  {
    ranges : { a : [ 0, 1 ], b : [ 0, 3 ] },
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var expected = [ { a : 0, b : 0 } ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, 3 ], [ 0, b : Infinity ] }, result - null, onEach returns false on 2 element';
  var o =
  {
    ranges : { a : [ 0, 3 ], b : [ 0, Infinity ] },
    onEach : ( iNd, iF ) => iF < 1,
    result : null,
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 1, b : 0 },
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, 1 );
  test.identical( o.result, null )
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - { a : [ 0, Infinity ], b : [ 0, Infinity ] }';
  var o =
  {
    ranges : { a : [ 0, Infinity ], b : [ 0, Infinity ] },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0, b : 0 } ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ Infinity, Infinity ], b : [ 0, Infinity ] }';
  var o =
  {
    ranges : { a : [ Infinity, Infinity ], b : [ 0, Infinity ] },
    onEach : null,
    result : [],
  };
  var got = _.whileInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 1, 1 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - { a : [ Infinity, 2 ], b : [ Infinity, 3 ] }';
  var o =
  {
    ranges : { a : [ Infinity, 2 ], b : [ Infinity, 3 ] },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 1, b : 1 },
    { a : 1, b : 2 }
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 1, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ Infinity, 2 ], b : Infinity }, mixed types of ranges';
  var o =
  {
    ranges : { a : [ Infinity, 2 ], b : Infinity },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 1, b : 0 } ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as arrays' );

  /* - */

  test.open( '3D' );

  test.case = 'ranges - { a : 1, b : 2, c : 3 }';
  var o =
  {
    ranges : { a : 1, b : 2, c : 3 },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0, c : 0 },
    { a : 0, b : 1, c : 0 },
    { a : 0, b : 0, c : 1 },
    { a : 0, b : 1, c : 1 },
    { a : 0, b : 0, c : 2 },
    { a : 0, b : 1, c : 2 }
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ] }, callback returns false';
  var o =
  {
    ranges : { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ] },
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var expected = [ { a : 0, b : 0, c : 0 } ]
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, Infinity ], b : [ 0, 2 ], c : [ 0, 3 ] }, result - null';
  var o =
  {
    ranges : { a : [ 0, Infinity ], b : [ 0, 2 ], c : [ 0, 3 ] },
    onEach : null,
    result : null,
  }
  var got = _.whileInMultiRange_( o );
  test.identical( got, 6 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );

  test.close( '3D' );

  /* - */

  test.open( '4D' );

  test.case = 'ranges - { a : 1, b : 2, c : 3, d : 1 }';
  var o =
  {
    ranges : { a : 1, b : 2, c : 3, d : 1 },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0, c : 0, d : 0 },
    { a : 0, b : 1, c : 0, d : 0 },
    { a : 0, b : 0, c : 1, d : 0 },
    { a : 0, b : 1, c : 1, d : 0 },
    { a : 0, b : 0, c : 2, d : 0 },
    { a : 0, b : 1, c : 2, d : 0 }
  ];
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ], d : 1 }, callback returns false';
  var o =
  {
    ranges : { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ], d : 1 },
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var expected = [ { a : 0, b : 0, c : 0, d : 0 } ]
  var got = _.whileInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, Infinity ], b : [ 0, 2 ], c : [ 0, 3 ], d : Infinity }, result - null';
  var o =
  {
    ranges : { a : [ 0, Infinity ], b : [ 0, 2 ], c : [ 0, 3 ], d : Infinity },
    onEach : null,
    result : null,
  }
  var got = _.whileInMultiRange_( o );
  test.identical( got, 6 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );

  test.close( '4D' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorOfAnyKind( () => _.whileInMultiRange_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorOfAnyKind( () => _.whileInMultiRange_( { ranges : [ 1, 2 ] }, { onEach : null } ) );

  test.case = 'wrong type of o.ranges';
  test.shouldThrowErrorOfAnyKind( () => _.whileInMultiRange_({ ranges : 0 }) );

  test.case = 'wrong type of o.onEach';
  test.shouldThrowErrorOfAnyKind( () => _.whileInMultiRange_({ onEach : 0 }) );

  test.case = 'options map o has unknown option';
  test.shouldThrowErrorOfAnyKind( () => _.whileInMultiRange_({ someProp : 0 }) );
}

//

function eachInMultiRange_RangesIsArray( test )
{
  test.case = 'ranges - [ 1 ], routine replace not defined callback';
  var o =
  {
    ranges : [ 1 ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0 ] ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );
  test.true( _.routineIs( o.onEach ) );

  /* */

  test.case = 'ranges - [ [ 0, 1 ] ], ready ranges';
  var o =
  {
    ranges : [ [ 0, 1 ] ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0 ] ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected )
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );

  /* - */

  test.open( '2D, ranges as numbers' );

  test.case = 'ranges - [ 0, 0 ]';
  var o =
  {
    ranges : [ 0, 0 ],
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - [ 0, 3 ], onEach returns false';
  var o =
  {
    ranges : [ 0, 3 ],
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - [ 3, 0 ], onEach returns false';
  var o =
  {
    ranges : [ 3, 0 ],
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - [ -1, 3 ]';
  var o =
  {
    ranges : [ -1, 3 ],
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 )
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, -1 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - [ 1, 3 ]';
  var o =
  {
    ranges : [ 1, 3 ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 0, 1 ],
    [ 0, 2 ],
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ 2, 2 ], result - null';
  var o =
  {
    ranges : [ 2, 2 ],
    onEach : null,
    result : null,
  };
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ],
    [ 0, 1 ],
    [ 1, 1 ],
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, 4 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 2 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - [ 3, Infinity ]';
  var o =
  {
    ranges : [ 3, Infinity ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ],
    [ 2, 0 ],
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ Infinity, 3 ]';
  var o =
  {
    ranges : [ Infinity, 3 ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 0, 1 ],
    [ 0, 2 ],
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ Infinity, 1 ]';
  var o =
  {
    ranges : [ Infinity, 1 ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ Infinity, Infinity ]';
  var o =
  {
    ranges : [ Infinity, Infinity ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as numbers' );

  /* - */

  test.open( '2D, ranges as arrays' );

  test.case = 'ranges - [ [ 0, 0 ], [ 0, 0 ] ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 0 ], [ 0, 0 ] ],
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - [ [ 0, 0 ], [ 0, 3 ] ]';
  var o =
  {
    ranges : [ [ 0, 0 ], [ 0, 3 ] ],
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - [ [ -1, 1 ], [ 0, 2 ] ]';
  var o =
  {
    ranges : [ [ -1, 1 ], [ 0, 2 ] ],
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ -1, 1 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - [ [ 0, 1 ], [ 0, 3 ] ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 1 ], [ 0, 3 ] ],
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var expected =
  [
    [ 0, 0 ],
    [ 0, 1 ],
    [ 0, 2 ],
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, 3 ], [ 0, Infinity ] ], result - null';
  var o =
  {
    ranges : [ [ 0, 3 ], [ 0, Infinity ] ],
    onEach : null,
    result : null,
  };
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ],
    [ 2, 0 ],
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, 3 );
  test.identical( o.result, null )
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - [ [ 0, Infinity ], [ 0, Infinity ] ]';
  var o =
  {
    ranges : [ [ 0, Infinity ], [ 0, Infinity ] ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 0, 0 ] ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ Infinity, Infinity ], [ 0, Infinity ] ]';
  var o =
  {
    ranges : [ [ Infinity, Infinity ], [ 0, Infinity ] ],
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 1, 1 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - [ [ Infinity, 2 ], [ Infinity, 3 ] ]';
  var o =
  {
    ranges : [ [ Infinity, 2 ], [ Infinity, 3 ] ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 1, 1 ],
    [ 1, 2 ]
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 1, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ Infinity, 2 ], Infinity ], mixed types of ranges';
  var o =
  {
    ranges : [ [ Infinity, 2 ], Infinity ],
    onEach : null,
    result : [],
  };
  var expected = [ [ 1, 0 ] ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as arrays' );

  /* - */

  test.open( '3D' );

  test.case = 'ranges - [ 1, 2, 3 ]';
  var o =
  {
    ranges : [ 1, 2, 3 ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 0, 0, 0 ],
    [ 0, 1, 0 ],
    [ 0, 0, 1 ],
    [ 0, 1, 1 ],
    [ 0, 0, 2 ],
    [ 0, 1, 2 ]
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ],
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var expected =
  [
    [ 0, 0, 0 ],
    [ 0, 1, 0 ],
    [ 0, 0, 1 ],
    [ 0, 1, 1 ],
    [ 0, 0, 2 ],
    [ 0, 1, 2 ]
  ]
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ] ], result - null';
  var o =
  {
    ranges : [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ] ],
    onEach : null,
    result : null,
  }
  var got = _.eachInMultiRange_( o );
  test.identical( got, 6 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );

  test.close( '3D' );

  /* - */

  test.open( '4D' );

  test.case = 'ranges - [ 1, 2, 3, 1 ]';
  var o =
  {
    ranges : [ 1, 2, 3, 1 ],
    onEach : null,
    result : [],
  };
  var expected =
  [
    [ 0, 0, 0, 0 ],
    [ 0, 1, 0, 0 ],
    [ 0, 0, 1, 0 ],
    [ 0, 1, 1, 0 ],
    [ 0, 0, 2, 0 ],
    [ 0, 1, 2, 0 ]
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], 1 ], callback returns false';
  var o =
  {
    ranges : [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], 1 ],
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var expected =
  [
    [ 0, 0, 0, 0 ],
    [ 0, 1, 0, 0 ],
    [ 0, 0, 1, 0 ],
    [ 0, 1, 1, 0 ],
    [ 0, 0, 2, 0 ],
    [ 0, 1, 2, 0 ]
  ]
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ], Infinity ], result - null';
  var o =
  {
    ranges : [ [ 0, Infinity ], [ 0, 2 ], [ 0, 3 ], Infinity ],
    onEach : null,
    result : null,
  }
  var got = _.eachInMultiRange_( o );
  test.identical( got, 6 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );

  test.close( '4D' );
}

//

function eachInMultiRange_RangesIsMap( test )
{
  test.case = 'ranges - { a : 1 }, routine replace not defined callback';
  var o =
  {
    ranges : { a : 1 },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0 } ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );
  test.true( _.routineIs( o.onEach ) );

  /* */

  test.case = 'ranges - { a : [ 0, 1 ] }, ready ranges';
  var o =
  {
    ranges : { a : [ 0, 1 ] },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0 } ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected )
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0, 1 ] ] );
  test.true( got === o.result );

  /* - */

  test.open( '2D, ranges as numbers' );

  test.case = 'ranges - { a : 0, b : 0 }';
  var o =
  {
    ranges : { a : 0, b : 0 },
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - { a : 0, b : 3 }, onEach returns false';
  var o =
  {
    ranges : { a : 0, b : 3 },
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - { a : 3, b : 0 }, onEach returns false';
  var o =
  {
    ranges : { a : 3, b : 0 },
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - { a : -1, b : 3 }';
  var o =
  {
    ranges : { a : -1, b : 3 },
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 )
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, -1 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - { a : 1, b : 3 }';
  var o =
  {
    ranges : { a : 1, b : 3 },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 0, b : 1 },
    { a : 0, b : 2 },
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : 2, b : 2 }, result - null';
  var o =
  {
    ranges : { a : 2, b : 2 },
    onEach : null,
    result : null,
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 1, b : 0 },
    { a : 0, b : 1 },
    { a : 1, b : 1 },
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, 4 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 2 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - { a : 3, b : Infinity }';
  var o =
  {
    ranges : { a : 3, b : Infinity },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 1, b : 0 },
    { a : 2, b : 0 },
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : Infinity, b : 3 }';
  var o =
  {
    ranges : { a : Infinity, b : 3 },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 0, b : 1 },
    { a : 0, b : 2 },
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : Infinity, b : 1 }';
  var o =
  {
    ranges : { a : Infinity, b : 1 },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0, b : 0 } ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : Infinity, b : Infinity }';
  var o =
  {
    ranges : { a : Infinity, b : Infinity },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0, b : 0 } ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as numbers' );

  /* - */

  test.open( '2D, ranges as arrays' );

  test.case = 'ranges - { a : [ 0, 0 ], b : [ 0, 0 ] }, callback returns false';
  var o =
  {
    ranges : { a : [ 0, 0 ], b : [ 0, 0 ] },
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 0 ] ] );

  /* */

  test.case = 'ranges - { a : [ 0, 0 ], b : [ 0, 3 ] }';
  var o =
  {
    ranges : { a : [ 0, 0 ], b : [ 0, 3 ] },
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 0, 0 ], [ 0, 3 ] ] );

  /* */

  test.case = 'ranges - { a : [ -1, 1 ], b : [ 0, 2 ] }';
  var o =
  {
    ranges : { a : [ -1, 1 ], b : [ 0, 2 ] },
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ -1, 1 ], [ 0, 2 ] ] );

  /* */

  test.case = 'ranges - { a : [ 0, 1 ], b : [ 0, 3 ] }, callback returns false';
  var o =
  {
    ranges : { a : [ 0, 1 ], b : [ 0, 3 ] },
    onEach : ( iNd, iF ) => false,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 0, b : 1 },
    { a : 0, b : 2 },
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, 3 ], [ 0, b : Infinity ] }, result - null';
  var o =
  {
    ranges : { a : [ 0, 3 ], b : [ 0, Infinity ] },
    onEach : null,
    result : null,
  };
  var expected =
  [
    { a : 0, b : 0 },
    { a : 1, b : 0 },
    { a : 2, b : 0 },
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, 3 );
  test.identical( o.result, null )
  test.identical( o.ranges, [ [ 0, 3 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - { a : [ 0, Infinity ], b : [ 0, Infinity ] }';
  var o =
  {
    ranges : { a : [ 0, Infinity ], b : [ 0, Infinity ] },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 0, b : 0 } ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ Infinity, Infinity ], b : [ 0, Infinity ] }';
  var o =
  {
    ranges : { a : [ Infinity, Infinity ], b : [ 0, Infinity ] },
    onEach : null,
    result : [],
  };
  var got = _.eachInMultiRange_( o );
  test.identical( got, 0 );
  test.identical( o.result, [] );
  test.identical( o.ranges, [ [ 1, 1 ], [ 0, 1 ] ] );

  /* */

  test.case = 'ranges - { a : [ Infinity, 2 ], b : [ Infinity, 3 ] }';
  var o =
  {
    ranges : { a : [ Infinity, 2 ], b : [ Infinity, 3 ] },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 1, b : 1 },
    { a : 1, b : 2 }
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 1, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ Infinity, 2 ], b : Infinity }, mixed types of ranges';
  var o =
  {
    ranges : { a : [ Infinity, 2 ], b : Infinity },
    onEach : null,
    result : [],
  };
  var expected = [ { a : 1, b : 0 } ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 1, 2 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  test.close( '2D, ranges as arrays' );

  /* - */

  test.open( '3D' );

  test.case = 'ranges - { a : 1, b : 2, c : 3 }';
  var o =
  {
    ranges : { a : 1, b : 2, c : 3 },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0, c : 0 },
    { a : 0, b : 1, c : 0 },
    { a : 0, b : 0, c : 1 },
    { a : 0, b : 1, c : 1 },
    { a : 0, b : 0, c : 2 },
    { a : 0, b : 1, c : 2 }
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ] }, callback returns false';
  var o =
  {
    ranges : { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ] },
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var expected =
  [
    { a : 0, b : 0, c : 0 },
    { a : 0, b : 1, c : 0 },
    { a : 0, b : 0, c : 1 },
    { a : 0, b : 1, c : 1 },
    { a : 0, b : 0, c : 2 },
    { a : 0, b : 1, c : 2 }
  ]
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, Infinity ], b : [ 0, 2 ], c : [ 0, 3 ] }, result - null';
  var o =
  {
    ranges : { a : [ 0, Infinity ], b : [ 0, 2 ], c : [ 0, 3 ] },
    onEach : null,
    result : null,
  }
  var got = _.eachInMultiRange_( o );
  test.identical( got, 6 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ] ] );

  test.close( '3D' );

  /* - */

  test.open( '4D' );

  test.case = 'ranges - { a : 1, b : 2, c : 3, d : 1 }';
  var o =
  {
    ranges : { a : 1, b : 2, c : 3, d : 1 },
    onEach : null,
    result : [],
  };
  var expected =
  [
    { a : 0, b : 0, c : 0, d : 0 },
    { a : 0, b : 1, c : 0, d : 0 },
    { a : 0, b : 0, c : 1, d : 0 },
    { a : 0, b : 1, c : 1, d : 0 },
    { a : 0, b : 0, c : 2, d : 0 },
    { a : 0, b : 1, c : 2, d : 0 }
  ];
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ], d : 1 }, callback returns false';
  var o =
  {
    ranges : { a : [ 0, 1 ], b : [ 0, 2 ], c : [ 0, 3 ], d : 1 },
    onEach : ( iNd, iF ) => false,
    result : [],
  }
  var expected =
  [
    { a : 0, b : 0, c : 0, d : 0 },
    { a : 0, b : 1, c : 0, d : 0 },
    { a : 0, b : 0, c : 1, d : 0 },
    { a : 0, b : 1, c : 1, d : 0 },
    { a : 0, b : 0, c : 2, d : 0 },
    { a : 0, b : 1, c : 2, d : 0 }
  ]
  var got = _.eachInMultiRange_( o );
  test.identical( got, expected );
  test.identical( o.result, expected );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );
  test.true( got === o.result );

  /* */

  test.case = 'ranges - { a : [ 0, Infinity ], b : [ 0, 2 ], c : [ 0, 3 ], d : Infinity }, result - null';
  var o =
  {
    ranges : { a : [ 0, Infinity ], b : [ 0, 2 ], c : [ 0, 3 ], d : Infinity },
    onEach : null,
    result : null,
  }
  var got = _.eachInMultiRange_( o );
  test.identical( got, 6 );
  test.identical( o.result, null );
  test.identical( o.ranges, [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 0, 1 ] ] );

  test.close( '4D' );

  /* - */

  if( !Config.debug )
  return;

  test.case = 'without arguments';
  test.shouldThrowErrorOfAnyKind( () => _.eachInMultiRange_() );

  test.case = 'extra arguments';
  test.shouldThrowErrorOfAnyKind( () => _.eachInMultiRange_( { ranges : [ 1, 2 ] }, { onEach : null } ) );

  test.case = 'wrong type of o.ranges';
  test.shouldThrowErrorOfAnyKind( () => _.eachInMultiRange_({ ranges : 0 }) );

  test.case = 'wrong type of o.onEach';
  test.shouldThrowErrorOfAnyKind( () => _.eachInMultiRange_({ onEach : 0 }) );

  test.case = 'options map o has unknown option';
  test.shouldThrowErrorOfAnyKind( () => _.eachInMultiRange_({ someProp : 0 }) );
}

//

function entityValueWithIndex( test )
{
  test.case = 'array';
  var got = _.entityValueWithIndex( [ [ 1, 2, 3 ] ], 0 );
  var expected = [ 1, 2, 3 ] ;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.entityValueWithIndex( { a : 1, b : [ 1, 2, 3 ] }, 1 );
  var expected = [ 1, 2, 3 ] ;
  test.identical( got, expected );

  test.case = 'string';
  var got = _.entityValueWithIndex( 'simple string', 5 );
  var expected = 'e' ;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityValueWithIndex();
  });

  test.case = 'no selector';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityValueWithIndex( [ 1 ] );
  });

  test.case = 'bad selector';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityValueWithIndex( [ 0 ], '1' );
  });

  test.case = 'bad arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityValueWithIndex( true, 0 );
  });

  test.case = 'bad arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityValueWithIndex( 1, 2 );
  });

  test.case = 'bad arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityValueWithIndex( 1, undefined );
  });

  test.case = 'redundant arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityValueWithIndex( [ 0 ], 0, 0 );
  });

}

//

function entityKeyWithValue( test )
{
  test.case = 'array';
  var got = _.entityKeyWithValue( [ 1, 2, 3 ], 3 );
  var expected =  2;
  test.identical( got, expected );

  test.case = 'array#2';
  var got = _.entityKeyWithValue( [ 1, 2, 3 ], 'a' );
  var expected =  null;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.entityKeyWithValue( { a : 1, b : 'a' }, 'a' );
  var expected =  'b';
  test.identical( got, expected );

  test.case = 'value undefined';
  var got = _.entityKeyWithValue( [ 1, 2, 3 ], undefined );
  var expected =  null;
  test.identical( got, expected );

  test.case = 'value string';
  var got = _.entityKeyWithValue( [ 0 ], '1' );
  var expected =  null;
  test.identical( got, expected );

  test.case = 'value string';
  var got = _.entityKeyWithValue( [ 0 ], '1' );
  var expected =  null;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityKeyWithValue();
  });

  test.case = 'no selector';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityKeyWithValue( [ 1 ] );
  });

  test.case = 'bad arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityKeyWithValue( true, 0 );
  });

  test.case = 'bad arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityKeyWithValue( 1, 2 );
  });

  test.case = 'bad arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityKeyWithValue( 1, undefined );
  });

  test.case = 'redundant arguments';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityKeyWithValue( [ 0 ], 0, 0 );
  });

}

//

function entityCoerceTo( test )
{

  test.case = 'string & num';
  var src = '5';
  var ins =  1
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  test.case = 'num to string';
  var src = 1;
  var ins =  '5';
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  test.case = 'to boolean';
  var src = 1;
  var ins =  true;
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  test.case = 'object and num';
  var src = { a : 1 };
  var ins =  1;
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  // test.case = 'array and string';
  // var src = [ 1, 2, 3 ];
  // var ins =  'str';
  // var got = typeof( _.entityCoerceTo( src, ins ) );
  // var expected = typeof( ins );
  // test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'argument missed';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityCoerceTo( );
  });

  test.case = 'unknown type';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityCoerceTo( 1, { a : 1 } );
  });

}

//

function entityHasNan( test )
{

  test.case = 'undefined';
  var got = _.entityHasNan( undefined );
  var expected = true;
  test.identical( got, expected );

  test.case = 'number';
  var got = _.entityHasNan( 150 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'null';
  var got = _.entityHasNan( null );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array';
  var got = _.entityHasNan( [ 1, 'A2', 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.entityHasNan( { a : 1, b : 2 } );
  var expected = false;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'argument missed';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityHasNan( );
  });

}

//

function entityHasUndef( test )
{

  test.case = 'undefined';
  var got = _.entityHasUndef( undefined );
  var expected = true;
  test.identical( got, expected );

  test.case = 'number';
  var got = _.entityHasUndef( 150 );
  var expected = false;
  test.identical( got, expected );

  test.case = 'array';
  var got = _.entityHasUndef( [ 1, '2', 3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.entityHasUndef( { a : 1, b : 2 } );
  var expected = false;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'argument missed';
  test.shouldThrowErrorOfAnyKind( function()
  {
    _.entityHasUndef( );
  });

}

//

let Proto =
{

  name : 'Tools.l3.Entity',
  silencing : 1,
  // verbosity : 4,
  // negativity : 3,

  tests :
  {

    // eachInMultiRange,
    whileInMultiRange_RangesIsArray,
    whileInMultiRange_RangesIsArrayWithDelta,
    whileInMultiRange_RangesIsMap,
    eachInMultiRange_RangesIsArray,
    eachInMultiRange_RangesIsMap,

    entityValueWithIndex,
    entityKeyWithValue,

    entityCoerceTo,

    entityHasNan,
    entityHasUndef,

  }

};

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
