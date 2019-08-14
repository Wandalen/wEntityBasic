( function _EntityBasic_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( '../../Tools.s' );

  _.include( 'wTesting' );

  require( '../l3/Entity.s' );

}

var _global = _global_;
var _ = _global_.wTools;
var Self = {};

// --
// tests
// --

//

function eachInMultiRange( test )
{

  var o =
  {
    ranges : [ 1 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 1 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 0,0 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  _.eachInMultiRange( o );
  test.identical( o.result, [] )
  test.identical( o.ranges, [ 0,0 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 0,3 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  _.eachInMultiRange( o );
  test.identical( o.result, [] )
  test.identical( o.ranges, [ 0,3 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 3,0 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  _.eachInMultiRange( o );
  test.identical( o.result, [] )
  test.identical( o.ranges, [ 3,0 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 1,1 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 1,1 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 1,3 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
    [ 0,1 ],
    [ 0,2 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 1,3 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 2,2 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
    [ 1,0 ],
    [ 0,1 ],
    [ 1,1 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 2,2 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 3,Infinity ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
    [ 1,0 ],
    [ 2,0 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 3,Infinity ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ Infinity,3 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
    [ 0,1 ],
    [ 0,2 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ Infinity,3 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ Infinity,Infinity ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ Infinity,Infinity ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 1,2,3 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
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
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 1,2,3 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  /* array of arrays */

  var o =
  {
    ranges : [ [ 0,1 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0,1 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,0 ], [ 0,0 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  _.eachInMultiRange( o );
  test.identical( o.result, [] )
  test.identical( o.ranges, [ [ 0,0 ], [ 0,0 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,0 ], [ 0,3 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  _.eachInMultiRange( o );
  test.identical( o.result, [] )
  test.identical( o.ranges, [ [ 0,0 ], [ 0,3 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,3 ], [ 0,0 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  _.eachInMultiRange( o );
  test.identical( o.result, [] )
  test.identical( o.ranges, [ [ 0,3 ], [ 0,0 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,1 ], [ 0,1 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0,1 ], [ 0,1 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,1 ], [ 0,3 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
    [ 0,1 ],
    [ 0,2 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0,1 ], [ 0,3 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,2 ], [ 0,2 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
    [ 1,0 ],
    [ 0,1 ],
    [ 1,1 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0,2 ], [ 0,2 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,3 ], [ 0,Infinity ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
    [ 1,0 ],
    [ 2,0 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0,3 ], [ 0,Infinity ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,Infinity ], [ 0,3 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
    [ 0,1 ],
    [ 0,2 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0,Infinity ], [ 0,3 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,Infinity ], [ 0,Infinity ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0,Infinity ], [ 0,Infinity ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  var o =
  {
    ranges : [ [ Infinity,Infinity ], [ Infinity,Infinity ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ Infinity,Infinity ], [ Infinity,Infinity ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ Infinity, 1 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ Infinity,1 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 1, Infinity ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0,0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 1,Infinity ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ Infinity, 2 ], Infinity ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 1,0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ Infinity, 2 ], Infinity ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ Infinity, 2 ], [ Infinity, 2 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 1,1 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ Infinity, 2 ], [ Infinity, 2 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ Infinity, 2 ], [ Infinity, 2 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 1,1 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ Infinity, 2 ], [ Infinity, 2 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,1 ],[ 0,2 ],[ 0,3 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
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
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0,1 ],[ 0,2 ],[ 0,3 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0,Infinity ],[ 0,2 ],[ 0,3 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
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
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0,Infinity ],[ 0,2 ],[ 0,3 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  /* object */

  var o =
  {
    ranges : { a : 1, b : 2, c : 3 },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
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
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, { a : 1, b : 2, c : 3 } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : { a : [ 0,1 ], b : [ 0,2 ], c : [ 0,3 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
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
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, { a : [ 0,1 ], b : [ 0,2 ], c : [ 0,3 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  /*  */

  var o =
  {
    ranges : [ 2,1 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 0, 0 ],
    [ 1, 0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 2,1 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  var o =
  {
    ranges : [ -1,1 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 )
  test.identical( o.result, expected )
  test.identical( o.ranges, [ -1,1 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 2,1 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 2,1 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  var o =
  {
    ranges : [ [ -1,1 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ -1 ],
    [ 0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ -1,1 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 1,1 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 1,1 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 1,2 ], [ 2,1 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 1,2 ], [ 2,1 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 1,2 ], [ -1,1 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    [ 1,-1 ],
    [ 1,0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 1,2 ], [ -1,1 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 1,2 ], [ 1,1 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 1,2 ], [ 1,1 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : { 0 : [ 2,1 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : [ 2,1 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  var o =
  {
    ranges : { 0 : [ 1,1 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : [ 1,1 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  var o =
  {
    ranges : { 0 : [ 1,-1 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : [ 1,-1 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : { 0 : -1 },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : -1 } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : { 0 : [ -1,1 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    { 0 : -1 },
    { 0 : 0 }
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : [ -1,1 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : { 0 : [ 1,2 ], 1 : [ 2,1 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : [ 1,2 ], 1 : [ 2,1 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : { 0 : [ 1,2 ], 1 : [ -1,1 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
    { 0 : 1, 1 : -1 },
    { 0 : 1, 1 : 0 }
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : [ 1,2 ], 1 : [ -1,1 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : { 0 : [ 1,2 ], 1 : [ 1,1 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 0
  }
  var expected =
  [
  ]
  var got = _.eachInMultiRange( o );
  test.identical( got, 0 );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : [ 1,2 ], 1 : [ 1,1 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 0 );

  /* delta */

  var o =
  {
    ranges : [ 6 ],
    onEach : null,
    result : [],
    delta : [ 2 ],
    estimate : 0
  }
  var expected =
  [
    [ 0 ],
    [ 2 ],
    [ 4 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 6 ] );
  test.identical( o.delta, [ 2 ] );
  test.identical( o.estimate, 0 );

  var o =
  {
    ranges : [ 6,2 ],
    onEach : null,
    result : [],
    delta : [ 2,1 ],
    estimate : 0
  }
  var expected =
  [
    [ 0, 0 ],
    [ 2, 0 ],
    [ 4, 0 ],
    [ 0, 1 ],
    [ 2, 1 ],
    [ 4, 1 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 6,2 ] );
  test.identical( o.delta, [ 2,1 ] );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0, 6 ] ],
    onEach : null,
    result : [],
    delta : [ 2 ],
    estimate : 0
  }
  var expected =
  [
    [ 0 ],
    [ 2 ],
    [ 4 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 0, 6 ] ] );
  test.identical( o.delta, [ 2 ] );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 0, 6 ], [ 0, 2 ] ],
    onEach : null,
    result : [],
    delta : [ 2,1 ],
    estimate : 0
  }
  var expected =
  [
    [ 0, 0 ],
    [ 2, 0 ],
    [ 4, 0 ],
    [ 0, 1 ],
    [ 2, 1 ],
    [ 4, 1 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges,  [ [ 0, 6 ], [ 0, 2 ] ] );
  test.identical( o.delta, [ 2,1 ] );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : { 0 : [ 0, 6 ] },
    onEach : null,
    result : [],
    delta : { 0 : 2 },
    estimate : 0
  }
  var expected =
  [
    { 0 : 0 },
    { 0 : 2 },
    { 0 : 4 }
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : [ 0, 6 ] } );
  test.identical( o.delta, { 0 : 2 } );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : { 0 : [ 0, 6 ], 1 : [ 0, 2 ] },
    onEach : null,
    result : [],
    delta : { 0 : 2, 1 : 1 },
    estimate : 0
  }
  var expected =
  [
    { 0 : 0, 1 : 0 },
    { 0 : 2, 1 : 0 },
    { 0 : 4, 1 : 0 },
    { 0 : 0, 1 : 1 },
    { 0 : 2, 1 : 1 },
    { 0 : 4, 1 : 1 }
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, { 0 : [ 0, 6 ], 1 : [ 0, 2 ] } );
  test.identical( o.delta, { 0 : 2, 1 : 1 } );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 6 ],
    onEach : null,
    result : [],
    delta : [ 3 ],
    estimate : 0
  }
  var expected =
  [
    [ 0 ],
    [ 3 ],
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 6 ] );
  test.identical( o.delta, [ 3 ] );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 6 ],
    onEach : null,
    result : [],
    delta : [ 10 ],
    estimate : 0
  }
  var expected =
  [
    [ 0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 6 ] );
  test.identical( o.delta, [ 10 ] );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ 5, 10, 15 ],
    onEach : null,
    result : [],
    delta : [ 6, 11, 16 ],
    estimate : 0
  }
  var expected =
  [
    [ 0, 0, 0 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ 5, 10, 15 ] );
  test.identical( o.delta, [ 6, 11, 16 ] );
  test.identical( o.estimate, 0 );

  //

  var o =
  {
    ranges : [ [ 1, 3 ], [ 2, 6 ], [ 4, 8 ] ],
    onEach : null,
    result : [],
    delta : [ 1, 3, 4 ],
    estimate : 0
  }
  var expected =
  [
    [ 1, 2, 4 ],
    [ 2, 2, 4 ],
    [ 1, 5, 4 ],
    [ 2, 5, 4 ]
  ]
  _.eachInMultiRange( o );
  test.identical( o.result, expected )
  test.identical( o.ranges, [ [ 1, 3 ], [ 2, 6 ], [ 4, 8 ] ] );
  test.identical( o.delta, [ 1, 3, 4 ] );
  test.identical( o.estimate, 0 );

  /* estimate */

  var o =
  {
    ranges : [ 6 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = { length : 6 };
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, [ 6 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  //

  var o =
  {
    ranges : [],
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = 0;
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, [] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  //

  var o =
  {
    ranges : [ 2,6 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = { length : 12 };
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, [ 2,6 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  //

  var o =
  {
    ranges : [ -1,6 ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = { length : -6 };
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, [ -1,6 ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  //

  var o =
  {
    ranges : [ [ 0,6 ], [ 0,5 ] ],
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = { length : 30 };
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, [ [ 0,6 ], [ 0,5 ] ] );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  //

  var o =
  {
    ranges : { 0 : 0 },
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = { length : 0 };
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, { 0 : 0 } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  //

  var o =
  {
    ranges : { 0 : 6 },
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = { length : 6 };
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, { 0 : 6 } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  //

  var o =
  {
    ranges : { 0 : 2, 1 : 2 },
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = { length : 4 };
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, { 0 : 2, 1 : 2 } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  //

  var o =
  {
    ranges : { 0 : [ 0,2 ], 1 : [ 0,2 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = { length : 4 };
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, { 0 : [ 0,2 ], 1 : [ 0,2 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  //

  var o =
  {
    ranges : { 0 : [ 1,2 ], 1 : [ 1,2 ] },
    onEach : null,
    result : [],
    delta : null,
    estimate : 1
  }
  var estimate = _.eachInMultiRange( o );
  var expected = { length : 1 };
  test.identical( estimate,expected )
  test.identical( o.result, [] )
  test.identical( o.ranges, { 0 : [ 1,2 ], 1 : [ 1,2 ] } );
  test.identical( o.delta, null );
  test.identical( o.estimate, 1 );

  /**/

  if( !Config.debug )
  return;

  test.shouldThrowError( () => _.eachInMultiRange([]) );
  test.shouldThrowError( () => _.eachInMultiRange({ ranges : 0 }) );
  test.shouldThrowError( () => _.eachInMultiRange({ onEach : 0 }) );
  test.shouldThrowError( () => _.eachInMultiRange({ someProp : 0 }) );

  test.shouldThrowError( () =>
  {
    _.eachInMultiRange
    ({
      ranges : [ 2 ],
      delta : 1
    })
  });

  test.shouldThrowError( () =>
  {
    _.eachInMultiRange
    ({
      ranges : [ 2 ],
      delta : [ 1,2 ]
    })
  });

  test.shouldThrowError( () =>
  {
    _.eachInMultiRange
    ({
      ranges : [ [ 1,2 ] ],
      delta : [ 1,2 ]
    })
  });

  test.shouldThrowError( () =>
  {
    _.eachInMultiRange
    ({
      ranges : { 0 : 2 },
      delta : [ 1 ]
    })
  });

  test.shouldThrowError( () =>
  {
    _.eachInMultiRange
    ({
      ranges : { 0 : 2 },
      delta : { a : 1 }
    })
  });

  test.shouldThrowError( () =>
  {
    var o =
    {
      ranges : [ 6 ],
      onEach : null,
      result : [],
      delta : [ 0 ],
      estimate : 0
    }
    _.eachInMultiRange( o );
  });

  test.shouldThrowError( () =>
  {
    var o =
    {
      ranges : [ 6 ],
      onEach : null,
      result : [],
      delta : [ Infinity ],
      estimate : 0
    }
    _.eachInMultiRange( o );
  });

  test.shouldThrowError( () =>
  {
    var o =
    {
      ranges : [ 6 ],
      onEach : null,
      result : [],
      delta : [ -1 ],
      estimate : 0
    }
    _.eachInMultiRange( o );
  });
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
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex();
  });

  test.case = 'no selector';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( [ 1 ] );
  });

  test.case = 'bad selector';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( [ 0 ],'1' );
  });

  test.case = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( true,0 );
  });

  test.case = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( 1,2 );
  });

  test.case = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( 1,undefined );
  });

  test.case = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entityValueWithIndex( [ 0 ],0,0 );
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
  var got = _.entityKeyWithValue( [ 0 ],'1' );
  var expected =  null;
  test.identical( got, expected );

  test.case = 'value string';
  var got = _.entityKeyWithValue( [ 0 ],'1' );
  var expected =  null;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'no arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue();
  });

  test.case = 'no selector';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( [ 1 ] );
  });

  test.case = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( true,0 );
  });

  test.case = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( 1,2 );
  });

  test.case = 'bad arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( 1,undefined );
  });

  test.case = 'redundant arguments';
  test.shouldThrowError( function()
  {
    _.entityKeyWithValue( [ 0 ],0,0 );
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

  test.case = 'array and string';
  var src = [ 1, 2, 3 ];
  var ins =  'str';
  var got = typeof( _.entityCoerceTo( src, ins ) );
  var expected = typeof( ins );
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'argument missed';
  test.shouldThrowError( function()
  {
    _.entityCoerceTo( );
  });

  test.case = 'unknown type';
  test.shouldThrowError( function()
  {
    _.entityCoerceTo( 1, { a : 1 }  );
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
  var got = _.entityHasNan( [ 1,'A2',3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.entityHasNan( { a : 1, b : 2 } );
  var expected = false;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'argument missed';
  test.shouldThrowError( function()
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
  var got = _.entityHasUndef( [ 1,'2',3 ] );
  var expected = false;
  test.identical( got, expected );

  test.case = 'object';
  var got = _.entityHasUndef( { a : 1, b : 2 } );
  var expected = false;
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'argument missed';
  test.shouldThrowError( function()
  {
    _.entityHasUndef( );
  });

}

//

var Self =
{

  name : 'Tools/base/l3/Entity',
  silencing : 1,
  // verbosity : 4,
  // importanceOfNegative : 3,

  tests :
  {

    eachInMultiRange,

    entityValueWithIndex,
    entityKeyWithValue,

    entityCoerceTo,

    entityHasNan,
    entityHasUndef,

  }

};

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();
