uniform sampler2D u_tex;
uniform sampler2D u_canvas;
uniform vec2 u_time;

float sdBox( vec2 p, vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}

float sign1( float x )
{
    return x >= 0. ? 1. : -1.;
}

vec3 sun( float y, vec3 sky )
{
    y += .02;
    float lightness = y < .5 ? pow(.5+.5*sin(200.*y*y), 5.) : 0.;
    return mix(mix(vec3(1,0,1), vec3(1),2.*y), y*sky, lightness );
}

//let togl = (x) => {let r = x.substr(0,2),g=x.substr(2,2),b=x.substr(4,2); return 'vec3('+([parseInt(r,16)+'.',parseInt(g,16)+'.',parseInt(b,16)+'.'].join(','))+')/255.;'}

void m0()
{
// =================================================================================================

    if( u_time.x == 0. )
    {
        gl_FragColor = vec4(0,0.05,0.05,1);
        return;
    }

    vec2 uvDelta = 1. / vec2(s_renderWidth., s_renderHeight.);
    vec2 uv = gl_FragCoord.xy * uvDelta;

// =================================================================================================
//  Render the game from the g buffer
    
    vec4 sample0 = texture2D( u_tex, uv + uvDelta * vec2(-0, -0) );
    vec4 sample1 = texture2D( u_tex, uv + uvDelta * vec2(-0, 1) );
    vec4 sample2 = texture2D( u_tex, uv + uvDelta * vec2(1, -0) );
    vec4 sample3 = texture2D( u_tex, uv + uvDelta * vec2(1, 1) );

    float material0 = abs( sample0.w );
    float material1 = abs( sample1.w );
    float material2 = abs( sample2.w );
    float material3 = abs( sample3.w );

    float d0 = material0 - material3;
    float d1 = material2 - material1;

    float edgeMat = sqrt( d0*d0 + d1*d1 );
    edgeMat = edgeMat > .1 ? 1. : 0.;

    vec3 n0 = sample0.xyz - sample3.xyz;
    vec3 n1 = sample2.xyz - sample1.xyz;
    float edgeNormal = sqrt(dot( n0, n0 ) + dot( n1, n1 ));
    edgeNormal = edgeNormal > .9 ? 1. : 0.;

    float edge = .1 + .9*max( edgeNormal, edgeMat );

    float maxMat = max( material0, max( material1, max( material2, material3 )));
    vec3 gameColor = vec3( .1 * maxMat );
    if( maxMat >= 1. && maxMat < 2. )
        gameColor = edge * vec3( 1, 0, 1 ) * mod( maxMat, .5 ) / .4;
    else if( maxMat >= 4. )
        gameColor = edge * vec3( 0, 1, 0 );
    else if( maxMat >= 3. )
        gameColor = edge * vec3( 0, .5, 1 );
    else if( maxMat >= 2. )
        gameColor = edge * vec3( 0, 0, 1 );
    else if( maxMat < 1. )
    {
        if( maxMat < .5 )
            gameColor = sun( maxMat / .5, vec3( .5, 0, 1 ));
        else 
            gameColor = ((maxMat - .5) / .5) * vec3( .5, 0, 1 );
    }

    if( sample0.w < 0. || sample1.w < 0. || sample2.w < 0. || sample3.w < 0. )
        gameColor *= .4;

// =================================================================================================
//  Compose the canvas

    float hide = uv.y > .1 && uv.y < .3 ? fract(u_time.y/.45) > .25?.7:0. : .7;
    vec3 hudColor = hide * texture2D( u_canvas, vec2( uv.x + (uv.y > .3 ? .5-.27-.5*uv.y : 0. ), 1.-uv.y )).rgb;

// =================================================================================================

    vec4 outColor = vec4( gameColor + hudColor, 0 );

// =================================================================================================
//  CRT power-on effect

    float t = u_time.y - u_time.x - .1;
    if( t < 1. )
    {
        vec4 c = outColor;
        outColor = vec4(0,0.05,.05,1);
        vec2 uv2 = uv - .5;
        if( t < .25 )
        {
            t = 4.*t;
            t = 1.-t;
            t = 1.-t*t*t;
            if( sdBox( uv2, vec2(.5*t, .01*t)) < 0. )
                outColor = vec4(1);
        }
        else if( t < 1. )
        {
            t = 1.3*(t-.25);
            t = 1.-t;
            t = 1.-t*t*t;
            if( sdBox( uv2, vec2(10., t)) < 0. )
                outColor = mix(vec4(1), c, t);
        }
    }

    gl_FragColor = outColor;
}

// =================================================================================================
// MattiasCRT effect by Mattias from https://www.shadertoy.com/view/Ms23DR
// ---------------------------------------------------------------------------------
void m1()
{
    vec2 uv = gl_FragCoord.xy / vec2( s_fullWidth, s_fullHeight );

    //gl_FragColor=texture2D(u_tex,uv);return;

    // curve
    uv = (uv - 0.5) * 2.0;
    uv *= 1.1;	
    uv.x *= 1.0 + pow((abs(uv.y) / 5.0), 2.0);
    uv.y *= 1.0 + pow((abs(uv.x) / 4.0), 2.0);
    uv  = (uv / 2.0) + 0.5;
    uv =  uv *0.92 + 0.04;

    vec3 col;
    float x =  sin(0.3*u_time.y+uv.y*21.0)*sin(0.7*u_time.y+uv.y*29.0)*sin(0.3+0.33*u_time.y+uv.y*31.0)*0.0017;

    col.r = texture2D(u_tex, vec2(x+uv.x+0.001,uv.y+0.001)).x+0.05;
    col.g = texture2D(u_tex, vec2(x+uv.x+0.000,uv.y-0.002)).y+0.05;
    col.b = texture2D(u_tex, vec2(x+uv.x-0.002,uv.y+0.000)).z+0.05;
    col.r += 0.08*texture2D(u_tex, 0.75*vec2(x+0.025, -0.027)+vec2(uv.x+0.001,uv.y+0.001)).x;
    col.g += 0.05*texture2D(u_tex, 0.75*vec2(x+-0.022, -0.02)+vec2(uv.x+0.000,uv.y-0.002)).y;
    col.b += 0.08*texture2D(u_tex, 0.75*vec2(x+-0.02, -0.018)+vec2(uv.x-0.002,uv.y+0.000)).z;

    col = clamp(col*0.6+0.4*col*col*1.0,0.0,1.0);
    float vig = (0.0 + 1.0*16.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y));
    col *= vec3(pow(vig,0.3));
    col *= vec3(0.95,1.05,0.95);
    col *= 2.8;

    //float scans = clamp( 0.35+0.35*sin(0.0*u_time.y+uv.y*1200.), 0.0, 1.0);
    //float scans = clamp( 0.35+0.35*sin(3.5*u_time.y+uv.y*s_fullHeight.*1.5), 0.0, 1.0);
    float scans = clamp( 0.35+0.35*sin(3.5*u_time.y+uv.y*s_fullHeight.*1.1), 0.0, 1.0);
    float s = pow(scans,1.7);
    col = col*vec3( 0.4+0.7*s) ;

    col *= 1.0+0.01*sin(110.0*u_time.y);
    if (uv.x < 0.0 || uv.x > 1.0) col *= 0.0;
    if (uv.y < 0.0 || uv.y > 1.0) col *= 0.0;
    
    col*=1.0-0.65*vec3(clamp((mod(gl_FragCoord.x, 2.0)-1.0)*2.0,0.0,1.0));
    gl_FragColor = vec4(col,1.0);
}