// Generated by track editor Unity project
const vec3 Xc0 = vec3(99,118.44,115.8),Xc1 = vec3(11.2,69.66,207.11),Xc2 = vec3(87.87,71.45,200.5),Xc3 = vec3(47.43,13.97,165.39);
const vec4 Xf0 = vec4(0,-0.707,0,0.707),Xf1 = vec4(0,0,0,1),Xf2 = vec4(-0.492,-0.012,0.022,0.87),Xf3 = vec4(0,-0.707,0,0.707),Xp0 = vec4(39.1,29.5,573.5,500),Xp1 = vec4(600,29.5,80.7,100);
vec2 Xm( vec3 p )
{
vec2 d = vec2( 10000, 0 );
if( mod( g_traceBits.x / i_BIT6, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.,0.,0.,1.,19.5,12.4,247. ,7.5,-40.,-1.,0.,6. ) );
if( mod( g_traceBits.x / i_BIT7, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.,0.707,0.,0.707,137.8,12.4,287. ,7.5,20.,0.,2.,0. ) );
if( mod( g_traceBits.x / i_BIT8, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.259,0.,0.,0.966,0.,16.75,167.16 ,7.5,15.,19.,2.,0. ) );
if( mod( g_traceBits.x / i_BIT9, 2. ) >= 1. )
d = min2( d, sdObj3( p, 0.,0.,0.,1.,0.,9.,-12.3 ,15.,25.,7.5,1. ) );
if( mod( g_traceBits.y / i_BIT0, 2. ) >= 1. )
d = min2( d, sdObj2( p, -0.707,-0.707,0.,0.,90.3,95.,142.6 ,7.5,-30.,-1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT1, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.707,-0.707,0.,0.,12.,72.4,207. ,15.,-30.,-1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT2, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.259,0.,0.,0.966,0.,31.74,193.14 ,7.5,-30.,1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT3, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.,-1.,0.,0.,90.3,95.,187.6 ,7.5,22.5,0.,2.,0. ) );
if( mod( g_traceBits.y / i_BIT4, 2. ) >= 1. )
d = min2( d, sdObj2( p, -0.001,-0.487,0.873,-0.019,90.187,70.137,202.487 ,7.5,-30.,1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT5, 2. ) >= 1. )
d = min2( d, sdObj2( p, -0.707,-0.707,0.,0.,19.5,12.4,207. ,7.5,-30.,-1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT6, 2. ) >= 1. )
d = min2( d, sdObj2( p, -0.707,-0.707,0.,0.,117.8,12.4,225.5 ,20.,-115.,-1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT7, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.,0.,0.707,0.707,12.,72.4,207. ,15.,-30.,-1.57,0.,2. ) );
if( mod( g_traceBits.y / i_BIT8, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.,-1.,0.,0.,4.5,12.4,207. ,7.5,40.,0.,0.,2. ) );
if( mod( g_traceBits.y / i_BIT9, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.,0.707,0.,0.707,99.5,12.4,287. ,7.5,20.,-40.,2.,0. ) );
if( mod( g_traceBits.z / i_BIT0, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.,0.,0.,1.,19.5,12.4,207. ,7.5,20.,40.,2.,0. ) );
if( mod( g_traceBits.z / i_BIT1, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.619,0.605,0.352,0.357,90.232,69.665,202.828 ,7.5,15.,-19.,2.,0. ) );
if( mod( g_traceBits.z / i_BIT2, 2. ) >= 1. )
d = min2( d, sdObj2( p, 0.,0.,0.707,-0.707,4.5,12.4,207. ,7.5,-30.,-1.57,0.,2. ) );
if( mod( g_traceBits.z / i_BIT3, 2. ) >= 1. )
d = min2( d, sdObj0( p, 0.,0.,0.,1.,117.8,12.4,225.5 ,20.,0.5,27.25 ) );
if( mod( g_traceBits.z / i_BIT4, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.617,-0.358,0.618,0.331,29.612,46.725,219.271 ,7.5,15.,-19.,2.,0. ) );
if( mod( g_traceBits.z / i_BIT5, 2. ) >= 1. )
d = min2( d, sdObj1( p, 0.,0.,0.,1.,0.,9.,37.7 ,7.5,52.3,0.,6.,0. ) );
if( mod( g_traceBits.z / i_BIT6, 2. ) >= 1. )
{
vec2 d1 = opSmoothUnion2(sdObj1( p, 0.259,0.,0.,0.966,0.,6.75,149.84 ,7.5,10.,0.,2.,0. ),sdObj1( p, 0.,0.,0.,1.,0.,9.,142.3 ,7.5,10.,0.,2.,0. ),5.);
d = min2( d, d1 );
}
return d;
}
float Xt( vec3 ro, vec3 rd, float dist )
{
traceBox( ro, rd, dist, g_traceBits.x, i_BIT6, 0.,0.,0.,1.,35.25,12.4,247.,25.25,9.5,25.25 );
traceBox( ro, rd, dist, g_traceBits.x, i_BIT7, 0.,0.707,0.,0.707,137.8,12.4,287.,8.5,1.5,21. );
traceBox( ro, rd, dist, g_traceBits.x, i_BIT8, 0.259,0.,0.,0.966,0.,16.75,167.16,8.5,8.5,16. );
traceBox( ro, rd, dist, g_traceBits.x, i_BIT9, 0.,0.,0.,1.,0.,9.,-12.3,16.,1.5,26. );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT0, -0.707,-0.707,0.,0.,90.3,105.75,142.6,20.25,9.5,20.25 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT1, 0.707,-0.707,0.,0.,12.,65.4,207.,24.,17.,24. );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT2, 0.259,0.,0.,0.966,10.75,31.74,193.14,20.25,9.5,20.25 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT3, 0.,-1.,0.,0.,90.3,95.,187.6,8.5,1.5,23.5 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT4, -0.001,-0.487,0.873,-0.019,79.445,70.513,202.668,20.25,9.5,20.25 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT5, -0.707,-0.707,0.,0.,19.5,23.15,207.,20.25,9.5,20.25 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT6, -0.707,-0.707,0.,0.,117.8,59.4,225.5,69.,22.,69. );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT7, 0.,0.,0.707,0.707,12.,65.4,207.,24.,17.,24. );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT8, 0.,-1.,0.,0.,20.25,12.4,207.,25.25,9.5,25.25 );
traceBox( ro, rd, dist, g_traceBits.y, i_BIT9, 0.,0.707,0.,0.707,99.5,12.4,287.,8.5,8.5,21. );
traceBox( ro, rd, dist, g_traceBits.z, i_BIT0, 0.,0.,0.,1.,19.5,12.4,207.,8.5,8.5,21. );
traceBox( ro, rd, dist, g_traceBits.z, i_BIT1, 0.619,0.605,0.352,0.357,90.232,69.665,202.828,8.5,8.5,16. );
traceBox( ro, rd, dist, g_traceBits.z, i_BIT2, 0.,0.,0.707,-0.707,4.5,23.15,207.,20.25,9.5,20.25 );
traceBox( ro, rd, dist, g_traceBits.z, i_BIT3, 0.,0.,0.,1.,117.8,12.4,225.5,20.,0.5,27.25 );
traceBox( ro, rd, dist, g_traceBits.z, i_BIT4, 0.617,-0.358,0.618,0.331,29.612,46.725,219.271,8.5,8.5,16. );
traceBox( ro, rd, dist, g_traceBits.z, i_BIT5, 0.,0.,0.,1.,0.,9.,37.7,8.5,1.5,53.3 );
traceBox( ro, rd, dist, g_traceBits.z, i_BIT6, 0.,0.,0.,1.,0.,9.,142.3,7.5,11.5,15.75 );
return dist < 10000. ? dist : -1.;
}
