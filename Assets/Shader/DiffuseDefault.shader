// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "VertexInputSimple" {
	SubShader{
		Tags{ "Queue" = "Opaque" }




		Pass{
		Blend One Zero
		ZWrite Off

		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"


		struct vertexInput
	{
		float4 pos : POSITION;
		float4 color : COLOR;
		float3 normal : NORMAL;
	};

	struct v2f {
		float4 pos : SV_POSITION;
		fixed4 color : COLOR;
	};

	v2f vert(vertexInput v)
	{
		v2f o;
		o.pos = UnityObjectToClipPos(v.pos);



		o.pos.xyz += normalize(UnityObjectToClipPos(v.normal)) * 0.02;
		o.color.xyz = 0;
		o.color.w = 1.0;



		return o;
	}

	fixed4 frag(v2f i) : SV_Target{
		i.color.a = 1;
	return i.color;

	}
		ENDCG
	}





		//출처: http://usroom.tistory.com/entry/Unity-Fixed-Funtion-Shader-공부-Blend-Test [어른이의 공부방]
		Pass{
		Blend One Zero

		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"

		struct v2f {
		float4 pos : SV_POSITION;
		fixed4 color : COLOR;
	};

	v2f vert(appdata_base v)
	{
		v2f o;
		o.pos = UnityObjectToClipPos(v.vertex);
		o.color.xyz = v.normal * 0.5 + 0.5;
		o.color.w = 1.0;
		return o;
	}

	fixed4 frag(v2f i) : SV_Target{
		i.color.a = 1;
	return i.color;

	}
		ENDCG
	}

		
	}
}