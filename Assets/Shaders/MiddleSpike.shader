Shader "Unlit/MiddleSpike"
{
    Properties
    {
       // _HeightUpper("UpperHeight",range(0,1)) = 1
        //_HeightLower("LowerHeight",range(0,1)) = 0
        //_Middle("Middle",range(0,1)) =0.5
        _Width("Width",range(0,1)) =0.1
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
            };

            struct Interpolators
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

           // float _HeightUpper;
           // float _HeightLower;
            float _Middle;
            float _Width;

            Interpolators vert (MeshData v)
            {
                Interpolators o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                
                return o;
            }

            fixed4 frag (Interpolators i) : SV_Target
            {
                _Middle = sin(_Time.y)/2 +0.5;
                float top = _Middle+(_Width/2);
                float bottom = _Middle-(_Width/2);
                
                return(bottom<i.uv.y && i.uv.y<top);
               // return (_HeightLower<i.uv.y && i.uv.y< _HeightUpper);
            }
            ENDCG
        }
    }
}
