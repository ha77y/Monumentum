Shader "Unlit/circle sight"
{
    Properties
    {
        _width("Width",float) = 0.1
        _size("Size",float) =1
        _colour("Colour",color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { 
            "RenderType"="Transparent"
            "Queue"="Transparent" 
            }
        
        
        Pass
        {

            blend one one 
            zwrite off
            cull off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            
            #include "UnityCG.cginc"
            
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };
            
            struct v2f
            {
                float2 uv : TEXCOORD0;
                
                float4 vertex : SV_POSITION;
            };

            float _width;
            float _size;
            float4 _colour;
            
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv =v.uv;
                return o;
            }
            
            fixed4 frag (v2f i) : SV_Target
            {
                //(x-a)^2+(y-b)^2=r^2
                float4 outp = (i.uv.x*2 -1)*(i.uv.x*2 -1) + (i.uv.y*2 - 1)*(i.uv.y*2 -1); 
                return (outp <=_size && outp >= _size-_width) * _colour; 
            }
            ENDCG
        }
    }
}
