[General]
SyntaxVersion=2
BeginHotkey=90
BeginHotkeyMod=0
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=88
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=505b5d64-3b1a-456e-a860-043c439ed9c8
Description=月神希vs龙虾37632(非up31360)
Enable=0
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
/*
自动识别战场开始，进入战场前启动，龙虾给动作，暴击够就出分
建议低画质无特效120帧运行
1p 月光 超炮 观升牛
2p 神恩 原典 古古牛
3p 彼岸 毕业套
人偶仿犹大
*/


Sub 切神恩闪插切希儿(a, b, c)
/*
a: 神恩下来后延迟多少开始闪避 
b: 闪避之后延迟多久插十字架 
c: 插完十字架之后延迟多久切人
*/
	KeyDown "w", 1
	KeyPress "1", 1 // 神恩下来
	// 秒插十字架
	Delay (a)
	KeyPress "k", 1
	KeyUp "w", 1
	Delay(b)
	KeyPress "u", 1
	Delay(c)
	KeyPress "1", 1 // 黑希下来
	Delay(700) // qte耗时
End Sub

Sub 希儿普攻(time)
	KeyPress "j", 1
	Delay(time)
End Sub

Function 希儿普攻1()
	Call 希儿普攻(500)
End Function

Function 切神恩闪插切希儿1()
	Call 切神恩闪插切希儿(700,220,200)
End Function

Function 切神恩闪插切希儿2() // 第二波闪插距离和第一波不一样，需调整时间
	Call 切神恩闪插切希儿(900,220,740)
End Function


Function 切神恩再秒切希儿()
	KeyPress "1", 1 // 神恩下来秒切
	Delay (700)
	KeyPress "1", 1
	KeyPress "k", 1 // 完成秒切
	Delay (700)
End Function

Function 白希儿蓄力()
	KeyDown "j", 1
	Delay (1000)
	KeyUp "j", 1
	Delay(100)
End Function

Function 黑希儿蓄力()
	KeyDown "w", 1
	KeyDown "j", 1
	Delay (1000)
	KeyUp "j", 1
	KeyUp "w", 1
	Delay(600)
End Function


Function Main()

	//月光开始闪避
	
	Delay(400)
	KeyDown "w", 1
	KeyPress "k", 1
	Delay (600)
	KeyUp "w", 1
	
	Delay (1400)
	KeyPress "u", 1 // 武器主动
	Delay(400)
	
	切神恩闪插切希儿1
	Delay(200)
	// 希儿开始输出
	白希儿蓄力 
	
	KeyPress "i", 1 // 蓄力加大招完毕
	Delay (1500)
	
	// 大招后的第一个蓄力
	黑希儿蓄力 
	// 闪避再蓄力
	KeyDown "a", 1
	KeyPress "k", 1
	KeyUp "a", 1
	黑希儿蓄力 
	Delay(100)
	// A3下
	希儿普攻1 
	希儿普攻1 
//	希儿普攻1 // 2s流程
//	希儿普攻1 // 2s流程
	Delay (200)
	
	
	// 切月光下来闪避
	KeyPress "1", 1
	KeyDown "s", 1
	KeyDown "d", 1
	
	Delay (100)
	KeyPress "k", 1  // 闪避掉爆发状态自爆
	KeyUp "s", 1
	KeyUp "d", 1
	// 开始跑，拖时间，到16秒的时候再次闪避
	
	// 发一下呆
	Delay(1000)
	KeyDown "w", 1
	Delay (1000)
	KeyUp "d", 1
	KeyUp "w", 1
	Delay (2500)

	Delay(900)
	// 极限闪避
	KeyPress "k", 1
	Delay (6000)
	
	// 闪避量子攻击
	KeyPress "k", 1
	Delay (1000)
	
	// 攻击破盾
	KeyPress "l", 1 // 人偶
	KeyPress "j", 1
	Delay (300)
	KeyPress "u", 1
	Delay (400)
	切神恩闪插切希儿2
	
	黑希儿蓄力 
	Delay(300)
	KeyDown "a", 1
	KeyPress "k", 1
	KeyUp "a", 1
	黑希儿蓄力 
	Delay(300)
	希儿普攻1 
	希儿普攻1 
	希儿普攻1

	KeyPress "i",1

End Function



bh3 = Plugin.Window.Find(0,"崩坏3")
//TracePrint bh3
//sRect = Plugin.Window.GetWindowRect(bh3)
//TracePrint sRect
sRect = Plugin.Window.GetClientRect(bh3)
TracePrint sRect
dim MyArray   
MyArray = Split(sRect, "|")
screenX = Clng(MyArray(0))
screenY = Clng(MyArray(1))
screenX2 = Clng(MyArray(2))
screenY2 = Clng(MyArray(3))


// 盾条坐标
dx = -1 
dy = -1

// 血条位置
healthX = -1
healthY = - 1 

// 时间范围坐标
timeX = - 1 
timeY = -1
timeX2 = - 1 
timeY2 = - 1 

// 第一个重新开始按钮坐标
restartBtn1X = - 1 
restartBtn1Y = - 1 

// 第而个重新开始按钮坐标
restartBtn2X = - 1 
restartBtn2Y = - 1 

// 判断窗口分辨率
is1080p = False
is720p = False

If (screenX2 - screenX) >= 1920 Then 
    is1080p = True
    //盾条位置坐标
    dx = screenX + 562
    dy = screenY + 105
	
    //血条位置坐标
    healthX = screenX + 576 + 20
    healthY = screenY + 80
	
    // 时间范围坐标
    timeX = screenX + 880
    timeY = screenY + 148
    timeX2 = screenX + 1000
    timeY2 = screenY + 200
    
    // 开始图标位置
    startx = screenX + 68
    starty = screenY + 160

Else
    is720p = True

    //盾条位置坐标
    dx = screenX + 377
    dy = screenY + 86
    //血条位置坐标
    healthX = screenX + 382 + 20
    healthY = screenY + 68
    // 时间范围坐标
    timeX = screenX + 583
    timeY = screenY + 115
    timeX2 = screenX + 673
    timeY2 = screenY + 145
    
    // 开始图标位置
    startx = screenX + 46
    starty = screenY + 110
    
End If
TracePrint "开始图标" + CStr(startx) + "|" + CStr(starty)

TracePrint "时间坐标:" + Cstr(timeX) + "|" + cstr(timeY) + "|" + cstr(timeX2) + "|" + cstr(timeY2)


Global startTime
Global mainThread
Global brokenD



While 1

    IfColor startx, starty, "FF6000", 2 Then
        TracePrint ("start")
        Main 
        ExitScript
        //Delay(5000)
    End If
Wend
