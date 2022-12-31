
package main

// +--------------------------------------------------------------+
// |                    Pure Colors and Greys                     |
// +--------------------------------------------------------------+
	NUM_PREDEF_PURE_COLORS       :: 6;
	NUM_PREDEF_GREYSCALE_COLORS  :: 16;
	
	Black_Value      :: 0xFF000000;
	Grey1_Value      :: 0xFF111111;
	Grey2_Value      :: 0xFF222222;
	Grey3_Value      :: 0xFF333333;
	Grey4_Value      :: 0xFF444444;
	Grey5_Value      :: 0xFF555555;
	Grey6_Value      :: 0xFF666666;
	Grey7_Value      :: 0xFF777777;
	Grey8_Value      :: 0xFF888888;
	Grey9_Value      :: 0xFF999999;
	Grey10_Value     :: 0xFFAAAAAA;
	Grey11_Value     :: 0xFFBBBBBB;
	Grey12_Value     :: 0xFFCCCCCC;
	Grey13_Value     :: 0xFFDDDDDD;
	Grey14_Value     :: 0xFFEEEEEE;
	White_Value      :: 0xFFFFFFFF;
	
	PureRed_Value    :: 0xFFFF0000;
	PureOrange_Value :: 0xFFFFA500;
	PureYellow_Value :: 0xFFFFFF00;
	PureGreen_Value  :: 0xFF008000;
	PureBlue_Value   :: 0xFF0000FF;
	PurePurple_Value :: 0xFF800080;
	
	Black      := NewColor(Black_Value);
	Grey1      := NewColor(Grey1_Value);
	Grey2      := NewColor(Grey2_Value);
	Grey3      := NewColor(Grey3_Value);
	Grey4      := NewColor(Grey4_Value);
	Grey5      := NewColor(Grey5_Value);
	Grey6      := NewColor(Grey6_Value);
	Grey7      := NewColor(Grey7_Value);
	Grey8      := NewColor(Grey8_Value);
	Grey9      := NewColor(Grey9_Value);
	Grey10     := NewColor(Grey10_Value);
	Grey11     := NewColor(Grey11_Value);
	Grey12     := NewColor(Grey12_Value);
	Grey13     := NewColor(Grey13_Value);
	Grey14     := NewColor(Grey14_Value);
	White      := NewColor(White_Value);
	PureRed    := NewColor(PureRed_Value);
	PureOrange := NewColor(PureOrange_Value);
	PureYellow := NewColor(PureYellow_Value);
	PureGreen  := NewColor(PureGreen_Value);
	PureBlue   := NewColor(PureBlue_Value);
	PurePurple := NewColor(PurePurple_Value);
// +--------------------------------------------------------------+

// +--------------------------------------------------------------+
// |                        Palette Colors                        |
// +--------------------------------------------------------------+
	NUM_PREDEF_PAL_COLORS :: 70;
	
	PalRedDarker_Value      :: 0xFFB91668;
	PalRedDark_Value        :: 0xFFE1126B;
	PalRed_Value            :: 0xFFF92672;
	PalRedLight_Value       :: 0xFFFB6C7F;
	PalRedLighter_Value     :: 0xFFFDB5A8;
	PalPinkDarker_Value     :: 0xFFBF2A83;
	PalPinkDark_Value       :: 0xFFD9368B;
	PalPink_Value           :: 0xFFED4E95;
	PalPinkLight_Value      :: 0xFFF088B8;
	PalPinkLighter_Value    :: 0xFFF6ACCD;
	PalOrangeDarker_Value   :: 0xFFBD7628;
	PalOrangeDark_Value     :: 0xFFE4861C;
	PalOrange_Value         :: 0xFFFD971F;
	PalOrangeLight_Value    :: 0xFFFEB64B;
	PalOrangeLighter_Value  :: 0xFFFED88F;
	PalHoneyDarker_Value    :: 0xFFD5A43E;
	PalHoneyDark_Value      :: 0xFFE9B34A;
	PalHoney_Value          :: 0xFFFDC459;
	PalHoneyLight_Value     :: 0xFFFED47A;
	PalHoneyLighter_Value   :: 0xFFFEE8AC;
	PalYellowDarker_Value   :: 0xFFB3B947;
	PalYellowDark_Value     :: 0xFFD5CE62;
	PalYellow_Value         :: 0xFFE6DB74;
	PalYellowLight_Value    :: 0xFFEFE48C;
	PalYellowLighter_Value  :: 0xFFF3ECAC;
	PalBananaDarker_Value   :: 0xFFB7BD2F;
	PalBananaDark_Value     :: 0xFFDAD942;
	PalBanana_Value         :: 0xFFEEE64F;
	PalBananaLight_Value    :: 0xFFF4EA6F;
	PalBananaLighter_Value  :: 0xFFF9F1A4;
	PalGreenDarker_Value    :: 0xFF76B434;
	PalGreenDark_Value      :: 0xFF8DCE2E;
	PalGreen_Value          :: 0xFFA6E22E;
	PalGreenLight_Value     :: 0xFFC3E753;
	PalGreenLighter_Value   :: 0xFFE1EE92;
	PalGrassDarker_Value    :: 0xFF608B4D;
	PalGrassDark_Value      :: 0xFF7DA641;
	PalGrass_Value          :: 0xFF92BB41;
	PalGrassLight_Value     :: 0xFFB3D05B;
	PalGrassLighter_Value   :: 0xFFD7E295;
	PalBlueDarker_Value     :: 0xFF2471EC;
	PalBlueDark_Value       :: 0xFF4585EE;
	PalBlue_Value           :: 0xFF669BEF;
	PalBlueLight_Value      :: 0xFF99B7DE;
	PalBlueLighter_Value    :: 0xFFCDD9DB;
	PalSkyDarker_Value      :: 0xFF24B1EC;
	PalSkyDark_Value        :: 0xFF45C9EE;
	PalSky_Value            :: 0xFF66D9EF;
	PalSkyLight_Value       :: 0xFF99E1DE;
	PalSkyLighter_Value     :: 0xFFCDEDDB;
	PalPurpleDarker_Value   :: 0xFF7445FF;
	PalPurpleDark_Value     :: 0xFF9161FF;
	PalPurple_Value         :: 0xFFAE81FF;
	PalPurpleLight_Value    :: 0xFFCBAAEA;
	PalPurpleLighter_Value  :: 0xFFD6BBEE;
	PalVioletDarker_Value   :: 0xFFC038FF;
	PalVioletDark_Value     :: 0xFFC95BFF;
	PalViolet_Value         :: 0xFFDD7BFF;
	PalVioletLight_Value    :: 0xFFE595FF;
	PalVioletLighter_Value  :: 0xFFEBAAFF;
	PalNeutralDarker_Value  :: 0xFF5E5E4A;
	PalNeutralDark_Value    :: 0xFF75715E;
	PalNeutral_Value        :: 0xFF908861;
	PalNeutralLight_Value   :: 0xFFA79C65;
	PalNeutralLighter_Value :: 0xFFB9B084;
	
	PalBackgroundDarker_Value  :: 0xFF131410;
	PalBackgroundDark_Value    :: 0xFF1F221A;
	PalBackground_Value        :: 0xFF272822;
	PalBackgroundLight_Value   :: 0xFF424431;
	PalBackgroundLighter_Value :: 0xFF545934;
	PalGreyDarker_Value        :: 0xFF64635B;
	PalGreyDark_Value          :: 0xFF707067;
	PalGrey_Value              :: 0xFF7D7C72;
	PalGreyLight_Value         :: 0xFF98978E;
	PalGreyLighter_Value       :: 0xFFB1B1AA;
	PalBlackDarker_Value       :: 0xFF121211;
	PalBlackDark_Value         :: 0xFF1E1E1D;
	PalBlack_Value             :: 0xFF262624;
	PalBlackLight_Value        :: 0xFF3C3C39;
	PalBlackLighter_Value      :: 0xFF53534E;
	
	PalRedDarker            := NewColor(PalRedDarker_Value);
	PalRedDark              := NewColor(PalRedDark_Value);
	PalRed                  := NewColor(PalRed_Value);
	PalRedLight             := NewColor(PalRedLight_Value);
	PalRedLighter           := NewColor(PalRedLighter_Value);
	PalPinkDarker           := NewColor(PalPinkDarker_Value);
	PalPinkDark             := NewColor(PalPinkDark_Value);
	PalPink                 := NewColor(PalPink_Value);
	PalPinkLight            := NewColor(PalPinkLight_Value);
	PalPinkLighter          := NewColor(PalPinkLighter_Value);
	PalOrangeDarker         := NewColor(PalOrangeDarker_Value);
	PalOrangeDark           := NewColor(PalOrangeDark_Value);
	PalOrange               := NewColor(PalOrange_Value);
	PalOrangeLight          := NewColor(PalOrangeLight_Value);
	PalOrangeLighter        := NewColor(PalOrangeLighter_Value);
	PalHoneyDarker          := NewColor(PalHoneyDarker_Value);
	PalHoneyDark            := NewColor(PalHoneyDark_Value);
	PalHoney                := NewColor(PalHoney_Value);
	PalHoneyLight           := NewColor(PalHoneyLight_Value);
	PalHoneyLighter         := NewColor(PalHoneyLighter_Value);
	PalYellowDarker         := NewColor(PalYellowDarker_Value);
	PalYellowDark           := NewColor(PalYellowDark_Value);
	PalYellow               := NewColor(PalYellow_Value);
	PalYellowLight          := NewColor(PalYellowLight_Value);
	PalYellowLighter        := NewColor(PalYellowLighter_Value);
	PalBananaDarker         := NewColor(PalBananaDarker_Value);
	PalBananaDark           := NewColor(PalBananaDark_Value);
	PalBanana               := NewColor(PalBanana_Value);
	PalBananaLight          := NewColor(PalBananaLight_Value);
	PalBananaLighter        := NewColor(PalBananaLighter_Value);
	PalGreenDarker          := NewColor(PalGreenDarker_Value);
	PalGreenDark            := NewColor(PalGreenDark_Value);
	PalGreen                := NewColor(PalGreen_Value);
	PalGreenLight           := NewColor(PalGreenLight_Value);
	PalGreenLighter         := NewColor(PalGreenLighter_Value);
	PalGrassDarker          := NewColor(PalGrassDarker_Value);
	PalGrassDark            := NewColor(PalGrassDark_Value);
	PalGrass                := NewColor(PalGrass_Value);
	PalGrassLight           := NewColor(PalGrassLight_Value);
	PalGrassLighter         := NewColor(PalGrassLighter_Value);
	PalBlueDarker           := NewColor(PalBlueDarker_Value);
	PalBlueDark             := NewColor(PalBlueDark_Value);
	PalBlue                 := NewColor(PalBlue_Value);
	PalBlueLight            := NewColor(PalBlueLight_Value);
	PalBlueLighter          := NewColor(PalBlueLighter_Value);
	PalSkyDarker            := NewColor(PalSkyDarker_Value);
	PalSkyDark              := NewColor(PalSkyDark_Value);
	PalSky                  := NewColor(PalSky_Value);
	PalSkyLight             := NewColor(PalSkyLight_Value);
	PalSkyLighter           := NewColor(PalSkyLighter_Value);
	PalPurpleDarker         := NewColor(PalPurpleDarker_Value);
	PalPurpleDark           := NewColor(PalPurpleDark_Value);
	PalPurple               := NewColor(PalPurple_Value);
	PalPurpleLight          := NewColor(PalPurpleLight_Value);
	PalPurpleLighter        := NewColor(PalPurpleLighter_Value);
	PalVioletDarker         := NewColor(PalVioletDarker_Value);
	PalVioletDark           := NewColor(PalVioletDark_Value);
	PalViolet               := NewColor(PalViolet_Value);
	PalVioletLight          := NewColor(PalVioletLight_Value);
	PalVioletLighter        := NewColor(PalVioletLighter_Value);
	PalNeutralDarker        := NewColor(PalNeutralDarker_Value);
	PalNeutralDark          := NewColor(PalNeutralDark_Value);
	PalNeutral              := NewColor(PalNeutral_Value);
	PalNeutralLight         := NewColor(PalNeutralLight_Value);
	PalNeutralLighter       := NewColor(PalNeutralLighter_Value);
	
	PalBackgroundDarker     := NewColor(PalBackgroundDarker_Value);
	PalBackgroundDark       := NewColor(PalBackgroundDark_Value);
	PalBackground           := NewColor(PalBackground_Value);
	PalBackgroundLight      := NewColor(PalBackgroundLight_Value);
	PalBackgroundLighter    := NewColor(PalBackgroundLighter_Value);
	PalGreyDarker           := NewColor(PalGreyDarker_Value);
	PalGreyDark             := NewColor(PalGreyDark_Value);
	PalGrey                 := NewColor(PalGrey_Value);
	PalGreyLight            := NewColor(PalGreyLight_Value);
	PalGreyLighter          := NewColor(PalGreyLighter_Value);
	PalBlackDarker          := NewColor(PalBlackDarker_Value);
	PalBlackDark            := NewColor(PalBlackDark_Value);
	PalBlack                := NewColor(PalBlack_Value);
	PalBlackLight           := NewColor(PalBlackLight_Value);
	PalBlackLighter         := NewColor(PalBlackLighter_Value);
	
	GetPredefPalColorByIndex :: proc(#any_int index: int) -> Color_t
	{
		switch (index % NUM_PREDEF_PAL_COLORS)
		{
			case 0:  return PalRed;
			case 1:  return PalOrange;
			case 2:  return PalYellow;
			case 3:  return PalGreen;
			case 4:  return PalBlue;
			case 5:  return PalPurple;
			case 6:  return PalNeutral;
			
			case 7:  return PalRedLight;
			case 8:  return PalOrangeLight;
			case 9:  return PalYellowLight;
			case 10: return PalGreenLight;
			case 11: return PalBlueLight;
			case 12: return PalPurpleLight;
			case 13: return PalNeutralLight;
			
			case 14: return PalRedDark;
			case 15: return PalOrangeDark;
			case 16: return PalYellowDark;
			case 17: return PalGreenDark;
			case 18: return PalBlueDark;
			case 19: return PalPurpleDark;
			case 20: return PalNeutralDark;
			
			case 21: return PalPink;
			case 22: return PalHoney;
			case 23: return PalBanana;
			case 24: return PalGrass;
			case 25: return PalSky;
			case 26: return PalViolet;
			case 27: return PalGrey;
			
			case 28: return PalPinkLight;
			case 29: return PalHoneyLight;
			case 30: return PalBananaLight;
			case 31: return PalGrassLight;
			case 32: return PalSkyLight;
			case 33: return PalVioletLight;
			case 34: return PalGreyLight;
			
			case 35: return PalPinkDark;
			case 36: return PalHoneyDark;
			case 37: return PalBananaDark;
			case 38: return PalGrassDark;
			case 39: return PalSkyDark;
			case 40: return PalVioletDark;
			case 41: return PalGreyDark;
			
			case 42: return PalRedLighter;
			case 43: return PalOrangeLighter;
			case 44: return PalYellowLighter;
			case 45: return PalGreenLighter;
			case 46: return PalBlueLighter;
			case 47: return PalPurpleLighter;
			case 48: return PalNeutralLighter;
			
			case 49: return PalPinkLighter;
			case 50: return PalHoneyLighter;
			case 51: return PalBananaLighter;
			case 52: return PalGrassLighter;
			case 53: return PalSkyLighter;
			case 54: return PalVioletLighter;
			case 55: return PalGreyLighter;
			
			case 56: return PalRedDarker;
			case 57: return PalOrangeDarker;
			case 58: return PalYellowDarker;
			case 59: return PalGreenDarker;
			case 60: return PalBlueDarker;
			case 61: return PalPurpleDarker;
			case 62: return PalNeutralDarker;
			
			case 63: return PalPinkDarker;
			case 64: return PalHoneyDarker;
			case 65: return PalBananaDarker;
			case 66: return PalGrassDarker;
			case 67: return PalSkyDarker;
			case 68: return PalVioletDarker;
			case 69: return PalGreyDarker;
			
			case: return Black;
		}
	}
	GetIndexOfPredefPalColor :: proc(color: Color_t) -> u64
	{
		colorValue := GetColorValueU32(color);
		switch (colorValue)
		{
			case PalRed_Value:            return 0;
			case PalOrange_Value:         return 1;
			case PalYellow_Value:         return 2;
			case PalGreen_Value:          return 3;
			case PalBlue_Value:           return 4;
			case PalPurple_Value:         return 5;
			case PalNeutral_Value:        return 6;
			
			case PalRedLight_Value:       return 7;
			case PalOrangeLight_Value:    return 8;
			case PalYellowLight_Value:    return 9;
			case PalGreenLight_Value:     return 10;
			case PalBlueLight_Value:      return 11;
			case PalPurpleLight_Value:    return 12;
			case PalNeutralLight_Value:   return 13;
			
			case PalRedDark_Value:        return 14;
			case PalOrangeDark_Value:     return 15;
			case PalYellowDark_Value:     return 16;
			case PalGreenDark_Value:      return 17;
			case PalBlueDark_Value:       return 18;
			case PalPurpleDark_Value:     return 19;
			case PalNeutralDark_Value:    return 20;
			
			case PalPink_Value:           return 21;
			case PalHoney_Value:          return 22;
			case PalBanana_Value:         return 23;
			case PalGrass_Value:          return 24;
			case PalSky_Value:            return 25;
			case PalViolet_Value:         return 26;
			case PalGrey_Value:           return 27;
			
			case PalPinkLight_Value:      return 28;
			case PalHoneyLight_Value:     return 29;
			case PalBananaLight_Value:    return 30;
			case PalGrassLight_Value:     return 31;
			case PalSkyLight_Value:       return 32;
			case PalVioletLight_Value:    return 33;
			case PalGreyLight_Value:      return 34;
			
			case PalPinkDark_Value:       return 35;
			case PalHoneyDark_Value:      return 36;
			case PalBananaDark_Value:     return 37;
			case PalGrassDark_Value:      return 38;
			case PalSkyDark_Value:        return 39;
			case PalVioletDark_Value:     return 40;
			case PalGreyDark_Value:       return 41;
			
			case PalRedLighter_Value:     return 42;
			case PalOrangeLighter_Value:  return 43;
			case PalYellowLighter_Value:  return 44;
			case PalGreenLighter_Value:   return 45;
			case PalBlueLighter_Value:    return 46;
			case PalPurpleLighter_Value:  return 47;
			case PalNeutralLighter_Value: return 48;
			
			case PalPinkLighter_Value:    return 49;
			case PalHoneyLighter_Value:   return 50;
			case PalBananaLighter_Value:  return 51;
			case PalGrassLighter_Value:   return 52;
			case PalSkyLighter_Value:     return 53;
			case PalVioletLighter_Value:  return 54;
			case PalGreyLighter_Value:    return 55;
			
			case PalRedDarker_Value:      return 56;
			case PalOrangeDarker_Value:   return 57;
			case PalYellowDarker_Value:   return 58;
			case PalGreenDarker_Value:    return 59;
			case PalBlueDarker_Value:     return 60;
			case PalPurpleDarker_Value:   return 61;
			case PalNeutralDarker_Value:  return 62;
			
			case PalPinkDarker_Value:     return 63;
			case PalHoneyDarker_Value:    return 64;
			case PalBananaDarker_Value:   return 65;
			case PalGrassDarker_Value:    return 66;
			case PalSkyDarker_Value:      return 67;
			case PalVioletDarker_Value:   return 68;
			case PalGreyDarker_Value:     return 69;
			
			case: return NUM_PREDEF_PAL_COLORS;
		}
	}
// +--------------------------------------------------------------+

// +--------------------------------------------------------------+
// |                        Monokai Colors                        |
// +--------------------------------------------------------------+
	NUM_PREDEF_MONOKAI_COLORS :: 20;
	
	MonokaiBack_Value        :: 0xFF3B3A32;
	MonokaiYellow_Value      :: 0xFFE6DB74;
	MonokaiLightYellow_Value :: 0xFFFFE792;
	MonokaiFadedYellow_Value :: 0xFFFFEFB7;
	MonokaiPurple_Value      :: 0xFFAE81FF;
	MonokaiLightPurple_Value :: 0xFFE777FF;
	MonokaiGreen_Value       :: 0xFFA6E22E;
	MonokaiDarkGreen_Value   :: 0xFF829520;
	MonokaiOrange_Value      :: 0xFFFD971F;
	MonokaiBrown_Value       :: 0xFF9D550F;
	MonokaiMagenta_Value     :: 0xFFF92672;
	MonokaiRed_Value         :: 0xFFF83333;
	MonokaiLightRed_Value    :: 0xFFFF5959;
	MonokaiBlue_Value        :: 0xFF66D9EF;
	MonokaiLightBlue_Value   :: 0xFFA9FFFF;
	MonokaiWhite_Value       :: 0xFFF8F8F2;
	MonokaiLightGray_Value   :: 0xFFBBBBBB;
	MonokaiGray1_Value       :: 0xFFAFAFA2;
	MonokaiGray2_Value       :: 0xFF75715E;
	MonokaiDarkGray_Value    :: 0xFF212121;
	
	MonokaiBack        := NewColor(MonokaiBack_Value);
	MonokaiYellow      := NewColor(MonokaiYellow_Value);
	MonokaiLightYellow := NewColor(MonokaiLightYellow_Value);
	MonokaiFadedYellow := NewColor(MonokaiFadedYellow_Value);
	MonokaiPurple      := NewColor(MonokaiPurple_Value);
	MonokaiLightPurple := NewColor(MonokaiLightPurple_Value);
	MonokaiGreen       := NewColor(MonokaiGreen_Value);
	MonokaiDarkGreen   := NewColor(MonokaiDarkGreen_Value);
	MonokaiOrange      := NewColor(MonokaiOrange_Value);
	MonokaiBrown       := NewColor(MonokaiBrown_Value);
	MonokaiMagenta     := NewColor(MonokaiMagenta_Value);
	MonokaiRed         := NewColor(MonokaiRed_Value);
	MonokaiLightRed    := NewColor(MonokaiLightRed_Value);
	MonokaiBlue        := NewColor(MonokaiBlue_Value);
	MonokaiLightBlue   := NewColor(MonokaiLightBlue_Value);
	MonokaiWhite       := NewColor(MonokaiWhite_Value);
	MonokaiLightGray   := NewColor(MonokaiLightGray_Value);
	MonokaiGray1       := NewColor(MonokaiGray1_Value);
	MonokaiGray2       := NewColor(MonokaiGray2_Value);
	MonokaiDarkGray    := NewColor(MonokaiDarkGray_Value);
	
// +--------------------------------------------------------------+
