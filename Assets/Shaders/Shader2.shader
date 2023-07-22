Shader "Unlit/Shader2"
{
    Properties
    {
       
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            

            #include "UnityCG.cginc"

            struct MeshData
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normals : NORMAL;
            };

            struct Interpolator
            {
                float2 uv : TEXCOORD0;
                
                float4 vertex : SV_POSITION;
                float3 normals :TEXCOORD1;
            };

            

            Interpolator vert (MeshData v)
            {
                Interpolator o;
                o.uv = v.uv;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.normals = UnityObjectToWorldNormal(v.normals);
                return o;
            }

            fixed4 frag (Interpolator i) : SV_Target
            {
                return float4(i.normals.xyx,1);
            }
            ENDCG
        }
    }
}
