Shader "Unlit/Geometry shader"
{
    Properties
    {
        
    }
    SubShader
    {
        Tags 
        {
            "RenderPipline" = "UniversalPipeline"
            "RenderType"="Opaque"
            "Queue" = "Geometry"
        }
        
        
        
        Pass
        {
            CGPROGRAM
// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays
#pragma exclude_renderers d3d11 gles
            #pragma vertex vert
            #pragma fragment frag
            #pragma geometry geo
            #pragma require geometry 

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2g
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            struct g2f 
            {
               float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            

            v2g vert (appdata v)
            {
                v2g o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                return o;
            }

            [maxvertexcount(7)]
            g2f geo (v2g z)
            {
                g2f o;
                
                o.vertex = z.vertex;
            }
            
            

            fixed4 frag (g2f i) : SV_Target
            {
                
                
                return 0;
            }
            ENDCG
        }
    }
}
