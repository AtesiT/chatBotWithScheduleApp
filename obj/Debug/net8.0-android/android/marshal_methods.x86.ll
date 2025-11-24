; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [323 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [640 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 66
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 65
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 106
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 239
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 273
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 39485524, ; 6: System.Net.WebSockets.dll => 0x25a8054 => 78
	i32 42639949, ; 7: System.Threading.Thread => 0x28aa24d => 141
	i32 66541672, ; 8: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 9: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 314
	i32 68219467, ; 10: System.Security.Cryptography.Primitives => 0x410f24b => 122
	i32 72070932, ; 11: Microsoft.Maui.Graphics.dll => 0x44bb714 => 191
	i32 82292897, ; 12: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 100
	i32 98325684, ; 13: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 178
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 257
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 105
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 257
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 135
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 277
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 75
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 122
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 213
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 130
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 259
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 147
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 311
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 312
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 211
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 31: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 177
	i32 230216969, ; 32: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 233
	i32 230752869, ; 33: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 34: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 35: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 89
	i32 261689757, ; 37: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 216
	i32 276479776, ; 38: System.Threading.Timer.dll => 0x107abf20 => 143
	i32 278686392, ; 39: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 235
	i32 280482487, ; 40: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 232
	i32 280992041, ; 41: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 283
	i32 291076382, ; 42: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 291275502, ; 43: Microsoft.Extensions.Http.dll => 0x115c82ee => 179
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 67
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 311
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 202
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 81
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 296
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 234
	i32 356389973, ; 50: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 295
	i32 360082299, ; 51: System.ServiceModel.Web => 0x15766b7b => 129
	i32 367780167, ; 52: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 53: System.Transactions.Local => 0x1658bf94 => 145
	i32 375677976, ; 54: System.Net.ServicePoint.dll => 0x16646418 => 72
	i32 379916513, ; 55: System.Threading.Thread.dll => 0x16a510e1 => 141
	i32 385762202, ; 56: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 57: System.Threading.ThreadPool.dll => 0x1766c1f7 => 142
	i32 395744057, ; 58: _Microsoft.Android.Resource.Designer => 0x17969339 => 319
	i32 403441872, ; 59: WindowsBase => 0x180c08d0 => 161
	i32 435591531, ; 60: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 307
	i32 441335492, ; 61: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 217
	i32 442565967, ; 62: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 63: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 230
	i32 451504562, ; 64: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 123
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 148
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 111
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 162
	i32 469710990, ; 68: System.dll => 0x1bff388e => 160
	i32 476646585, ; 69: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 232
	i32 486930444, ; 70: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 245
	i32 498788369, ; 71: System.ObjectModel => 0x1dbae811 => 82
	i32 500358224, ; 72: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 294
	i32 503918385, ; 73: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 288
	i32 513247710, ; 74: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 185
	i32 526420162, ; 75: System.Transactions.dll => 0x1f6088c2 => 146
	i32 527452488, ; 76: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 277
	i32 530272170, ; 77: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 539058512, ; 78: Microsoft.Extensions.Logging => 0x20216150 => 180
	i32 540030774, ; 79: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 80: System.Runtime.Extensions => 0x2080b118 => 101
	i32 546455878, ; 81: System.Runtime.Serialization.Xml => 0x20924146 => 112
	i32 549171840, ; 82: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 83: Jsr305Binding => 0x213954e7 => 270
	i32 569601784, ; 84: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 268
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 118
	i32 592146354, ; 86: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 302
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 89: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 117
	i32 627609679, ; 90: Xamarin.AndroidX.CustomView => 0x2568904f => 222
	i32 627931235, ; 91: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 300
	i32 639843206, ; 92: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 228
	i32 643868501, ; 93: System.Net => 0x2660a755 => 79
	i32 662205335, ; 94: System.Text.Encodings.Web.dll => 0x27787397 => 196
	i32 663517072, ; 95: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 264
	i32 666292255, ; 96: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 209
	i32 672442732, ; 97: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 98: System.Net.Security => 0x28bdabca => 71
	i32 688181140, ; 99: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 282
	i32 690569205, ; 100: System.Xml.Linq.dll => 0x29293ff5 => 151
	i32 691348768, ; 101: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 279
	i32 693804605, ; 102: System.Windows => 0x295a9e3d => 150
	i32 699345723, ; 103: System.Reflection.Emit => 0x29af2b3b => 90
	i32 700284507, ; 104: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 274
	i32 700358131, ; 105: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 706645707, ; 106: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 297
	i32 709557578, ; 107: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 285
	i32 713568204, ; 108: MauiApp1.dll => 0x2a882fcc => 0
	i32 720511267, ; 109: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 278
	i32 722857257, ; 110: System.Runtime.Loader.dll => 0x2b15ed29 => 107
	i32 731701662, ; 111: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 184
	i32 735137430, ; 112: System.Security.SecureString.dll => 0x2bd14e96 => 127
	i32 747884119, ; 113: Microsoft.Extensions.AI.Abstractions => 0x2c93ce57 => 171
	i32 752232764, ; 114: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 115: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 199
	i32 759454413, ; 116: System.Net.Requests => 0x2d445acd => 70
	i32 762598435, ; 117: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 118: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 119: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 306
	i32 789151979, ; 120: Microsoft.Extensions.Options => 0x2f0980eb => 183
	i32 790371945, ; 121: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 223
	i32 804715423, ; 122: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 123: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 237
	i32 823281589, ; 124: System.Private.Uri.dll => 0x311247b5 => 84
	i32 830298997, ; 125: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 126: System.Xml.XPath.dll => 0x31a103c6 => 156
	i32 834051424, ; 127: System.Net.Quic => 0x31b69d60 => 69
	i32 843511501, ; 128: Xamarin.AndroidX.Print => 0x3246f6cd => 250
	i32 873119928, ; 129: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 130: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 131: System.Net.Http.Json => 0x3463c971 => 195
	i32 904024072, ; 132: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 133: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 926902833, ; 134: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 309
	i32 928116545, ; 135: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 273
	i32 952186615, ; 136: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 103
	i32 956575887, ; 137: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 278
	i32 966729478, ; 138: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 271
	i32 967690846, ; 139: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 234
	i32 975236339, ; 140: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 141: System.Xml.XDocument => 0x3a2aaa1d => 154
	i32 986514023, ; 142: System.Private.DataContractSerialization.dll => 0x3acd0267 => 83
	i32 987214855, ; 143: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 144: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 145: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 1001831731, ; 146: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 147: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 254
	i32 1019214401, ; 148: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 149: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 176
	i32 1029334545, ; 150: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 284
	i32 1031528504, ; 151: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 272
	i32 1035644815, ; 152: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 207
	i32 1036536393, ; 153: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 154: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1048992957, ; 155: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 178
	i32 1052210849, ; 156: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 241
	i32 1067306892, ; 157: GoogleGson => 0x3f9dcf8c => 170
	i32 1082857460, ; 158: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 159: Xamarin.Kotlin.StdLib => 0x409e66d8 => 275
	i32 1098259244, ; 160: System => 0x41761b2c => 160
	i32 1118262833, ; 161: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 297
	i32 1121599056, ; 162: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 240
	i32 1127624469, ; 163: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 182
	i32 1149092582, ; 164: Xamarin.AndroidX.Window => 0x447dc2e6 => 267
	i32 1168523401, ; 165: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 303
	i32 1170634674, ; 166: System.Web.dll => 0x45c677b2 => 149
	i32 1175144683, ; 167: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 263
	i32 1178241025, ; 168: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 248
	i32 1203215381, ; 169: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 301
	i32 1204270330, ; 170: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 209
	i32 1208641965, ; 171: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1214827643, ; 172: CommunityToolkit.Mvvm => 0x4868cc7b => 169
	i32 1219128291, ; 173: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1234928153, ; 174: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 299
	i32 1243150071, ; 175: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 268
	i32 1253011324, ; 176: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 177: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 283
	i32 1264511973, ; 178: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 258
	i32 1267360935, ; 179: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 262
	i32 1273260888, ; 180: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 214
	i32 1275534314, ; 181: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 279
	i32 1278448581, ; 182: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 206
	i32 1293217323, ; 183: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 225
	i32 1309188875, ; 184: System.Private.DataContractSerialization => 0x4e08a30b => 83
	i32 1322716291, ; 185: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 267
	i32 1324164729, ; 186: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 187: System.Runtime.Serialization.Json.dll => 0x4f97822f => 110
	i32 1364015309, ; 188: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 189: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 313
	i32 1376866003, ; 190: Xamarin.AndroidX.SavedState => 0x52114ed3 => 254
	i32 1379779777, ; 191: System.Resources.ResourceManager => 0x523dc4c1 => 97
	i32 1402170036, ; 192: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 193: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 218
	i32 1408117620, ; 194: OllamaSharp.dll => 0x53ee2b74 => 192
	i32 1408764838, ; 195: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 109
	i32 1411638395, ; 196: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 99
	i32 1422545099, ; 197: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 100
	i32 1430672901, ; 198: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 281
	i32 1434145427, ; 199: System.Runtime.Handles => 0x557b5293 => 102
	i32 1435222561, ; 200: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 271
	i32 1439761251, ; 201: System.Net.Quic.dll => 0x55d10363 => 69
	i32 1452070440, ; 202: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 203: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 204: System.Runtime.Extensions.dll => 0x56e36530 => 101
	i32 1458022317, ; 205: System.Net.Security.dll => 0x56e7a7ad => 71
	i32 1461004990, ; 206: es\Microsoft.Maui.Controls.resources => 0x57152abe => 287
	i32 1461234159, ; 207: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 208: System.Security.Cryptography.OpenSsl => 0x57201017 => 121
	i32 1462112819, ; 209: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 210: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 208
	i32 1470490898, ; 211: Microsoft.Extensions.Primitives => 0x57a5e912 => 185
	i32 1479771757, ; 212: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 213: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 214: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 215: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 255
	i32 1493001747, ; 216: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 291
	i32 1505131794, ; 217: Microsoft.Extensions.Http => 0x59b67d12 => 179
	i32 1514721132, ; 218: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 286
	i32 1536373174, ; 219: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 220: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 134
	i32 1543355203, ; 221: System.Reflection.Emit.dll => 0x5bfdbb43 => 90
	i32 1550322496, ; 222: System.Reflection.Extensions.dll => 0x5c680b40 => 91
	i32 1551623176, ; 223: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 306
	i32 1565862583, ; 224: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 225: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 137
	i32 1573704789, ; 226: System.Runtime.Serialization.Json => 0x5dccd455 => 110
	i32 1580037396, ; 227: System.Threading.Overlapped => 0x5e2d7514 => 136
	i32 1582372066, ; 228: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 224
	i32 1592978981, ; 229: System.Runtime.Serialization.dll => 0x5ef2ee25 => 113
	i32 1597949149, ; 230: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 272
	i32 1601112923, ; 231: System.Xml.Serialization => 0x5f6f0b5b => 153
	i32 1603525486, ; 232: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x5f93db6e => 315
	i32 1604827217, ; 233: System.Net.WebClient => 0x5fa7b851 => 74
	i32 1618516317, ; 234: System.Net.WebSockets.Client.dll => 0x6078995d => 77
	i32 1622152042, ; 235: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 244
	i32 1622358360, ; 236: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 237: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 266
	i32 1635184631, ; 238: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 228
	i32 1636350590, ; 239: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 221
	i32 1639515021, ; 240: System.Net.Http.dll => 0x61b9038d => 62
	i32 1639986890, ; 241: System.Text.RegularExpressions => 0x61c036ca => 134
	i32 1641389582, ; 242: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 243: System.Runtime => 0x62c6282e => 114
	i32 1658241508, ; 244: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 260
	i32 1658251792, ; 245: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 269
	i32 1670060433, ; 246: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 216
	i32 1675553242, ; 247: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 248: System.Net.Primitives.dll => 0x63fca3d0 => 68
	i32 1678508291, ; 249: System.Net.WebSockets => 0x640c0103 => 78
	i32 1679769178, ; 250: System.Security.Cryptography => 0x641f3e5a => 124
	i32 1691477237, ; 251: System.Reflection.Metadata => 0x64d1e4f5 => 92
	i32 1696967625, ; 252: System.Security.Cryptography.Csp => 0x6525abc9 => 119
	i32 1698840827, ; 253: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 276
	i32 1701541528, ; 254: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 255: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 237
	i32 1726116996, ; 256: System.Reflection.dll => 0x66e27484 => 95
	i32 1728033016, ; 257: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 258: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 212
	i32 1736233607, ; 259: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 304
	i32 1743415430, ; 260: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 282
	i32 1744735666, ; 261: System.Transactions.Local.dll => 0x67fe8db2 => 145
	i32 1746115085, ; 262: System.IO.Pipelines.dll => 0x68139a0d => 194
	i32 1746316138, ; 263: Mono.Android.Export => 0x6816ab6a => 165
	i32 1750313021, ; 264: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 265: System.Resources.Reader.dll => 0x68cc9d1e => 96
	i32 1763938596, ; 266: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 267: System.Reflection.Extensions => 0x6942234e => 91
	i32 1766324549, ; 268: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 259
	i32 1770582343, ; 269: Microsoft.Extensions.Logging.dll => 0x6988f147 => 180
	i32 1776026572, ; 270: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 271: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 272: Mono.Android.Runtime.dll => 0x6a216153 => 166
	i32 1782862114, ; 273: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 298
	i32 1788241197, ; 274: Xamarin.AndroidX.Fragment => 0x6a96652d => 230
	i32 1793755602, ; 275: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 290
	i32 1808609942, ; 276: Xamarin.AndroidX.Loader => 0x6bcd3296 => 244
	i32 1813058853, ; 277: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 275
	i32 1813201214, ; 278: Xamarin.Google.Android.Material => 0x6c13413e => 269
	i32 1818569960, ; 279: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 249
	i32 1818787751, ; 280: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 281: System.Text.Encoding.Extensions => 0x6cbab720 => 132
	i32 1824722060, ; 282: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 109
	i32 1827303595, ; 283: Microsoft.VisualStudio.DesignTools.TapContract => 0x6cea70ab => 317
	i32 1828688058, ; 284: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 181
	i32 1842015223, ; 285: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 310
	i32 1847515442, ; 286: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 199
	i32 1853025655, ; 287: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 307
	i32 1858542181, ; 288: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 289: System.Reflection.Primitives => 0x6f7a29e4 => 93
	i32 1875935024, ; 290: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 289
	i32 1879696579, ; 291: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 292: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 210
	i32 1885918049, ; 293: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0x7068d361 => 317
	i32 1888955245, ; 294: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 295: System.Reflection.Metadata.dll => 0x70a66bdd => 92
	i32 1898237753, ; 296: System.Reflection.DispatchProxy => 0x7124cf39 => 87
	i32 1900610850, ; 297: System.Resources.ResourceManager.dll => 0x71490522 => 97
	i32 1910275211, ; 298: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 299: System.Private.Xml.Linq => 0x739bd4a8 => 85
	i32 1956758971, ; 300: System.Resources.Writer => 0x74a1c5bb => 98
	i32 1961813231, ; 301: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 256
	i32 1968388702, ; 302: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 172
	i32 1983156543, ; 303: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 276
	i32 1985761444, ; 304: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 201
	i32 2003115576, ; 305: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 286
	i32 2011961780, ; 306: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 307: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 241
	i32 2025202353, ; 308: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 281
	i32 2031763787, ; 309: Xamarin.Android.Glide => 0x791a414b => 198
	i32 2045470958, ; 310: System.Private.Xml => 0x79eb68ee => 86
	i32 2048278909, ; 311: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 174
	i32 2055257422, ; 312: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 236
	i32 2060060697, ; 313: System.Windows.dll => 0x7aca0819 => 150
	i32 2066184531, ; 314: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 285
	i32 2070888862, ; 315: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 316: System.Runtime.dll => 0x7bf8cdab => 114
	i32 2090596640, ; 317: System.Numerics.Vectors => 0x7c9bf920 => 80
	i32 2117912485, ; 318: Microsoft.VisualStudio.DesignTools.XamlTapContract.dll => 0x7e3cc7a5 => 318
	i32 2127167465, ; 319: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 320: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 321: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 158
	i32 2146852085, ; 322: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 323: Microsoft.Maui => 0x80bd55ad => 189
	i32 2169148018, ; 324: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 293
	i32 2181898931, ; 325: Microsoft.Extensions.Options.dll => 0x820d22b3 => 183
	i32 2192057212, ; 326: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 181
	i32 2193016926, ; 327: System.ObjectModel.dll => 0x82b6c85e => 82
	i32 2201107256, ; 328: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 280
	i32 2201231467, ; 329: System.Net.Http => 0x8334206b => 62
	i32 2207618523, ; 330: it\Microsoft.Maui.Controls.resources => 0x839595db => 295
	i32 2217644978, ; 331: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 263
	i32 2222056684, ; 332: System.Threading.Tasks.Parallel => 0x8471e4ec => 139
	i32 2244775296, ; 333: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 245
	i32 2252106437, ; 334: System.Xml.Serialization.dll => 0x863c6ac5 => 153
	i32 2256313426, ; 335: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 336: System.Security.AccessControl.dll => 0x8702d9a2 => 115
	i32 2266799131, ; 337: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 173
	i32 2267999099, ; 338: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 200
	i32 2270573516, ; 339: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 289
	i32 2279755925, ; 340: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 252
	i32 2293034957, ; 341: System.ServiceModel.Web.dll => 0x88acefcd => 129
	i32 2295906218, ; 342: System.Net.Sockets => 0x88d8bfaa => 73
	i32 2298471582, ; 343: System.Net.Mail => 0x88ffe49e => 64
	i32 2303942373, ; 344: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 299
	i32 2305521784, ; 345: System.Private.CoreLib.dll => 0x896b7878 => 168
	i32 2315684594, ; 346: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 204
	i32 2320631194, ; 347: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 139
	i32 2340441535, ; 348: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 104
	i32 2344264397, ; 349: System.ValueTuple => 0x8bbaa2cd => 147
	i32 2353062107, ; 350: System.Net.Primitives => 0x8c40e0db => 68
	i32 2368005991, ; 351: System.Xml.ReaderWriter.dll => 0x8d24e767 => 152
	i32 2371007202, ; 352: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 172
	i32 2378619854, ; 353: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 119
	i32 2383496789, ; 354: System.Security.Principal.Windows.dll => 0x8e114655 => 125
	i32 2395872292, ; 355: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 294
	i32 2401565422, ; 356: System.Web.HttpUtility => 0x8f24faee => 148
	i32 2403452196, ; 357: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 227
	i32 2409983638, ; 358: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x8fa56e96 => 316
	i32 2421380589, ; 359: System.Threading.Tasks.Dataflow => 0x905355ed => 137
	i32 2423080555, ; 360: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 214
	i32 2427813419, ; 361: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 291
	i32 2435356389, ; 362: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 363: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 364: System.Text.Encoding.dll => 0x924edee6 => 133
	i32 2458678730, ; 365: System.Net.Sockets.dll => 0x928c75ca => 73
	i32 2459001652, ; 366: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465532216, ; 367: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 217
	i32 2471841756, ; 368: netstandard.dll => 0x93554fdc => 163
	i32 2475788418, ; 369: Java.Interop.dll => 0x93918882 => 164
	i32 2480646305, ; 370: Microsoft.Maui.Controls => 0x93dba8a1 => 187
	i32 2483903535, ; 371: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 372: System.Net.ServicePoint => 0x94147f61 => 72
	i32 2490993605, ; 373: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 374: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 375: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 239
	i32 2522472828, ; 376: Xamarin.Android.Glide.dll => 0x9659e17c => 198
	i32 2538310050, ; 377: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 89
	i32 2550873716, ; 378: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 292
	i32 2562349572, ; 379: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 380: System.Text.Encodings.Web => 0x9930ee42 => 196
	i32 2581783588, ; 381: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 240
	i32 2581819634, ; 382: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 262
	i32 2585220780, ; 383: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 132
	i32 2585805581, ; 384: System.Net.Ping => 0x9a20430d => 67
	i32 2589602615, ; 385: System.Threading.ThreadPool => 0x9a5a3337 => 142
	i32 2593496499, ; 386: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 301
	i32 2605712449, ; 387: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 280
	i32 2615233544, ; 388: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 231
	i32 2616218305, ; 389: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 182
	i32 2617129537, ; 390: System.Private.Xml.dll => 0x9bfe3a41 => 86
	i32 2618712057, ; 391: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 94
	i32 2620871830, ; 392: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 221
	i32 2624644809, ; 393: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 226
	i32 2626831493, ; 394: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 296
	i32 2627185994, ; 395: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 396: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 397: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 235
	i32 2663391936, ; 398: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 200
	i32 2663698177, ; 399: System.Runtime.Loader => 0x9ec4cf01 => 107
	i32 2664396074, ; 400: System.Xml.XDocument.dll => 0x9ecf752a => 154
	i32 2665622720, ; 401: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 402: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 403: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 112
	i32 2693849962, ; 404: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 405: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 260
	i32 2715334215, ; 406: System.Threading.Tasks.dll => 0xa1d8b647 => 140
	i32 2717744543, ; 407: System.Security.Claims => 0xa1fd7d9f => 116
	i32 2719963679, ; 408: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 118
	i32 2724373263, ; 409: System.Runtime.Numerics.dll => 0xa262a30f => 108
	i32 2732626843, ; 410: Xamarin.AndroidX.Activity => 0xa2e0939b => 202
	i32 2735172069, ; 411: System.Threading.Channels => 0xa30769e5 => 135
	i32 2737747696, ; 412: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 208
	i32 2740948882, ; 413: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 414: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 103
	i32 2752995522, ; 415: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 302
	i32 2758225723, ; 416: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 188
	i32 2764765095, ; 417: Microsoft.Maui.dll => 0xa4caf7a7 => 189
	i32 2765824710, ; 418: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 131
	i32 2770495804, ; 419: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 274
	i32 2778768386, ; 420: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 265
	i32 2779977773, ; 421: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 253
	i32 2785988530, ; 422: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 308
	i32 2788224221, ; 423: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 231
	i32 2801831435, ; 424: Microsoft.Maui.Graphics => 0xa7008e0b => 191
	i32 2803228030, ; 425: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 155
	i32 2806116107, ; 426: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 287
	i32 2810250172, ; 427: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 218
	i32 2819470561, ; 428: System.Xml.dll => 0xa80db4e1 => 159
	i32 2821205001, ; 429: System.ServiceProcess.dll => 0xa8282c09 => 130
	i32 2821294376, ; 430: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 253
	i32 2824502124, ; 431: System.Xml.XmlDocument => 0xa85a7b6c => 157
	i32 2831556043, ; 432: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 300
	i32 2838993487, ; 433: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 242
	i32 2849599387, ; 434: System.Threading.Overlapped.dll => 0xa9d96f9b => 136
	i32 2853208004, ; 435: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 265
	i32 2855708567, ; 436: Xamarin.AndroidX.Transition => 0xaa36a797 => 261
	i32 2861098320, ; 437: Mono.Android.Export.dll => 0xaa88e550 => 165
	i32 2861189240, ; 438: Microsoft.Maui.Essentials => 0xaa8a4878 => 190
	i32 2870099610, ; 439: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 203
	i32 2875164099, ; 440: Jsr305Binding.dll => 0xab5f85c3 => 270
	i32 2875220617, ; 441: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 442: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 229
	i32 2887636118, ; 443: System.Net.dll => 0xac1dd496 => 79
	i32 2899753641, ; 444: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 445: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 446: System.Reflection => 0xacf080de => 95
	i32 2905242038, ; 447: mscorlib.dll => 0xad2a79b6 => 162
	i32 2909740682, ; 448: System.Private.CoreLib => 0xad6f1e8a => 168
	i32 2916838712, ; 449: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 266
	i32 2919462931, ; 450: System.Numerics.Vectors.dll => 0xae037813 => 80
	i32 2921128767, ; 451: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 205
	i32 2936416060, ; 452: System.Resources.Reader => 0xaf06273c => 96
	i32 2940926066, ; 453: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 454: System.Xml.XPath.XDocument => 0xaf624531 => 155
	i32 2959614098, ; 455: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 456: System.Security.Principal.Windows => 0xb0ed41f3 => 125
	i32 2971004615, ; 457: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 184
	i32 2972252294, ; 458: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 117
	i32 2978675010, ; 459: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 225
	i32 2987532451, ; 460: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 256
	i32 2996846495, ; 461: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 238
	i32 3016983068, ; 462: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 258
	i32 3017953105, ; 463: MauiApp1 => 0xb3e24f51 => 0
	i32 3020703001, ; 464: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 177
	i32 3023353419, ; 465: WindowsBase.dll => 0xb434b64b => 161
	i32 3024354802, ; 466: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 233
	i32 3038032645, ; 467: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 319
	i32 3056245963, ; 468: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 255
	i32 3057625584, ; 469: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 246
	i32 3059408633, ; 470: Mono.Android.Runtime => 0xb65adef9 => 166
	i32 3059793426, ; 471: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 472: System.Threading.Tasks => 0xb755818f => 140
	i32 3077302341, ; 473: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 293
	i32 3090735792, ; 474: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 123
	i32 3099732863, ; 475: System.Security.Claims.dll => 0xb8c22b7f => 116
	i32 3103600923, ; 476: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 477: System.Runtime.Serialization => 0xb979e222 => 113
	i32 3121463068, ; 478: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 479: System.Threading.Tasks.Extensions => 0xba4127cb => 138
	i32 3132293585, ; 480: System.Security.AccessControl => 0xbab301d1 => 115
	i32 3147165239, ; 481: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 482: GoogleGson.dll => 0xbba64c02 => 170
	i32 3159123045, ; 483: System.Reflection.Primitives.dll => 0xbc4c6465 => 93
	i32 3160747431, ; 484: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 485: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 247
	i32 3192346100, ; 486: System.Security.SecureString => 0xbe4755f4 => 127
	i32 3193515020, ; 487: System.Web => 0xbe592c0c => 149
	i32 3204380047, ; 488: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 489: System.Xml.XmlDocument.dll => 0xbf506931 => 157
	i32 3211777861, ; 490: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 224
	i32 3217618498, ; 491: Microsoft.VisualStudio.DesignTools.XamlTapContract => 0xbfc8f642 => 318
	i32 3220365878, ; 492: System.Threading => 0xbff2e236 => 144
	i32 3226221578, ; 493: System.Runtime.Handles.dll => 0xc04c3c0a => 102
	i32 3251039220, ; 494: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 87
	i32 3258312781, ; 495: Xamarin.AndroidX.CardView => 0xc235e84d => 212
	i32 3265493905, ; 496: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 497: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 138
	i32 3277815716, ; 498: System.Resources.Writer.dll => 0xc35f7fa4 => 98
	i32 3279906254, ; 499: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 500: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 501: System.Security.Cryptography.Encoding => 0xc4251ff9 => 120
	i32 3299363146, ; 502: System.Text.Encoding => 0xc4a8494a => 133
	i32 3303498502, ; 503: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 504: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 288
	i32 3316684772, ; 505: System.Net.Requests.dll => 0xc5b097e4 => 70
	i32 3317135071, ; 506: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 222
	i32 3317144872, ; 507: System.Data => 0xc5b79d28 => 24
	i32 3326051898, ; 508: OllamaSharp => 0xc63f863a => 192
	i32 3340431453, ; 509: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 210
	i32 3345895724, ; 510: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 251
	i32 3346324047, ; 511: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 248
	i32 3357674450, ; 512: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 305
	i32 3358260929, ; 513: System.Text.Json => 0xc82afec1 => 197
	i32 3362336904, ; 514: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 203
	i32 3362522851, ; 515: Xamarin.AndroidX.Core => 0xc86c06e3 => 219
	i32 3366347497, ; 516: Java.Interop => 0xc8a662e9 => 164
	i32 3374999561, ; 517: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 252
	i32 3381016424, ; 518: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 284
	i32 3395150330, ; 519: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 99
	i32 3403906625, ; 520: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 121
	i32 3405233483, ; 521: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 223
	i32 3421170118, ; 522: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 174
	i32 3428513518, ; 523: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 175
	i32 3429136800, ; 524: System.Xml => 0xcc6479a0 => 159
	i32 3430777524, ; 525: netstandard => 0xcc7d82b4 => 163
	i32 3441283291, ; 526: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 226
	i32 3445260447, ; 527: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 528: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 186
	i32 3463511458, ; 529: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 292
	i32 3471940407, ; 530: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 531: Mono.Android => 0xcf3163e6 => 167
	i32 3479583265, ; 532: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 305
	i32 3484440000, ; 533: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 304
	i32 3485117614, ; 534: System.Text.Json.dll => 0xcfbaacae => 197
	i32 3486566296, ; 535: System.Transactions => 0xcfd0c798 => 146
	i32 3493954962, ; 536: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 215
	i32 3509114376, ; 537: System.Xml.Linq => 0xd128d608 => 151
	i32 3515174580, ; 538: System.Security.dll => 0xd1854eb4 => 128
	i32 3530912306, ; 539: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 540: System.Net.HttpListener => 0xd2ff69f1 => 63
	i32 3560100363, ; 541: System.Threading.Timer => 0xd432d20b => 143
	i32 3570554715, ; 542: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 543: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 312
	i32 3597029428, ; 544: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 201
	i32 3598340787, ; 545: System.Net.WebSockets.Client => 0xd67a52b3 => 77
	i32 3608519521, ; 546: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 547: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 104
	i32 3627220390, ; 548: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 250
	i32 3633644679, ; 549: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 205
	i32 3638274909, ; 550: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 551: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 236
	i32 3643446276, ; 552: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 309
	i32 3643854240, ; 553: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 247
	i32 3645089577, ; 554: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 555: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 173
	i32 3660523487, ; 556: System.Net.NetworkInformation => 0xda2f27df => 66
	i32 3672681054, ; 557: Mono.Android.dll => 0xdae8aa5e => 167
	i32 3676670898, ; 558: Microsoft.Maui.Controls.HotReload.Forms => 0xdb258bb2 => 315
	i32 3682565725, ; 559: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 211
	i32 3684561358, ; 560: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 215
	i32 3697841164, ; 561: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 314
	i32 3700866549, ; 562: System.Net.WebProxy.dll => 0xdc96bdf5 => 76
	i32 3706696989, ; 563: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 220
	i32 3716563718, ; 564: System.Runtime.Intrinsics => 0xdd864306 => 106
	i32 3718780102, ; 565: Xamarin.AndroidX.Annotation => 0xdda814c6 => 204
	i32 3724971120, ; 566: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 246
	i32 3732100267, ; 567: System.Net.NameResolution => 0xde7354ab => 65
	i32 3737834244, ; 568: System.Net.Http.Json.dll => 0xdecad304 => 195
	i32 3748608112, ; 569: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 193
	i32 3751444290, ; 570: System.Xml.XPath => 0xdf9a7f42 => 156
	i32 3786282454, ; 571: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 213
	i32 3792276235, ; 572: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3794432727, ; 573: Microsoft.Extensions.AI.Abstractions.dll => 0xe22a72d7 => 171
	i32 3800979733, ; 574: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 186
	i32 3802395368, ; 575: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 576: System.Net.WebProxy => 0xe3a54a09 => 76
	i32 3823082795, ; 577: System.Security.Cryptography.dll => 0xe3df9d2b => 124
	i32 3829621856, ; 578: System.Numerics.dll => 0xe4436460 => 81
	i32 3841636137, ; 579: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 176
	i32 3844307129, ; 580: System.Net.Mail.dll => 0xe52378b9 => 64
	i32 3849253459, ; 581: System.Runtime.InteropServices.dll => 0xe56ef253 => 105
	i32 3870376305, ; 582: System.Net.HttpListener.dll => 0xe6b14171 => 63
	i32 3873536506, ; 583: System.Security.Principal => 0xe6e179fa => 126
	i32 3875112723, ; 584: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 120
	i32 3885497537, ; 585: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 75
	i32 3885922214, ; 586: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 261
	i32 3888767677, ; 587: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 251
	i32 3889960447, ; 588: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 313
	i32 3896106733, ; 589: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 590: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 219
	i32 3901907137, ; 591: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 592: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 593: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 264
	i32 3928044579, ; 594: System.Xml.ReaderWriter => 0xea213423 => 152
	i32 3930554604, ; 595: System.Security.Principal.dll => 0xea4780ec => 126
	i32 3931092270, ; 596: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 249
	i32 3945713374, ; 597: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 598: System.Text.Encoding.CodePages => 0xebac8bfe => 131
	i32 3955647286, ; 599: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 207
	i32 3959773229, ; 600: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 238
	i32 3980434154, ; 601: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 308
	i32 3987592930, ; 602: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 290
	i32 4003436829, ; 603: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 604: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 206
	i32 4023392905, ; 605: System.IO.Pipelines => 0xefd01a89 => 194
	i32 4025784931, ; 606: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 607: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 188
	i32 4054681211, ; 608: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 88
	i32 4068434129, ; 609: System.Private.Xml.Linq.dll => 0xf27f60d1 => 85
	i32 4073602200, ; 610: System.Threading.dll => 0xf2ce3c98 => 144
	i32 4094352644, ; 611: Microsoft.Maui.Essentials.dll => 0xf40add04 => 190
	i32 4099507663, ; 612: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 613: System.Private.Uri => 0xf462c30d => 84
	i32 4101593132, ; 614: Xamarin.AndroidX.Emoji2 => 0xf479582c => 227
	i32 4102112229, ; 615: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 303
	i32 4125707920, ; 616: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 298
	i32 4126470640, ; 617: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 175
	i32 4127667938, ; 618: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 619: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 620: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 88
	i32 4150914736, ; 621: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 310
	i32 4151237749, ; 622: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 623: System.Xml.XmlSerializer => 0xf7e95c85 => 158
	i32 4161255271, ; 624: System.Reflection.TypeExtensions => 0xf807b767 => 94
	i32 4164802419, ; 625: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 626: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 111
	i32 4182413190, ; 627: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 243
	i32 4182880526, ; 628: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0xf951b10e => 316
	i32 4185676441, ; 629: System.Security => 0xf97c5a99 => 128
	i32 4196529839, ; 630: System.Net.WebClient.dll => 0xfa21f6af => 74
	i32 4213026141, ; 631: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 193
	i32 4256097574, ; 632: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 220
	i32 4258378803, ; 633: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 242
	i32 4260525087, ; 634: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 635: Microsoft.Maui.Controls.dll => 0xfea12dee => 187
	i32 4274623895, ; 636: CommunityToolkit.Mvvm.dll => 0xfec99597 => 169
	i32 4274976490, ; 637: System.Runtime.Numerics => 0xfecef6ea => 108
	i32 4292120959, ; 638: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 243
	i32 4294763496 ; 639: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 229
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [640 x i32] [
	i32 66, ; 0
	i32 65, ; 1
	i32 106, ; 2
	i32 239, ; 3
	i32 273, ; 4
	i32 47, ; 5
	i32 78, ; 6
	i32 141, ; 7
	i32 29, ; 8
	i32 314, ; 9
	i32 122, ; 10
	i32 191, ; 11
	i32 100, ; 12
	i32 178, ; 13
	i32 257, ; 14
	i32 105, ; 15
	i32 257, ; 16
	i32 135, ; 17
	i32 277, ; 18
	i32 75, ; 19
	i32 122, ; 20
	i32 13, ; 21
	i32 213, ; 22
	i32 130, ; 23
	i32 259, ; 24
	i32 147, ; 25
	i32 311, ; 26
	i32 312, ; 27
	i32 18, ; 28
	i32 211, ; 29
	i32 26, ; 30
	i32 177, ; 31
	i32 233, ; 32
	i32 1, ; 33
	i32 58, ; 34
	i32 41, ; 35
	i32 89, ; 36
	i32 216, ; 37
	i32 143, ; 38
	i32 235, ; 39
	i32 232, ; 40
	i32 283, ; 41
	i32 53, ; 42
	i32 179, ; 43
	i32 67, ; 44
	i32 311, ; 45
	i32 202, ; 46
	i32 81, ; 47
	i32 296, ; 48
	i32 234, ; 49
	i32 295, ; 50
	i32 129, ; 51
	i32 54, ; 52
	i32 145, ; 53
	i32 72, ; 54
	i32 141, ; 55
	i32 61, ; 56
	i32 142, ; 57
	i32 319, ; 58
	i32 161, ; 59
	i32 307, ; 60
	i32 217, ; 61
	i32 12, ; 62
	i32 230, ; 63
	i32 123, ; 64
	i32 148, ; 65
	i32 111, ; 66
	i32 162, ; 67
	i32 160, ; 68
	i32 232, ; 69
	i32 245, ; 70
	i32 82, ; 71
	i32 294, ; 72
	i32 288, ; 73
	i32 185, ; 74
	i32 146, ; 75
	i32 277, ; 76
	i32 59, ; 77
	i32 180, ; 78
	i32 50, ; 79
	i32 101, ; 80
	i32 112, ; 81
	i32 39, ; 82
	i32 270, ; 83
	i32 268, ; 84
	i32 118, ; 85
	i32 302, ; 86
	i32 51, ; 87
	i32 43, ; 88
	i32 117, ; 89
	i32 222, ; 90
	i32 300, ; 91
	i32 228, ; 92
	i32 79, ; 93
	i32 196, ; 94
	i32 264, ; 95
	i32 209, ; 96
	i32 8, ; 97
	i32 71, ; 98
	i32 282, ; 99
	i32 151, ; 100
	i32 279, ; 101
	i32 150, ; 102
	i32 90, ; 103
	i32 274, ; 104
	i32 44, ; 105
	i32 297, ; 106
	i32 285, ; 107
	i32 0, ; 108
	i32 278, ; 109
	i32 107, ; 110
	i32 184, ; 111
	i32 127, ; 112
	i32 171, ; 113
	i32 25, ; 114
	i32 199, ; 115
	i32 70, ; 116
	i32 54, ; 117
	i32 45, ; 118
	i32 306, ; 119
	i32 183, ; 120
	i32 223, ; 121
	i32 22, ; 122
	i32 237, ; 123
	i32 84, ; 124
	i32 42, ; 125
	i32 156, ; 126
	i32 69, ; 127
	i32 250, ; 128
	i32 3, ; 129
	i32 41, ; 130
	i32 195, ; 131
	i32 16, ; 132
	i32 52, ; 133
	i32 309, ; 134
	i32 273, ; 135
	i32 103, ; 136
	i32 278, ; 137
	i32 271, ; 138
	i32 234, ; 139
	i32 33, ; 140
	i32 154, ; 141
	i32 83, ; 142
	i32 31, ; 143
	i32 12, ; 144
	i32 50, ; 145
	i32 55, ; 146
	i32 254, ; 147
	i32 35, ; 148
	i32 176, ; 149
	i32 284, ; 150
	i32 272, ; 151
	i32 207, ; 152
	i32 34, ; 153
	i32 57, ; 154
	i32 178, ; 155
	i32 241, ; 156
	i32 170, ; 157
	i32 17, ; 158
	i32 275, ; 159
	i32 160, ; 160
	i32 297, ; 161
	i32 240, ; 162
	i32 182, ; 163
	i32 267, ; 164
	i32 303, ; 165
	i32 149, ; 166
	i32 263, ; 167
	i32 248, ; 168
	i32 301, ; 169
	i32 209, ; 170
	i32 28, ; 171
	i32 169, ; 172
	i32 51, ; 173
	i32 299, ; 174
	i32 268, ; 175
	i32 5, ; 176
	i32 283, ; 177
	i32 258, ; 178
	i32 262, ; 179
	i32 214, ; 180
	i32 279, ; 181
	i32 206, ; 182
	i32 225, ; 183
	i32 83, ; 184
	i32 267, ; 185
	i32 60, ; 186
	i32 110, ; 187
	i32 56, ; 188
	i32 313, ; 189
	i32 254, ; 190
	i32 97, ; 191
	i32 19, ; 192
	i32 218, ; 193
	i32 192, ; 194
	i32 109, ; 195
	i32 99, ; 196
	i32 100, ; 197
	i32 281, ; 198
	i32 102, ; 199
	i32 271, ; 200
	i32 69, ; 201
	i32 37, ; 202
	i32 31, ; 203
	i32 101, ; 204
	i32 71, ; 205
	i32 287, ; 206
	i32 9, ; 207
	i32 121, ; 208
	i32 45, ; 209
	i32 208, ; 210
	i32 185, ; 211
	i32 9, ; 212
	i32 42, ; 213
	i32 4, ; 214
	i32 255, ; 215
	i32 291, ; 216
	i32 179, ; 217
	i32 286, ; 218
	i32 30, ; 219
	i32 134, ; 220
	i32 90, ; 221
	i32 91, ; 222
	i32 306, ; 223
	i32 48, ; 224
	i32 137, ; 225
	i32 110, ; 226
	i32 136, ; 227
	i32 224, ; 228
	i32 113, ; 229
	i32 272, ; 230
	i32 153, ; 231
	i32 315, ; 232
	i32 74, ; 233
	i32 77, ; 234
	i32 244, ; 235
	i32 36, ; 236
	i32 266, ; 237
	i32 228, ; 238
	i32 221, ; 239
	i32 62, ; 240
	i32 134, ; 241
	i32 15, ; 242
	i32 114, ; 243
	i32 260, ; 244
	i32 269, ; 245
	i32 216, ; 246
	i32 47, ; 247
	i32 68, ; 248
	i32 78, ; 249
	i32 124, ; 250
	i32 92, ; 251
	i32 119, ; 252
	i32 276, ; 253
	i32 26, ; 254
	i32 237, ; 255
	i32 95, ; 256
	i32 27, ; 257
	i32 212, ; 258
	i32 304, ; 259
	i32 282, ; 260
	i32 145, ; 261
	i32 194, ; 262
	i32 165, ; 263
	i32 4, ; 264
	i32 96, ; 265
	i32 32, ; 266
	i32 91, ; 267
	i32 259, ; 268
	i32 180, ; 269
	i32 21, ; 270
	i32 40, ; 271
	i32 166, ; 272
	i32 298, ; 273
	i32 230, ; 274
	i32 290, ; 275
	i32 244, ; 276
	i32 275, ; 277
	i32 269, ; 278
	i32 249, ; 279
	i32 2, ; 280
	i32 132, ; 281
	i32 109, ; 282
	i32 317, ; 283
	i32 181, ; 284
	i32 310, ; 285
	i32 199, ; 286
	i32 307, ; 287
	i32 57, ; 288
	i32 93, ; 289
	i32 289, ; 290
	i32 38, ; 291
	i32 210, ; 292
	i32 317, ; 293
	i32 25, ; 294
	i32 92, ; 295
	i32 87, ; 296
	i32 97, ; 297
	i32 10, ; 298
	i32 85, ; 299
	i32 98, ; 300
	i32 256, ; 301
	i32 172, ; 302
	i32 276, ; 303
	i32 201, ; 304
	i32 286, ; 305
	i32 7, ; 306
	i32 241, ; 307
	i32 281, ; 308
	i32 198, ; 309
	i32 86, ; 310
	i32 174, ; 311
	i32 236, ; 312
	i32 150, ; 313
	i32 285, ; 314
	i32 32, ; 315
	i32 114, ; 316
	i32 80, ; 317
	i32 318, ; 318
	i32 20, ; 319
	i32 11, ; 320
	i32 158, ; 321
	i32 3, ; 322
	i32 189, ; 323
	i32 293, ; 324
	i32 183, ; 325
	i32 181, ; 326
	i32 82, ; 327
	i32 280, ; 328
	i32 62, ; 329
	i32 295, ; 330
	i32 263, ; 331
	i32 139, ; 332
	i32 245, ; 333
	i32 153, ; 334
	i32 40, ; 335
	i32 115, ; 336
	i32 173, ; 337
	i32 200, ; 338
	i32 289, ; 339
	i32 252, ; 340
	i32 129, ; 341
	i32 73, ; 342
	i32 64, ; 343
	i32 299, ; 344
	i32 168, ; 345
	i32 204, ; 346
	i32 139, ; 347
	i32 104, ; 348
	i32 147, ; 349
	i32 68, ; 350
	i32 152, ; 351
	i32 172, ; 352
	i32 119, ; 353
	i32 125, ; 354
	i32 294, ; 355
	i32 148, ; 356
	i32 227, ; 357
	i32 316, ; 358
	i32 137, ; 359
	i32 214, ; 360
	i32 291, ; 361
	i32 20, ; 362
	i32 14, ; 363
	i32 133, ; 364
	i32 73, ; 365
	i32 58, ; 366
	i32 217, ; 367
	i32 163, ; 368
	i32 164, ; 369
	i32 187, ; 370
	i32 15, ; 371
	i32 72, ; 372
	i32 6, ; 373
	i32 23, ; 374
	i32 239, ; 375
	i32 198, ; 376
	i32 89, ; 377
	i32 292, ; 378
	i32 1, ; 379
	i32 196, ; 380
	i32 240, ; 381
	i32 262, ; 382
	i32 132, ; 383
	i32 67, ; 384
	i32 142, ; 385
	i32 301, ; 386
	i32 280, ; 387
	i32 231, ; 388
	i32 182, ; 389
	i32 86, ; 390
	i32 94, ; 391
	i32 221, ; 392
	i32 226, ; 393
	i32 296, ; 394
	i32 30, ; 395
	i32 44, ; 396
	i32 235, ; 397
	i32 200, ; 398
	i32 107, ; 399
	i32 154, ; 400
	i32 34, ; 401
	i32 22, ; 402
	i32 112, ; 403
	i32 56, ; 404
	i32 260, ; 405
	i32 140, ; 406
	i32 116, ; 407
	i32 118, ; 408
	i32 108, ; 409
	i32 202, ; 410
	i32 135, ; 411
	i32 208, ; 412
	i32 53, ; 413
	i32 103, ; 414
	i32 302, ; 415
	i32 188, ; 416
	i32 189, ; 417
	i32 131, ; 418
	i32 274, ; 419
	i32 265, ; 420
	i32 253, ; 421
	i32 308, ; 422
	i32 231, ; 423
	i32 191, ; 424
	i32 155, ; 425
	i32 287, ; 426
	i32 218, ; 427
	i32 159, ; 428
	i32 130, ; 429
	i32 253, ; 430
	i32 157, ; 431
	i32 300, ; 432
	i32 242, ; 433
	i32 136, ; 434
	i32 265, ; 435
	i32 261, ; 436
	i32 165, ; 437
	i32 190, ; 438
	i32 203, ; 439
	i32 270, ; 440
	i32 39, ; 441
	i32 229, ; 442
	i32 79, ; 443
	i32 55, ; 444
	i32 36, ; 445
	i32 95, ; 446
	i32 162, ; 447
	i32 168, ; 448
	i32 266, ; 449
	i32 80, ; 450
	i32 205, ; 451
	i32 96, ; 452
	i32 29, ; 453
	i32 155, ; 454
	i32 18, ; 455
	i32 125, ; 456
	i32 184, ; 457
	i32 117, ; 458
	i32 225, ; 459
	i32 256, ; 460
	i32 238, ; 461
	i32 258, ; 462
	i32 0, ; 463
	i32 177, ; 464
	i32 161, ; 465
	i32 233, ; 466
	i32 319, ; 467
	i32 255, ; 468
	i32 246, ; 469
	i32 166, ; 470
	i32 16, ; 471
	i32 140, ; 472
	i32 293, ; 473
	i32 123, ; 474
	i32 116, ; 475
	i32 37, ; 476
	i32 113, ; 477
	i32 46, ; 478
	i32 138, ; 479
	i32 115, ; 480
	i32 33, ; 481
	i32 170, ; 482
	i32 93, ; 483
	i32 52, ; 484
	i32 247, ; 485
	i32 127, ; 486
	i32 149, ; 487
	i32 24, ; 488
	i32 157, ; 489
	i32 224, ; 490
	i32 318, ; 491
	i32 144, ; 492
	i32 102, ; 493
	i32 87, ; 494
	i32 212, ; 495
	i32 59, ; 496
	i32 138, ; 497
	i32 98, ; 498
	i32 5, ; 499
	i32 13, ; 500
	i32 120, ; 501
	i32 133, ; 502
	i32 27, ; 503
	i32 288, ; 504
	i32 70, ; 505
	i32 222, ; 506
	i32 24, ; 507
	i32 192, ; 508
	i32 210, ; 509
	i32 251, ; 510
	i32 248, ; 511
	i32 305, ; 512
	i32 197, ; 513
	i32 203, ; 514
	i32 219, ; 515
	i32 164, ; 516
	i32 252, ; 517
	i32 284, ; 518
	i32 99, ; 519
	i32 121, ; 520
	i32 223, ; 521
	i32 174, ; 522
	i32 175, ; 523
	i32 159, ; 524
	i32 163, ; 525
	i32 226, ; 526
	i32 38, ; 527
	i32 186, ; 528
	i32 292, ; 529
	i32 17, ; 530
	i32 167, ; 531
	i32 305, ; 532
	i32 304, ; 533
	i32 197, ; 534
	i32 146, ; 535
	i32 215, ; 536
	i32 151, ; 537
	i32 128, ; 538
	i32 19, ; 539
	i32 63, ; 540
	i32 143, ; 541
	i32 46, ; 542
	i32 312, ; 543
	i32 201, ; 544
	i32 77, ; 545
	i32 60, ; 546
	i32 104, ; 547
	i32 250, ; 548
	i32 205, ; 549
	i32 48, ; 550
	i32 236, ; 551
	i32 309, ; 552
	i32 247, ; 553
	i32 14, ; 554
	i32 173, ; 555
	i32 66, ; 556
	i32 167, ; 557
	i32 315, ; 558
	i32 211, ; 559
	i32 215, ; 560
	i32 314, ; 561
	i32 76, ; 562
	i32 220, ; 563
	i32 106, ; 564
	i32 204, ; 565
	i32 246, ; 566
	i32 65, ; 567
	i32 195, ; 568
	i32 193, ; 569
	i32 156, ; 570
	i32 213, ; 571
	i32 10, ; 572
	i32 171, ; 573
	i32 186, ; 574
	i32 11, ; 575
	i32 76, ; 576
	i32 124, ; 577
	i32 81, ; 578
	i32 176, ; 579
	i32 64, ; 580
	i32 105, ; 581
	i32 63, ; 582
	i32 126, ; 583
	i32 120, ; 584
	i32 75, ; 585
	i32 261, ; 586
	i32 251, ; 587
	i32 313, ; 588
	i32 8, ; 589
	i32 219, ; 590
	i32 2, ; 591
	i32 43, ; 592
	i32 264, ; 593
	i32 152, ; 594
	i32 126, ; 595
	i32 249, ; 596
	i32 23, ; 597
	i32 131, ; 598
	i32 207, ; 599
	i32 238, ; 600
	i32 308, ; 601
	i32 290, ; 602
	i32 28, ; 603
	i32 206, ; 604
	i32 194, ; 605
	i32 61, ; 606
	i32 188, ; 607
	i32 88, ; 608
	i32 85, ; 609
	i32 144, ; 610
	i32 190, ; 611
	i32 35, ; 612
	i32 84, ; 613
	i32 227, ; 614
	i32 303, ; 615
	i32 298, ; 616
	i32 175, ; 617
	i32 49, ; 618
	i32 6, ; 619
	i32 88, ; 620
	i32 310, ; 621
	i32 21, ; 622
	i32 158, ; 623
	i32 94, ; 624
	i32 49, ; 625
	i32 111, ; 626
	i32 243, ; 627
	i32 316, ; 628
	i32 128, ; 629
	i32 74, ; 630
	i32 193, ; 631
	i32 220, ; 632
	i32 242, ; 633
	i32 7, ; 634
	i32 187, ; 635
	i32 169, ; 636
	i32 108, ; 637
	i32 243, ; 638
	i32 229 ; 639
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
