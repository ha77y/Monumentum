Shader "Unlit/NewUnlitShader"
{
    Properties
    {
        
    }
    SubShader
    {
        Tags { "RenderType"="Transparent"
            "Queue"="Transparent" }

        Pass
        {
            zwrite off
            blend one one
            cull back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #define TAU 6.283185307179586

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

            

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float wave =(sin(5*i.uv.x*5 *TAU +_Time.y)+tan(cos(2.5*i.uv.x*5 -_Time.y)))/2 +0.5;
                float4 outwave = wave;
                return outwave;
            }
            ENDCG
        }
    }
}
