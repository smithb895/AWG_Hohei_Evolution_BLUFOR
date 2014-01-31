 /******************************************************************************
 *                        ,1             ,-===========.
 *                       /,| _____________________\\_                _
 *    ,========.________//_|/===========._#############L_Y_....-----====//
 *   (#######(==========\################\=======.______ --############((
 *    `=======`"        ` ===============|::::.___|[ ))[JW]#############\\
 *                                       |####|     ""\###|   :##########\\
 *                                      /####/         \##\     ```"""=,,,))
 *     C R E A T E D   B Y   B T K     /####/           \##\
 *                                    '===='             `=`
 *******************************************************************************
 *
 *  The supported transporter types.
 *	Edit below.
 *
 *	You can use the whole class tree:
 *	http://community.bistudio.com/wiki/ArmA_2:_CfgVehicles
 *	http://community.bistudio.com/wiki/ArmA_2_OA:_CfgVehicles
 *
 ******************************************************************************/

 
//// Small
if (
(_Transporter isKindOf "AH6_Base_EP1") ||
(_Transporter isKindOf "Su25_base") ||
(_Transporter isKindOf "F35_base") ||
(_Transporter isKindOf "AV8B2") ||
(_Transporter isKindOf "A10") ||
(_Transporter isKindOf "AH1Z") ||
(_Transporter isKindOf "AH64D") ||
(_Transporter isKindOf "Kamov_Base") ||
(_Transporter isKindOf "An2_Base_EP1") ||
(_Transporter isKindOf "L39_base") ||
(_Transporter isKindOf "An2_Base_EP1") ||
(_Transporter isKindOf "AW159_Lynx_BAF") ||
(_Transporter isKindOf "MQ9PredatorB") // No OR || after the last entry!!
) then { _SelectedTransporterTypeS = true; };

//// Medium
if (
(_Transporter isKindOf "UH1_Base") ||
(_Transporter isKindOf "UH60_Base") ||
(_Transporter isKindOf "MH60s") ||
(_Transporter isKindOf "Mi24_Base") ||
(_Transporter isKindOf "UH1Y") ||
(_Transporter isKindOf "UH1H_base") // No OR || after the last entry!!
) then { _SelectedTransporterTypeM = true; };

//// Large
if (
(_Transporter isKindOf "CH47_base_EP1") ||
(_Transporter isKindOf "Mi17_base")// No OR || after the last entry!!
) then { _SelectedTransporterTypeL = true; };

//// XTRA Large
if (
(_Transporter isKindOf "C130J")||
(_Transporter isKindOf "MV22") // No OR || after the last entry!!
) then { _SelectedTransporterTypeXL = true; };