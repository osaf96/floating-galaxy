

uniform float uTime;
uniform float uSize;
attribute float aScale;
attribute vec3 aRandomness;


varying vec3 vColor;

void main(){
    // Position
           vec4 modelPosition = modelMatrix * vec4(position , 1.0); 

//  Spin
          float angle = atan(modelPosition.x , modelPosition.y);
          float distanceToCenter = length(modelPosition.xz);
          float angleoffset = ( 1.0 / distanceToCenter ) * uTime * 0.2;
          angle += angleoffset;
          modelPosition.x = cos(angle) * distanceToCenter;
          modelPosition.z = sin(angle) * distanceToCenter;
        //    adding randomness
          modelPosition.xyz += aRandomness;
          

           vec4 viewPosition = viewMatrix * modelPosition;
           vec4 projectionPosition = projectionMatrix * viewPosition;
           gl_Position = projectionPosition;

        //    size
        gl_PointSize = uSize * aScale;
        gl_PointSize *= ( 1.0 / - viewPosition.z );


// color
        vColor = color;

}